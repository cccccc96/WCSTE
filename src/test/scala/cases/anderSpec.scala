package cases

import SymbolicTrajectoryEvaluation._
import chisel3._
import chiseltest._
import org.scalatest.freespec.AnyFreeSpec
import scala.collection.mutable.ArrayBuffer
import chisel3._

class ander2SPec extends AnyFreeSpec with ChiselScalatestTester {

  /** STE assert ant: clock 0 : !x1!x2->!a /\ x1!x2->!b /\ !x1x2->!c /\ x1x2->a
    * /\ x1x2->b /\ x1x2->c \=========> cons clock 1: !x1!x2 -> !o /\ x1x2 -> o
    */
  ("ander ste assert pass use SMT") in {
    test(new Ander()) { dut =>
      val x1 = VAR("x1")
      val x2 = VAR("x2")
      
      val ant = new  at_cycle(
        Imply((!x1) & (!x2), is(dut.io.a, false)) &&
          Imply(x1 & (!x2), is(dut.io.b, false)) &&
          Imply((!x1) & x2, is(dut.io.c, false)) &&
          Imply(x1 & x2, is(dut.io.a, true)) &&
          Imply(x1 & x2, is(dut.io.b, true)) &&
          Imply(x1 & x2, is(dut.io.c, true)),
        0
      )
      val cons = new at_cycle(
        Imply((!x1) & (!x2), is(dut.io.o, false)) &&
          Imply(x1 & x2, is(dut.io.o, true)),
        1
      )
      println(ant.eval1())
      val assert = new Assert(ant, cons,() => new Ander(), SMT)
      assert.STE
    }
  }


}
