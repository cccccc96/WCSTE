// See LICENSE.txt for license details.
package examples

import chisel3._

class EnableShiftRegister extends Module {
  val io = IO(new Bundle {
    val in    = Input(UInt(4.W))
    val shift = Input(Bool())
    val out   = Output(UInt(4.W))
  })
  val r0 = Reg(UInt(4.W))
  val r1 = Reg(UInt(4.W))
  val r2 = Reg(UInt(4.W))
  val r3 = Reg(UInt(4.W))
  when(reset.asBool) {
    r0 := 0.U(4.W)
    r1 := 0.U(4.W)
    r2 := 0.U(4.W)
    r3 := 0.U(4.W)
  } .elsewhen(io.shift) {
    r0 := io.in
    r1 := r0
    r2 := r1
    r3 := r2
  }
  io.out := r3
}
