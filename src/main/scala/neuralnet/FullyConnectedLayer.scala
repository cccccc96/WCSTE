package neuralnet

import chisel3._
import chisel3.experimental.FixedPoint
import chisel3.util._
import neuralnet.FullyConnectedLayer.AdjustAmount
import neuralnet.NeuralNet._

import scala.util.Random

object FullyConnectedLayer {
  /** We need a normal distribution for the initial weights, but random returns values between 0 and 1. */
  val AdjustAmount = 0.5
}

case class FullyConnectedLayerParams(
                                      override val inputSize: Int,
                                      override val outputSize: Int,
                                      learningRate: Double)
  extends LayerParams(inputSize, outputSize)

/**
 * Implements a fully connected layer in a neural net, where each input neuron affects each output neuron
 * with weights defined in a stored matrix.
 */
class FullyConnectedLayer(netParams: NeuralNetParams, params: FullyConnectedLayerParams) extends Layer(netParams, params) {

  val r = Random
  val state = RegInit(NeuronState.ready)
  val initialWeights = getInitialWeights()
  val initialBias = getInitialBias()
  val weights = RegInit(initialWeights) // Input weights.
  val bias = RegInit(initialBias)       // Neuron biases.

  // Init defaults.
  io.input.ready := true.B
  io.nextState.ready := true.B
  io.output.bits := VecInit(Seq.fill(params.outputSize)(0.F(netParams.dataWidth.W, netParams.dataBinaryPoint.BP)))

  io.output.valid := false.B

  io.output_error.ready := true.B
  io.input_error.bits := VecInit(Seq.fill(params.inputSize)(0.F(netParams.dataWidth.W, netParams.dataBinaryPoint.BP)))
  io.input_error.valid := false.B

  switch(state) {
    // Intermediate state, used to transition between initialization, training, and predicting.
    is(NeuronState.ready) {
      when(io.nextState.fire) {
        state := io.nextState.bits
      }
    }
    // Initializes (or resets) this layer with the given weights and bias.
    is(NeuronState.reset) {
      weights := initialWeights
      bias := initialBias
      state := NeuronState.ready
    }
    // Performs forward propagation, for either training or prediction.
    is(NeuronState.forwardProp) {
      when(io.input.fire()) {
        val inputData = io.input.bits
        // computes the dot product for each output neuron using the input neurons and their defined weights.
        (0 until params.outputSize).foreach { j =>
          val dotProduct = (0 until params.inputSize).foldLeft(0.F(netParams.dataWidth.W, netParams.dataBinaryPoint.BP)) { (sum, i) =>
            sum + inputData(i) * weights(i)(j)
          }
          
          // ReLu activation. 
          val net = dotProduct + bias(j)
          when (net > 0.F(netParams.dataWidth.W, netParams.dataBinaryPoint.BP)) {
            io.output.bits(j) := net
          } .otherwise {
            io.output.bits(j) := 0.F(netParams.dataWidth.W, netParams.dataBinaryPoint.BP)
          }
        }
        io.output.valid := true.B
      }
      // Wait for next state change.
      when(io.nextState.fire()) {
        state := io.nextState.bits
      }
    }
    // Perform back propagation.
    // https://machinelearningmastery.com/implement-backpropagation-algorithm-scratch-python/
    is(NeuronState.backwardProp) {
      when (io.output_error.fire()) {
        // Compute own deltas (gradient).
        val deltas = (0 until params.outputSize).map { j =>
          // ReLu derivative.
          val derivative = Mux(io.output.bits(j) > 0.F(netParams.dataWidth.W, netParams.dataBinaryPoint.BP),
            1.F(netParams.dataWidth.W, netParams.dataBinaryPoint.BP), 0.F(netParams.dataWidth.W, netParams.dataBinaryPoint.BP))

          io.output_error.bits(j) * derivative;
        }

        // Learning rate as a chisel var.
        val learningRateChisel = params.learningRate.F(netParams.dataWidth.W, netParams.dataBinaryPoint.BP)

        // Update weights and biases.
        for (j <- 0 until params.outputSize) {
          for (i <- 0 until params.inputSize) {
            weights(i)(j) := weights(i)(j) + learningRateChisel * deltas(j) * io.input.bits(i)
          }

          bias(j) := bias(j) + learningRateChisel * deltas(j)
        }

        // Compute error to pass to left layer.
        for (i <- 0 until params.inputSize) {
          val dotPdt = (0 until params.outputSize)
            .foldLeft(0.F(netParams.dataWidth.W, netParams.dataBinaryPoint.BP)) { (sum, j) =>
              sum + weights(i)(j) * deltas(j)
          }

          io.input_error.bits(i) := dotPdt
        }
        io.input_error.valid := true.B
      }
      // Wait for next state change.
      when(io.nextState.fire()) {
        state := io.nextState.bits
      }
    }
  }

  def getInitialWeights(): Vec[Vec[FixedPoint]] = {
    VecInit(Seq.fill(params.inputSize)(VecInit(Seq.tabulate(params.outputSize)(_ =>
      (r.nextDouble() - AdjustAmount).F(netParams.dataWidth.W, netParams.dataBinaryPoint.BP)))))
  }

  def getInitialBias(): Vec[FixedPoint] = {
    VecInit(Seq.tabulate(params.outputSize)(_ =>
      (r.nextDouble() - AdjustAmount).F(netParams.dataWidth.W, netParams.dataBinaryPoint.BP)))
  }
}
