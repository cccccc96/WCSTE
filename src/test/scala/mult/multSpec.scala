package mult

import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec
import SymbolicTrajectoryEvaluation._
import scala.collection.mutable.ArrayBuffer


/** This is a trivial example of how to run this Specification From within sbt
  * use:
  * {{{
  * testOnly gcd.GcdDecoupledTester
  * }}}
  * From a terminal shell use:
  * {{{
  * sbt 'testOnly gcd.GcdDecoupledTester'
  * }}}
  * //
  */
class multSpec extends AnyFlatSpec with ChiselScalatestTester {
  //6;8;10
  var n = 10;
  "mfcpu ste assertds2" should "pass" in {
    test(new MultMan(n, n)) { dut =>
      // trajFormula数组
      var antArray = ArrayBuffer[trajFormula]()
      var consArray = ArrayBuffer[trajFormula]()

      for (i <- 0 until 2 * n) {
        if (i != 0) {
          var mult1 = VAR("mult1_" + i.toString(), dut.io.mult1.getWidth)
          var mult2 = VAR("mult2_" + i.toString(), dut.io.mult2.getWidth)
          var t = at_cycle(
            rst(false) &&
            is(dut.io.rstn, true) &&
              is(dut.io.data_rdy, true) &&
              is_bv(dut.io.mult1, mult1) &&
              is_bv(dut.io.mult2, mult2),
            i
          )
          antArray = antArray :+ t
        }else{
          var t = at_cycle(
            is(dut.io.rstn, false) ,
            i
          )
          antArray = antArray :+ t
        }
      }


      for (i <- n+1 until 2 * n) {
        var mult1 = VAR("mult1_" + (i - n ).toString(), dut.io.mult1.getWidth)
        var mult2 = VAR("mult2_" + (i - n ).toString(), dut.io.mult2.getWidth)

        var t = at_cycle(
          is_bv(dut.io.res, MULT(mult1, mult2)),
          i
        )
        consArray = consArray :+ t
      }
      val ant_ = antArray.reduce(_ && _)
      val cons_ = consArray.reduce(_ && _)

      val assert = new Assert(ant_, cons_, () => new MultMan(n, n), SMT)

      assert.STE

    }
  }

}
