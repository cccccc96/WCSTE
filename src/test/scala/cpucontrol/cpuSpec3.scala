/**
  * self- consistent 指令
  */

package cpucontrol

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
class cpuSpec3 extends AnyFlatSpec with ChiselScalatestTester {

  "mfcpu ste assert complicate" should "pass" in {
    test(new self()) { dut =>
      // variables
      val x1 = VAR("x1",1)
      val x2 = VAR("x2",1)
      val y1 = VAR("y1",1)
      val y2 = VAR("y2",1)

      val ins1 = VAR("ins1",32)
      val ins2 = VAR("ins2",32)
      val ins3 = VAR("ins3",32)
      val ins4 = VAR("ins4",32)
      val ins5 = VAR("ins5",32)
      val ins6 = VAR("ins6",32)
      val ins7 = VAR("ins7",32)
      val ins8 = VAR("ins8",32)


      var antArray = ArrayBuffer[trajFormula]()
      var consArray = ArrayBuffer[trajFormula]()

      

      def ant(i: Int) = (
        if (i == 0) {
          at_cycle(
            rst(true) ,
            0
          )
        }else if(i==1){
          at_cycle(
            rst(false) &&
              is(dut.io.rst, true) &&
             is_array(dut.io.insn_in, ins1,0, 31, 0) &&
             is_array(dut.io.insn_in, ins2,1, 31, 0) &&
             is_array(dut.io.insn_in, ins3,2, 31, 0) &&
              is_array(dut.io.insn_in, ins4,3, 31, 0) &&
              is_array(dut.io.insn_in, ins5,4, 31, 0) &&
              is_array(dut.io.insn_in, ins6,5, 31, 0) &&
              is_array(dut.io.insn_in, ins7,6, 31, 0) &&
              is_array(dut.io.insn_in, ins8,7, 31, 0) ,
            1
          )
        } else {
          at_cycle(
            rst(false) &&
              is(dut.io.rst, false) ,
            i
          )
        }
      )


      def cons(i: Int) = {
        at_cycle(
          is(dut.io.o,true),
          i
        )
      }

      for (i <- 0 to 15) {
        antArray += ant(i)
      }
      for (i <- 0 to 15) {
        if(i==14){
          consArray += cons(i)
        }
      }

      val ant_ = antArray.reduce(_ && _)
      val cons_ = consArray.reduce(_ && _)

      val assert = new Assert(ant_, cons_, () => new self(), SMT)
      assert.STE


    }
  }

}
