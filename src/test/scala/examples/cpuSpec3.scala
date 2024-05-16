/**
  * self- consistent 指令
  */

package examples

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


      var antArray = ArrayBuffer[trajFormula]()
      var consArray = ArrayBuffer[trajFormula]()

      /*
      antcedent
       */
      // funct7
      // funct3
      // opcode
      // rs2
      // rs1
      // rd
      def ant_insn_ld(i: Int) = (
          is_array(dut.io.insn_in, 3, i, 6, 0)
      )

      def ant_insn_sd(i: Int) = (
          is_array(dut.io.insn_in, 35, i, 6, 0)
      )

      def ant_insn_alu(i: Int) = (
          is_array(dut.io.insn_in, 51, i, 6, 0)
      )

      def ant_insn_NOP(i: Int) = (
        is_array(dut.io.insn_in, 19, i, 31, 0) 
      )

      def ant_insn(g1:VAR,g2:VAR,i:Int) = {
        Imply(g1&g2,ant_insn_ld(i))&&
        Imply(g1&(!g2),ant_insn_sd(i))&&
        Imply((!g1)&g2,ant_insn_alu(i))&&
        Imply((!g1)&(!g2),ant_insn_NOP(i))
      }
      
      def ant_reg() = {
        var res:trajFormula = is_array(dut.io.reg_data_in, VAR(s"reg_dataIn0",64), 0, 63, 0)
        for(i <- 1 until 32){
          res = res && is_array(dut.io.reg_data_in, VAR(s"reg_dataIn$i",64), i, 63, 0)
        }
        res
      }

      def ant_mem() = {
        var res:trajFormula = is_array(dut.io.mem_data_in, VAR(s"mem_dataIn0",32), 0, 31, 0)
        for(i <- 1 until 32){
          res = res && is_array(dut.io.mem_data_in, VAR(s"mem_dataIn$i",32), i, 31, 0)
        }
        res
      }

      def ant(i: Int) = (
        if (i == 0) {
          at_cycle(
            rst(true) &&
              is(dut.io.rst, true) &&
              ant_insn(x1,x2,0) &&
              ant_insn(y1,y2,1) &&
              ant_reg() &&
              ant_mem(),
            0
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

      for (i <- 0 to 9) {
        antArray += ant(i)
      }
      for (i <- 0 to 9) {
        if(i==9){
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
