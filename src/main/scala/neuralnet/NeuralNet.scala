package neuralnet

import chisel3._
import chisel3.experimental.{ChiselEnum, FixedPoint}
import chisel3.util._
import neuralnet.NeuralNet._

//todo: parameterize some of these things
object NeuralNet {
  object NeuronState extends ChiselEnum {
    val ready, reset, forwardProp, backwardProp = Value
  }

  val ready :: writingTrainingData :: trainingForwardProp :: trainingBackwardProp :: predicting :: Nil = Enum(5)

  sealed trait LayerType {
    def params: LayerParams
  }
  case class FCLayer(params: FullyConnectedLayerParams) extends LayerType
  case class ALayer(params: LayerParams) extends LayerType
}

case class NeuralNetParams(
                            inputSize: Int,
                            outputSize: Int,
                            trainingEpochs: Int,
                            maxTrainingSamples: Int,
                            dataWidth: Int,
                            dataBinaryPoint: Int,
                            layers: Seq[LayerType])

/**
 * IO for the neural net. The sample is used as input both for training and predicting, while the validation
 * is only used for training. Result is only valid during predicting.
 */
class NeuralNetIO(params: NeuralNetParams) extends Bundle {
  val train = Input(Bool())
  val predict = Input(Bool())
  val sample = Input(Vec(params.inputSize, FixedPoint(params.dataWidth.W, params.dataBinaryPoint.BP)))
  val validation = Input(Vec(params.inputSize, FixedPoint(params.dataWidth.W, params.dataBinaryPoint.BP)))
  val numSamples = Flipped(Decoupled(UInt(32.W)))
  val result = Decoupled(Vec(params.outputSize, FixedPoint(params.dataWidth.W, params.dataBinaryPoint.BP)))
  // for testing purposes
  val state = Output(UInt(log2Ceil(5).W))
  val epoch = Output(UInt(log2Ceil(params.trainingEpochs).W))
  val layer = Output(UInt(log2Ceil(params.layers.size).W))
}

