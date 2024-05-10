package examples


import SymbolicTrajectoryEvaluation._
import chisel3._
import chiseltest._
import org.scalatest.freespec.AnyFreeSpec
import scala.collection.mutable.ArrayBuffer
import chisel3._

class byteSelectorSPec extends AnyFreeSpec with ChiselScalatestTester {
  ("byteSelectorSPec")   in {
    test(new ByteSelector) { dut =>
      val in = VAR("dIn" , 32)
      val offset = VAR("offset" , 2)
      val ant = at_cycle(
        is_bv(dut.io.in, in) &&
        is_bv(dut.io.offset, offset)
        ,0
      )
      val cons = at_cycle(
        Imply((offset == BV_CONST(0,2)),is_bv(dut.io.out, in,7,0,7,0)) &&
        Imply((offset == BV_CONST(1,2)),is_bv(dut.io.out, in,7,0,15,8)) &&
        Imply((offset == BV_CONST(2,2)),is_bv(dut.io.out, in,7,0,23,16)) &&
        Imply((offset == BV_CONST(3,2)),is_bv(dut.io.out, in,7,0,31,24))
        ,0)

      val assert = new Assert(ant, cons,() => new ByteSelector, SMT)
      assert.STE
    }
  }


}

