package cases

import chisel3._
import chisel3.util._

class FIFO(w: Int, size: Int) extends Module {
  val addrW = log2Ceil(size)
  val io    = IO(new Bundle {
    val rst = Input(Bool())
    val dataIn = Input(UInt(w.W))
    val push   = Input(Bool())
    val pop    = Input(Bool())
    val dataOut = Output(UInt(w.W))
    val full    = Output(Bool())
    val empty   = Output(Bool())
  })
  val memRegs = Reg(Vec(size, UInt(w.W)))
  val tailReg  = Reg(UInt(addrW.W))
  val headReg  = Reg(UInt(addrW.W))
  val emptyReg = Reg(Bool())
  when(io.rst){
    tailReg := 0.U
    headReg := 0.U
    emptyReg := true.B
  }.elsewhen(io.push & !io.full) {
    memRegs(headReg) := io.dataIn
    headReg := headReg + 1.U
    emptyReg := false.B
  }.elsewhen(io.pop & !emptyReg) {
    tailReg := tailReg + 1.U
    when((tailReg + 1.U) === headReg) {
      emptyReg := true.B
    }
  }
  io.empty := emptyReg
  io.dataOut := memRegs(tailReg)
  io.full := (tailReg === headReg) & !emptyReg
}