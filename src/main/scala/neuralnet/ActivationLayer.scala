package neuralnet

import chisel3._
import chisel3.util._
import neuralnet.NeuralNet.NeuronState

/** Implements an activation layer, for creating non-linear neural nets */
class ActivationLayer(netParams: NeuralNetParams, params: LayerParams) extends Layer(netParams, params) {

  val state = RegInit(NeuronState.ready)

  io.input.ready := true.B
  io.nextState.ready := true.B
  io.output.valid := false.B
  io.output.bits := VecInit(Seq.fill(params.outputSize)(0.F(netParams.dataWidth.W, netParams.dataBinaryPoint.BP)))
  io.output_error.ready := true.B
  io.input_error.valid := false.B
  io.input_error.bits := VecInit(Seq.fill(params.inputSize)(0.F(netParams.dataWidth.W, netParams.dataBinaryPoint.BP)))

  switch(state) {
    is(NeuronState.ready) {
      when(io.nextState.fire()) {
        state := io.nextState.bits
      }
    }
    // By default this uses Relu activation. We may want to parameterize this later.
    is(NeuronState.forwardProp) {
      when(io.input.fire()) {
        val inputData = io.input.bits
        (0 until params.outputSize).foreach { i =>
          when(inputData(i) > 0.F(netParams.dataWidth.W, netParams.dataBinaryPoint.BP)) {
            io.output.bits(i) := inputData(i)
          } .otherwise {
            io.output.bits(i) := 0.F(netParams.dataWidth.W, netParams.dataBinaryPoint.BP)
          }
        }
        io.output.valid := true.B
        state := NeuronState.ready
      }
    }
  }
}
