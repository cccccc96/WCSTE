package examples


import SymbolicTrajectoryEvaluation._
import chisel3._
import chiseltest._
import org.scalatest.freespec.AnyFreeSpec
import scala.collection.mutable.ArrayBuffer
import chisel3._

class StackSPec extends AnyFreeSpec with ChiselScalatestTester {

  ("spec of StackSPec") in {
    val depth = 10
    test(new Stack(depth)) { dut =>
      // dut.io.en.poke(true.B)
      // dut.io.push.poke(true.B)
      // dut.io.pop.poke(false.B)
      // dut.io.dataIn.poke(8.U)
      // dut.clock.step()
      // dut.io.en.poke(true.B)
      // dut.io.push.poke(false.B)
      // dut.io.pop.poke(true.B)
      // println(dut.io.dataOut.peek().toString)
      // dut.clock.step()
      // println(dut.io.dataOut.peek().toString)


      var in = VAR("dIn",32)
      var in2 = VAR("dIn2",32)
      var ant = 
        at_cycle(
          rst(true)&&
          is(dut.io.en,false),0) &&
        at_cycle(
          rst(false)&&
          is(dut.io.en,true) &&
          is(dut.io.push,true) &&
          is(dut.io.pop,false) &&
          is_bv(dut.io.dataIn,in) 
          ,1) &&
        at_cycle(
          rst(false)&&
          is(dut.io.en,true) &&
          is(dut.io.push,true) &&
          is(dut.io.pop,false) &&
          is_bv(dut.io.dataIn,in2) 
          ,2) &&
        at_cycle(
          rst(false) &&
          is(dut.io.en,true) &&
          is(dut.io.push,false) &&
          is(dut.io.pop,true) 
          ,3
        )
      var cons = 
        at_cycle(
          is_bv(dut.io.dataOut,in2) 
          ,4
        )
      val assert = new Assert(ant, cons,() => new Stack(depth), SMT)
      assert.STE
    }
  }


}

