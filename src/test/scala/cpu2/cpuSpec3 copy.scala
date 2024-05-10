/**
  * self- consistent 指令
  */

package cpu2

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
class cpuSpec2 extends AnyFlatSpec with ChiselScalatestTester {

  "mfcpu ste assert complicate" should "pass" in {
    test(new self()) { dut =>
      dut.io.rst.poke(true.B)
      for(i <- 0 until 2){
        dut.io.insn_in(i).poke("h01ea8eb3".U)
      }
      dut.clock.step(1)
      for(i<- 0 until 8) {
        println(i)
        println(dut.io.regs1.peek())
        println(dut.io.regs2.peek())
        println(dut.io.insn_out1.peek())
        println(dut.io.insn_out2.peek())
        println("io_equal_o"+dut.io.o.peek().toString())
        dut.io.rst.poke(false.B)
         dut.clock.step(1)
      }
    
    }
  }

}
