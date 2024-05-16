package ram

import chisel3._
import chisel3.util._
import chisel3.stage.ChiselStage
class RWSmem(val width: Int, val addr_size: Int) extends Module {
  val k = math.pow(2, addr_size).toInt
  val io = IO(new Bundle {
    // val rst = Input(Bool())
    val enable = Input(Bool())
    val write = Input(Bool())
    val addr = Input(UInt(addr_size.W))
    val dataIn = Input(UInt(width.W))
    val dataOut = Output(UInt(width.W))
  })
  val mem = Reg(Vec(k, UInt(width.W)))
  io.dataOut := 0.U
  when(io.enable) {
    when(io.write) { mem(io.addr) := io.dataIn }
      .otherwise { io.dataOut := mem(io.addr) }
  }
}
