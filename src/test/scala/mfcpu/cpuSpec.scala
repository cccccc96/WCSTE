package mfcpu

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
class cpuSPec extends AnyFlatSpec with ChiselScalatestTester {

 "mfcpu ste assertds2" should "pass" in {
    test(new RISCVCPUv2()) { dut =>
      // variables
      val k = 5
      val max_cycle = k + 4
      val adr_width = dut.io.rvfi.rs1_addr_in.getWidth
      val data_width = dut.io.rvfi.rs1_rdata_in.getWidth
      val a1 = VAR("a1", adr_width)
      val a2 = VAR("a2", adr_width)
      val a3 = VAR("a3", adr_width)
      val d1 = VAR("d1", data_width)
      val d2 = VAR("d2", data_width)
      // trajFormula数组
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
      def ant_insn(i: Int) = (
        is_array(dut.io.rvfi.insn_in, 0, i, 31, 25) &&
          is_array(dut.io.rvfi.insn_in, 0, i, 14, 12) &&
          is_array(dut.io.rvfi.insn_in, 51, i, 6, 0) &&
          is_array(dut.io.rvfi.insn_in, a2, i, 24, 20) &&
          is_array(dut.io.rvfi.insn_in, a1, i, 19, 15) &&
          is_array(dut.io.rvfi.insn_in, a3, i, 11, 7)
      )

      def ant(i: Int) = (
        if (i == 0) {
          at_cycle(
            rst(true) &&
              is(dut.io.rvfi.rst, true) &&
              is_bv(dut.io.rvfi.rs1_addr_in, a1) &&
              is_bv(dut.io.rvfi.rs2_addr_in, a2) &&
              is_bv(dut.io.rvfi.rs1_rdata_in, d1) &&
              is_bv(dut.io.rvfi.rs2_rdata_in, d2) &&
              ant_insn(0)&&ant_insn(1),
            0
          )
        } else {
          at_cycle(
            rst(false) &&
              is(dut.io.rvfi.rst, false),
            i
          )
        }
      )

      def cons(i: Int) = {
        at_cycle(
          Imply((!(a1 == a2))&(!(a1 == a3))&(!(a2 == a3)), is_bv(dut.io.rvfi.rd_wdata, d1 + d2)),
          i
        )
      }

      for (i <- 0 to k+4) {
        antArray += ant(i)
      }
      for (i <- 0 to k+4) {
        if (i == 5) {
          consArray += cons(i)
        }
      }

      val ant_ = antArray.reduce(_ && _)
      println(ant_.eval2())


      val cons_ = consArray.reduce(_ && _)

      val assert = new Assert(ant_, cons_, () => new RISCVCPUv2(),  SMT)
      
      assert.STE


    }
  }

  // 重构前的代码
  // 代码已重构，该部分待修改
  "mfcpu ste assert" should "pass" in {
    test(new RISCVCPUv2()) { dut =>
     dut.io.rvfi.rst.poke(true.B)
     dut.io.rvfi.rs1_addr_in.poke(1.U)
     dut.io.rvfi.rs2_addr_in.poke(2.U)
     dut.io.rvfi.rs1_rdata_in.poke(10.U)
     dut.io.rvfi.rs2_rdata_in.poke(10.U)
     dut.io.rvfi.insn_in(0).poke("0h0x01ea8eb3".U)
     dut.clock.step()
    //  println(dut.io.rvfi.insns.peek().toString())


    }
  }

  "mfcpu ste assert complicate" should "pass" in {
    test(new RISCVCPUv2()) { dut =>
      // variables
      val m = 2 //指令数
      val k = 5
      val max_cycle = k + 4
      val adr_width = dut.io.rvfi.rs1_addr_in.getWidth
      val data_width = dut.io.rvfi.rs1_rdata_in.getWidth
      val a1 = VAR("a1", adr_width)
      val a2 = VAR("a2", adr_width)
      val a3 = VAR("a3", adr_width)
      val d1 = VAR("d1", data_width)
      val d2 = VAR("d2", data_width)
      // trajFormula数组
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
      def ant_insn(i: Int) = (
        is_array(dut.io.rvfi.insn_in, 0, i, 31, 25) &&
          is_array(dut.io.rvfi.insn_in, 0, i, 14, 12) &&
          is_array(dut.io.rvfi.insn_in, 51, i, 6, 0) &&
          is_array(dut.io.rvfi.insn_in, a2, i, 24, 20) &&
          is_array(dut.io.rvfi.insn_in, a1, i, 19, 15) &&
          is_array(dut.io.rvfi.insn_in, a3, i, 11, 7)
      )

      def ant_nop(i: Int) = (
        is_array(dut.io.rvfi.insn_in, 19, i, 31, 0) 
      )
      
      def ant_insn_() = {
        var res = ant_insn(0)
        for(i<- 1 until m){
          res = res && ant_insn(i)
        }
        for(i<-m until dut.io.rvfi.k){
          res = res && ant_nop(i)
        }
        res 
      }

      def ant(i: Int) = (
        if (i == 0) {
          at_cycle(
            rst(true) &&
              is(dut.io.rvfi.rst, true) &&
              is_bv(dut.io.rvfi.rs1_addr_in, a1) &&
              is_bv(dut.io.rvfi.rs2_addr_in, a2) &&
              is_bv(dut.io.rvfi.rs1_rdata_in, d1) &&
              is_bv(dut.io.rvfi.rs2_rdata_in, d2) &&

              ant_insn(0)&&ant_insn(1),
            0
          )
        } else {
          at_cycle(
            rst(false) &&
              is(dut.io.rvfi.rst, false) ,
            i
          )
        }
      )

      def cons(i: Int) = {
        at_cycle(
          Imply((!(a1 == a2)), is_bv(dut.io.rvfi.rd_wdata, d1 + d2)),
          i
        )
      }
      def cons2(i: Int) = {
        at_cycle(
          Imply(((!(a1 == a2))&(((a1 == a3))|((a2 == a3)))), is_bv(dut.io.rvfi.mem_rdata, d1 + d2)),
          i
        )
      }

      for (i <- 0 to k+m+6) {
        antArray += ant(i)
      }
      for (i <- 0 to k+m+6) {
        if(i==7){
          consArray += cons(i)
        }
      }

      val ant_ = antArray.reduce(_ && _)
      println(ant_.eval2())


      val cons_ = consArray.reduce(_ && _)

      val assert = new Assert(ant_, cons_, () => new RISCVCPUv2(), SMT)
      assert.STE


    }
  }

}