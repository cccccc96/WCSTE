package neuron

import chisel3.{Module, _}
import chisel3.experimental.{FixedPoint, _}
import chisel3.stage.{ChiselGeneratorAnnotation, ChiselStage}
import firrtl.options.TargetDirAnnotation
import chisel3.testers._

import scala.collection.Seq

class Neuron(inputs: Int, act: FixedPoint => FixedPoint) extends Module {
  val io = IO(new Bundle {
    val in      = Input(Vec(inputs, FixedPoint(16.W, 8.BP)))
    val weights = Input(Vec(inputs, FixedPoint(16.W, 8.BP)))
    val out     = Output(FixedPoint(16.W, 8.BP))
  })

  val mac = io.in.zip(io.weights).map{ case(a:FixedPoint, b:FixedPoint) => a*b}.reduce(_+_)
  io.out := act(mac)
}

object neu extends App {
  val Step: FixedPoint => FixedPoint = x => Mux(x <= 0.F(8.BP), 0.F(8.BP), 7.23.F(8.BP))
  val ReLU: FixedPoint => FixedPoint = x => Mux(x <= 0.F(8.BP), 0.F(8.BP), x)
  new ChiselStage().emitSystemVerilog(new Neuron(2, Step));
}

