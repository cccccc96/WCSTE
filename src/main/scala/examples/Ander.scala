package examples


import chisel3._
import chisel3.util._

class Ander extends Module  {
  val io= IO(new Bundle {
    val a = Input(Bool())
    val b = Input(Bool())
    val c = Input(Bool())
    val o =Output(Bool())
  })
  val r =RegNext(io.a&&io.b&&io.c)
  io.o:=r
}