class NeuralNet(
                 params: NeuralNetParams,
                 layerFactory: LayerFactory) extends Module {

  val io = IO(new NeuralNetIO(params))

  // Way to define a set of layers with registers to hold the output from each layer. Output from one layer is used
  // as input to next layer for forward propagation. Goal is to get this working, then think about optimization.
  val layersWithOutputRegs = params.layers.map { layer =>
    val initializedLayer = layerFactory(params, layer)
    initializedLayer.io.nextState.valid := false.B
    initializedLayer.io.nextState.bits := NeuronState.ready
    initializedLayer.io.input.valid := false.B
    initializedLayer.io.input.bits := VecInit(Seq.fill(layer.params.inputSize)(0.F(params.dataWidth.W, params.dataBinaryPoint.BP)))
    initializedLayer.io.output.ready := false.B
    initializedLayer.io.input_error.ready := true.B
    initializedLayer.io.output_error.valid := false.B
    initializedLayer.io.output_error.bits := VecInit(Seq.fill(layer.params.outputSize)(0.F(params.dataWidth.W, params.dataBinaryPoint.BP)))
    (initializedLayer, RegInit(VecInit(Seq.fill(layer.params.outputSize)(0.F(params.dataWidth.W, params.dataBinaryPoint.BP)))))
  }

  val lastOutput = layersWithOutputRegs.last._2

  /** Memory used to store the training data, so it can be run over multiple epochs easily. */
  val trainingSamples = Mem(params.maxTrainingSamples, Vec(params.inputSize, FixedPoint(params.dataWidth.W, params.dataBinaryPoint.BP)))
  val validationSet = Mem(params.maxTrainingSamples, Vec(params.inputSize, FixedPoint(params.dataWidth.W, params.dataBinaryPoint.BP)))

  val curEpoch = Counter(params.trainingEpochs)
  val numSamples = RegInit(0.U(32.W))
  val sampleIndex = RegInit(0.U(32.W))
  val state = RegInit(ready)
  val curLayer = Counter(layersWithOutputRegs.length)

  io.numSamples.ready := true.B
  io.result.valid := false.B
  io.result.bits := VecInit(Seq.fill(params.outputSize)(0.F(params.dataWidth.W, params.dataBinaryPoint.BP)))
  io.state := state
  io.epoch := curEpoch.value
  io.layer := curLayer.value

  switch(state) {
    // initial state, input decides whether to go to train or predict
    is(ready) {
      when(io.train && io.numSamples.fire) {
        state := writingTrainingData
        numSamples := io.numSamples.bits
        sampleIndex := 0.U
        curLayer.reset()
      } .elsewhen(io.predict && io.numSamples.fire) {
        state := predicting
        numSamples := io.numSamples.bits
        sampleIndex := 0.U
        curLayer.reset()
      }
    }
    // prepare training data and validation set
    is(writingTrainingData) {
      trainingSamples.write(sampleIndex, io.sample)
      validationSet.write(sampleIndex, io.validation)
      when(sampleIndex === (numSamples - 1.U)) {
        state := trainingForwardProp
        sampleIndex := 0.U
      } .otherwise {
        sampleIndex := sampleIndex + 1.U
      }
    }
    is(trainingForwardProp) {
      layersWithOutputRegs.zipWithIndex.foreach {
        case ((layer, outputReg), idx) =>
          when(curLayer.value === idx.U && layer.io.nextState.ready && layer.io.input.ready) {
            layer.io.output.ready := true.B
            layer.io.nextState.valid := true.B
            layer.io.nextState.bits := NeuronState.forwardProp
            layer.io.input.valid := true.B
            if (idx == 0) {
              layer.io.input.bits := trainingSamples(sampleIndex)
            } else {
              layer.io.input.bits := layersWithOutputRegs(idx - 1)._2
            }
          }
          when(layer.io.output.valid) {
            outputReg := layer.io.output.bits
            curLayer.inc()
            if (idx == layersWithOutputRegs.length - 1) {
              state := trainingBackwardProp
              // loss function derivative, use mean squared error
              lastOutput := VecInit(Seq.tabulate(params.outputSize){ i =>
                (validationSet(sampleIndex)(i.U) - lastOutput(i.U)) * (2/params.outputSize).F(params.dataWidth.W, params.dataBinaryPoint.BP)
              })
            }
          }
      }
    }
    is(trainingBackwardProp) {
      layersWithOutputRegs.zipWithIndex.reverse.foreach {
        case ((layer, outputReg), idx) =>
          when(curLayer.value === idx.U && layer.io.nextState.ready && layer.io.output_error.ready) {
            layer.io.input_error.ready := true.B
            layer.io.nextState.valid := true.B
            layer.io.nextState.bits := NeuronState.backwardProp
            layer.io.output_error.valid := true.B
            layer.io.output_error.bits := outputReg
          }
          when(layer.io.input_error.valid) {
            if (idx > 0) {
              layersWithOutputRegs(idx - 1)._2 := layer.io.input_error.bits
            }
            curLayer.inc()
            if (idx == layersWithOutputRegs.length - 1) {
              when(sampleIndex === (numSamples - 1.U)) {
                sampleIndex := 0.U
                when(curEpoch.inc()) {
                  state := ready
                } .otherwise {
                  state := trainingForwardProp
                }
              } .otherwise {
                sampleIndex := sampleIndex + 1.U
                state := trainingForwardProp
              }
            }
          }
      }
    }
    is(predicting) {
      layersWithOutputRegs.zipWithIndex.foreach {
        case ((layer, outputReg), idx) =>
          when(curLayer.value === idx.U) {
            layer.io.output.ready := true.B
            layer.io.nextState.valid := true.B
            layer.io.nextState.bits := NeuronState.forwardProp
            layer.io.input.valid := true.B
            if (idx == 0) {
              layer.io.input.bits := io.sample
            } else {
              layer.io.input.bits := layersWithOutputRegs(idx - 1)._2
            }
          }
          when(layer.io.output.valid) {
            layer.io.nextState.valid := false.B
            outputReg := layer.io.output.bits
            curLayer.inc()
            if (idx == layersWithOutputRegs.length - 1) {
              io.result.valid := true.B
              io.result.bits := layer.io.output.bits
              when(sampleIndex === numSamples - 1.U) {
                state := ready
              } .otherwise {
                sampleIndex := sampleIndex + 1.U
              }
            }
          }
      }
    }
  }
}
