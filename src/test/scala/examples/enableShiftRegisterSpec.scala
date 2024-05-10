package examples


import SymbolicTrajectoryEvaluation._
import chisel3._
import chiseltest._
import org.scalatest.freespec.AnyFreeSpec
import scala.collection.mutable.ArrayBuffer
import chisel3._

class EnableShiftRegisterSPec extends AnyFreeSpec with ChiselScalatestTester {
  ("EnableShiftRegisterSPec BDD")   in {
    test(new EnableShiftRegister) { dut =>
      val in = VAR("dIn" , 4)
      val ant = at_cycle(rst(true),0) &&
          at_cycle(
            rst(false) &&
            is_bv(dut.io.in,in) &&
            is(dut.io.shift,true)
          ,1
          ) &&
          at_cycle(
            rst(false) &&
            is(dut.io.shift,true)
          ,2
          ) &&
          at_cycle(
            rst(false) &&
            is(dut.io.shift,true)
          ,3
          ) &&
          at_cycle(
            rst(false) &&
            is(dut.io.shift,true)
          ,4
          ) &&
          at_cycle(
            rst(false) &&
            is(dut.io.shift,true)
          ,4
          ) 
      val cons = at_cycle(is_bv(dut.io.out,in),5)


      val assert = new Assert(ant, cons,() => new EnableShiftRegister, SMT)
      assert.STE
    }
  }


}

