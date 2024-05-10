package cases
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

class CAMLine extends Module {
  val io = IO(new Bundle {
//    val clk = Input(Clock())
    val we = Input(Bool())
    val wi = Input(Bool())
    val key = Input(UInt(2.W))
    val din = Input(UInt(2.W))
    val hit = Output(Bool())
  })

  val write = Wire(Bool())
  val lhit = Wire(Vec(2, Bool()))

  val cc1 = Module(new CAMCell)
//  cc1.io.clk := io.clk
  cc1.io.write := write
  cc1.io.ki := io.key(1)
  cc1.io.di := io.din(1)
  lhit(1) := cc1.io.lhi

  val cc0 = Module(new CAMCell)
//  cc0.io.clk := io.clk
  cc0.io.write := write
  cc0.io.ki := io.key(0)
  cc0.io.di := io.din(0)
  lhit(0) := cc0.io.lhi

  write := io.we && io.wi

  io.hit := lhit(1) && lhit(0)
}


class CAM4to2 extends Module {
  val io = IO(new Bundle {
    val we = Input(Bool())
    //    val clk = Input(Clock())
    val key = Input(UInt(2.W))
    val din = Input(UInt(2.W))
    val waddr = Input(UInt(4.W))
    val hit = Output(Bool())
  })

  val hits = Wire(Vec(4, Bool()))

  val cl0 = Module(new CAMLine)
  //  cl0.io.clk := io.clk
  cl0.io.we := io.we
  cl0.io.wi := io.waddr(0)
  cl0.io.key := io.key
  cl0.io.din := io.din
  hits(0) := cl0.io.hit

  val cl1 = Module(new CAMLine)
  //  cl1.io.clk := io.clk
  cl1.io.we := io.we
  cl1.io.wi := io.waddr(1)
  cl1.io.key := io.key
  cl1.io.din := io.din
  hits(1) := cl1.io.hit

  val cl2 = Module(new CAMLine)
  //  cl2.io.clk := io.clk
  cl2.io.we := io.we
  cl2.io.wi := io.waddr(2)
  cl2.io.key := io.key
  cl2.io.din := io.din
  hits(2) := cl2.io.hit

  val cl3 = Module(new CAMLine)
  //  cl3.io.clk := io.clk
  cl3.io.we := io.we
  cl3.io.wi := io.waddr(3)
  cl3.io.key := io.key
  cl3.io.din := io.din
  hits(3) := cl3.io.hit

  io.hit := hits(0) || hits(1) || hits(2) || hits(3)
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

//  val hits = Wire(Vec(n, Bool()))

  val camLines = Seq.fill(n)(Module(new CAMLine_m(m)).io)

  for (i <- 0 until n) {
//    camLines(i).clk := io.clk
    camLines(i).we := io.we
    camLines(i).wi := io.waddr(i)
    camLines(i).key := io.key
    camLines(i).din := io.din
  }

  

  val hits = camLines.map(_.hit)
  io.hit := hits.reduce(_ || _)

}



object xx22 extends App {
  new ChiselStage().emitSystemVerilog(new CAM_m_n(1024,1024))
}
