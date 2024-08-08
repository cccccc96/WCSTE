package examples

import chisel3._

class Max2 extends Module {
  val io = IO(new Bundle {
    val in0 = Input(UInt(8.W))
    val in1 = Input(UInt(8.W))
    val out = Output(UInt(8.W))
  })
  io.out := Mux(io.in0 > io.in1, io.in0, io.in1)
}

