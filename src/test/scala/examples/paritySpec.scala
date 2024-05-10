package examples


import SymbolicTrajectoryEvaluation._
import chisel3._
import chiseltest._
import org.scalatest.freespec.AnyFreeSpec
import scala.collection.mutable.ArrayBuffer
import chisel3._

class ParitySPec extends AnyFreeSpec with ChiselScalatestTester {

  ("spec of Parity") in {
    test(new Parity) { dut =>
      var in = VAR("dIn")
      var ant = 
        at_cycle(rst(true),0) &&
        at_cycle(rst(false)&&is(dut.io.in,in),1)
      var cons = 
        at_cycle(
          Imply(in,is(dut.io.out,false)) &&
          Imply(!in,is(dut.io.out,true))
          ,1
        )
      val assert = new Assert(ant, cons,() => new Parity, SMT)
      assert.STE
    }
  }


}

