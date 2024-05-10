package neuralnet

import chisel3._
import chisel3.tester._
import org.scalatest.FreeSpec
import FullyConnectedLayerSpec._
import chisel3.experimental.FixedPoint
import neuralnet.NeuralNet.NeuronState
import neuralnet.NeuralNetSpec.defaultNeuralNetParams

class FullyConnectedLayerSpec extends FreeSpec with ChiselScalatestTester {

  "FCLayer should calculate output values" in {
    test(new TestFullyConnectedLayer(inputWeightValue = 2, inputBiasValue = 0.5)) { dut =>
      // Initialization.
      dut.io.output_error.bits.foreach(bit => bit.poke(0.5.F(defaultNeuralNetParams.dataWidth.W, defaultNeuralNetParams.dataBinaryPoint.BP)))
      dut.io.output_error.valid.poke(false.B)
      dut.io.input_error.ready.poke(true.B)

      // Check forward propagation.
      dut.io.nextState.valid.poke(true.B)
      dut.io.nextState.ready.expect(true.B)
      dut.io.nextState.bits.poke(NeuronState.forwardProp)
      dut.clock.step(1)
      dut.io.input.valid.poke(true.B)
      dut.io.input.ready.expect(true.B)
      dut.io.input.bits.foreach(bit => bit.poke(1.F(defaultNeuralNetParams.dataWidth.W, defaultNeuralNetParams.dataBinaryPoint.BP)))
      dut.io.output.valid.expect(true.B)
      dut.io.output.bits.foreach(bit => bit.expect(4.5.F(defaultNeuralNetParams.dataWidth.W, defaultNeuralNetParams.dataBinaryPoint.BP)))

      // Check backward propagation.
    }
  }
}

object FullyConnectedLayerSpec {
  val TestInputNeurons = 2
  val TestOutputNeurons = 1
  val TestLearningRate = 0.1
  val fcLayerDefaultParams = FullyConnectedLayerParams(TestInputNeurons, TestOutputNeurons, TestLearningRate)

  class TestFullyConnectedLayer(
                                 inputWeightValue: Double,
                                 inputBiasValue: Double,
                                 netParams: NeuralNetParams = defaultNeuralNetParams,
                                 params: FullyConnectedLayerParams = fcLayerDefaultParams)
    extends FullyConnectedLayer(netParams, params) {
    override def getInitialWeights(): Vec[Vec[FixedPoint]] = {
      VecInit(Seq.fill(params.inputSize)(VecInit(Seq.fill(params.outputSize)(inputWeightValue.F(defaultNeuralNetParams.dataWidth.W, defaultNeuralNetParams.dataBinaryPoint.BP)))))
    }

    override def getInitialBias(): Vec[FixedPoint] = {
      VecInit(Seq.fill(params.outputSize)(inputBiasValue.F(defaultNeuralNetParams.dataWidth.W, defaultNeuralNetParams.dataBinaryPoint.BP)))
    }
  }
}
