package cam
import chisel3._
import chisel3.stage.ChiselStage
import chisel3.util._

class CAMCell extends Module {
  val io = IO(new Bundle {
    val write = Input(Bool())
    val ki = Input(Bool())
    val di = Input(Bool())
    val lhi = Output(Bool())
  })

  val ti = Wire(Bool())
  val oi = RegInit(false.B)

  ti := (io.write && io.di) || (!io.write && oi)
  oi := ti

  io.lhi := (oi && io.ki) || (!oi && !io.ki)
  
}


class CAMLine_m(val m:Int) extends Module {
  val io = IO(new Bundle {
    //    val clk = Input(Clock())
    val we = Input(Bool())
    val wi = Input(Bool())
    val key = Input(UInt(m.W))
    val din = Input(UInt(m.W))
    val hit = Output(Bool())
  })
  val write = Wire(Bool())
  val camCells = VecInit(Seq.fill(m)(Module(new CAMCell).io))
  write := io.we && io.wi
  for (i <- 0 until m) {
    camCells(i).write := write
    camCells(i).ki := io.key(i)
    camCells(i).di := io.din(i)
  }
  write := io.we && io.wi
  val lhit = camCells.map(_.lhi)
  io.hit := lhit.reduce(_ && _)
}

class CAMLine(val m:Int) extends Module {
  val io = IO(new Bundle {
    //    val clk = Input(Clock())
    val we = Input(Bool())
    val wi = Input(Bool())
    val key = Input(UInt(m.W))
    val din = Input(UInt(m.W))
    val hit = Output(Bool())
    val camCells = Output(UInt(m.W))
  })
  val write = Wire(Bool())
  write := io.we && io.wi
  val camCells = Reg(UInt(m.W))

  when(write){
    camCells := io.din 
  }

  io.hit := (camCells === io.key)
  io.camCells := camCells
}

//m data
//n how much data
class CAM_m_n(val m: Int, val n: Int) extends Module {
  val io = IO(new Bundle {
    val we = Input(Bool())
    val key = Input(UInt(m.W))
    val din = Input(UInt(m.W))
    val waddr = Input(UInt(n.W))
    val hit = Output(Bool())
  })


  val camLines = Seq.fill(n)(Module(new CAMLine(m)).io)

  for (i <- 0 until n) {
//    camLines(i).clk := io.clk
    camLines(i).we := io.we
    camLines(i).wi := io.waddr(i)
    camLines(i).key := io.key
    camLines(i).din := io.din
  }
// val hitkeys: Seq[Bool] = camLines.map(_.camCells === io.key)
// assert(io.hit === hitkeys.reduce(_||_))
  val hits = camLines.map(_.hit)
  io.hit := hits.reduce(_ || _)

}



object xx22 extends App {
  new ChiselStage().emitSystemVerilog(new CAM_m_n(1024,256))
}
