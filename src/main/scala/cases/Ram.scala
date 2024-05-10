package cases

import chisel3._;import chisel3.util._;
class RWSmem(val width: Int, val addr_size: Int) extends Module {
  val io = IO(new Bundle {
    val enable = Input(Bool())
    val write = Input(Bool())
    val addr = Input(UInt(addr_size.W))
    val dataIn = Input(UInt(width.W))
    val dataOut = Output(UInt(width.W))
  })
  val mem = Reg(Vec(k, UInt(width.W)))
  when(io.enable) {
    when(io.write) { mem(io.addr) := io.dataIn }
      .otherwise { io.dataOut := mem(io.addr) }
  }
}

object Ram extends App {
  new ChiselStage().emitSystemVerilog(new RWSmem(2, 2))
}

// import chisel3._
// import chisel3.util._
// import chisel3.stage.ChiselStage
// class RWSmem(val width:Int, val addr_size:Int) extends Module {
//   // val width: Int = 32
//   val k = math.pow(2, addr_size).toInt
//   val io = IO(new Bundle {
//     val rst = Input(Bool())
//     val enable = Input(Bool())
//     val write = Input(Bool())
//     val addr = Input(UInt(addr_size.W))
//     val dataIn = Input(UInt(width.W))
//     val dataOut = Output(UInt(width.W))
//   })

//   // val mem = SyncReadMem(k, UInt(width.W))
//   // val mem = Reg(Vec(k, UInt(width.W)))
//   val mem = RegInit(VecInit(Seq.fill(k)(0.U(width.W))))
//   io.dataOut := DontCare
//   when(io.rst){
//     mem.foreach(_ := 0.U)
//   }
//   when(io.enable) {
//     val rdwrPort = mem(io.addr)
//     when (io.write) { rdwrPort := io.dataIn }
//       .otherwise    { io.dataOut := rdwrPort }
//   }
// }

// // object Ram extends App {
// //   new ChiselStage().emitSystemVerilog(new RWSmem())
// // }
