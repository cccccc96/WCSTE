package mult

import chisel3._
import chisel3.stage.ChiselStage

class MultCell(N: Int, M: Int) extends Module {
  val io = IO(new Bundle {
    val rstn = Input(Bool())
    val en = Input(Bool())
    val mult1 = Input(UInt((N + M).W))
    val mult2 = Input(UInt(M.W))
    val mult1_acci = Input(UInt((N + M).W))

    val mult1_o = Output(UInt((N + M).W))
    val mult2_shift = Output(UInt(M.W))
    val mult1_acco = Output(UInt((N + M).W))
    val rdy = Output(Bool())
  })

  val mult2_shift_reg = RegInit(0.U(M.W))
  val mult1_o_reg = RegInit(0.U((N + M).W))
  val mult1_acc_reg = RegInit(0.U((N + M).W))
  val rdy_reg = RegInit(false.B)

  when(!io.rstn) {
    mult2_shift_reg := 0.U
    mult1_o_reg := 0.U
    mult1_acc_reg := 0.U
    rdy_reg := false.B
  }.elsewhen(io.en) {
    rdy_reg := true.B
    mult2_shift_reg := io.mult2 >> 1.U
    mult1_o_reg := io.mult1 << 1.U
    when(io.mult2(0)) {
      mult1_acc_reg := io.mult1_acci + io.mult1
    }.otherwise {
      mult1_acc_reg := io.mult1_acci
    }
  }.otherwise {
    rdy_reg := false.B
    mult2_shift_reg := 0.U
    mult1_o_reg := 0.U
    mult1_acc_reg := 0.U
  }

  io.mult1_o := mult1_o_reg
  io.mult2_shift := mult2_shift_reg
  io.mult1_acco := mult1_acc_reg
  io.rdy := rdy_reg
}

import chisel3._
import chisel3.util._

class MultMan(N: Int, M: Int) extends Module {
  val io = IO(new Bundle {
    val rstn = Input(Bool())
    val data_rdy = Input(Bool())
    val mult1 = Input(UInt(N.W))
    val mult2 = Input(UInt(M.W))
    val res_rdy = Output(Bool())
    val res = Output(UInt((N + M).W))
  })

  val mult1_t = Seq.fill(M)(Wire(UInt((N + M).W)))
  val mult2_t = Seq.fill(M)(Wire(UInt(M.W)))
  val mult1_acc_t = Seq.fill(M)(Wire(UInt((N + M).W)))
  val rdy_t = Seq.fill(M)(Wire(Bool()))

  val u_mult_step0 = Module(new MultCell(N, M))
  u_mult_step0.io.rstn := io.rstn
  u_mult_step0.io.en := io.data_rdy
  u_mult_step0.io.mult1 := Cat(Fill(M, 0.U), io.mult1)
  u_mult_step0.io.mult2 := io.mult2
  u_mult_step0.io.mult1_acci := 0.U
  mult1_t(0) := u_mult_step0.io.mult1_o
  mult2_t(0) := u_mult_step0.io.mult2_shift
  mult1_acc_t(0) := u_mult_step0.io.mult1_acco
  rdy_t(0) := u_mult_step0.io.rdy

  for (i <- 1 until M) {
    val u_mult_step = Module(new MultCell(N, M))
    u_mult_step.io.rstn := io.rstn
    u_mult_step.io.en := rdy_t(i - 1)
    u_mult_step.io.mult1 := mult1_t(i - 1)
    u_mult_step.io.mult2 := mult2_t(i - 1)
    u_mult_step.io.mult1_acci := mult1_acc_t(i - 1)
    mult1_t(i) := u_mult_step.io.mult1_o
    mult2_t(i) := u_mult_step.io.mult2_shift
    mult1_acc_t(i) := u_mult_step.io.mult1_acco
    rdy_t(i) := u_mult_step.io.rdy
  }

  io.res_rdy := rdy_t(M - 1)
  io.res := mult1_acc_t(M - 1)
}

object x33 extends App {

  new ChiselStage().emitSystemVerilog(new MultMan(10,10));
}