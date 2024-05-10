package mult

import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec
import SymbolicTrajectoryEvaluation._
import scala.collection.mutable.ArrayBuffer

//记得修改pono中的mult参数

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

  var n = 12;
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
      // var mult1 = VAR("mult1_"+0.toString(), dut.io.mult1.getWidth)
      // var mult2 = VAR("mult2_"+0.toString(), dut.io.mult2.getWidth)
      // var g = (!(mult1==BV_CONST(0,n))) & (!(mult2==BV_CONST(0,n)))
      // for(i <- 1 until n)
      // {
      //   var mult1 = VAR("mult1_"+i.toString(), dut.io.mult1.getWidth)
      //   var mult2 = VAR("mult2_"+i.toString(), dut.io.mult2.getWidth)
      //   g = g & ((!(mult1==BV_CONST(0,n))) & (!(mult2==BV_CONST(0,n))))
      // }

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

  "mfcpu ste assertds22" should "pass" in {
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
      // var mult1 = VAR("mult1_"+0.toString(), dut.io.mult1.getWidth)
      // var mult2 = VAR("mult2_"+0.toString(), dut.io.mult2.getWidth)
      // var g = (!(mult1==BV_CONST(0,n))) & (!(mult2==BV_CONST(0,n)))
      // for(i <- 1 until n)
      // {
      //   var mult1 = VAR("mult1_"+i.toString(), dut.io.mult1.getWidth)
      //   var mult2 = VAR("mult2_"+i.toString(), dut.io.mult2.getWidth)
      //   g = g & ((!(mult1==BV_CONST(0,n))) & (!(mult2==BV_CONST(0,n))))
      // }

      for (i <- n+1 until 2 * n) {
        var mult1 = VAR("mult1_" + (i - n ).toString(), dut.io.mult1.getWidth)
        var mult2 = VAR("mult2_" + (i - n ).toString(), dut.io.mult2.getWidth)

        var t = at_cycle(
          is_bv(dut.io.res, BV_EXTRACT(MULT(mult1, mult2),n/2-1,0) , n/2-1 , 0),
          i
        )
        consArray = consArray :+ t
      }
      val ant_ = antArray.reduce(_ && _)
      val cons_ = consArray.reduce(_ && _)

      val assert = new Assert(ant_, cons_, () => new MultMan(n, n), BDD)

      assert.STE

    }
  }

}
