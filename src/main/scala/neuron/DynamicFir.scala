package neuron
import chisel3._
import chisel3.util._

class MyManyDynamicElementVecFir(length: Int,width: Int) extends Module {
  val io = IO(new Bundle {
    val in = Input(UInt(width.W))  // 1 2
    val consts = Input(Vec(length, UInt(8.W))) // c1 c2 
    val valid = Input(Bool())
    val out = Output(UInt(width.W))
  })
  // 1*c2 + 2*c1
  
  // Such concision! You'll learn what all this means later.
  val taps = Seq(io.in) ++ Seq.fill(io.consts.length - 1)(RegInit(0.U(8.W)))
  taps.zip(taps.tail).foreach { case (a, b) => when (io.valid) { b := a } }

  io.out := taps.zip(io.consts).map { case (a, b) => a * b }.reduce(_ + _)
  
}