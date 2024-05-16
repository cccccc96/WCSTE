
package mfcpu

import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec
import SymbolicTrajectoryEvaluation._
import scala.collection.mutable.ArrayBuffer



class cpuSpec3 extends AnyFlatSpec with ChiselScalatestTester {

  "mfcpu ste assert complicate" should "pass" in {
    test(new RISCVCPUv2()) { dut =>
      // variables
      val m = 2 
      val k = 5
      val max_cycle = k + 4
      val adr_width = dut.io.rvfi.rs1_addr_in.getWidth
      val data_width = dut.io.rvfi.rs1_rdata_in.getWidth
      val a1 = VAR("a1", adr_width)
      val a2 = VAR("a2", adr_width)
      val a3 = VAR("a3", adr_width)
      val d1 = VAR("d1", data_width)
      val d2 = VAR("d2", data_width)
      // val d1 = 1
      // val d2 = 2
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

      def d_cons() = {
        ( !(a1==BV_CONST(0,adr_width)) & (d1==BV_CONST(0,data_width))) &
        ( !(a2==BV_CONST(0,adr_width)) & (d2==BV_CONST(0,data_width)))
      }

      def cons(i: Int) = {
        at_cycle(
          Imply((!(a1 == a2))&d_cons(), is_bv(dut.io.rvfi.rd_wdata, d1 + d2)) &&
          Imply(((a1 == a2))&d_cons(), is_bv(dut.io.rvfi.rd_wdata, d2 + d2)),
          i
        )
      }
      def cons2(i: Int) = {
        at_cycle(
          Imply((!(a1 == a2))&(!(a3 == a2))&(!(a1 == a3))&d_cons(), is_bv(dut.io.rvfi.mem_rdata, d1 + d2)) &&
          Imply((!(a1 == a2))&(a3==a2)&d_cons(), is_bv(dut.io.rvfi.mem_rdata, d1 + d2 + d1)) &&
          Imply((!(a1 == a2))&(a3==a1)&d_cons(), is_bv(dut.io.rvfi.mem_rdata, d1 + d2 + d2)) &&
          Imply(((a1 == a2))&d_cons(), is_bv(dut.io.rvfi.mem_rdata, d2 + d2)) &&
          Imply(((a1 == a2))&(a3==a1)&d_cons(), is_bv(dut.io.rvfi.mem_rdata, d2 + d2 +d2))
          ,
          i
        )
      }

      for (i <- 0 to 6) {
        antArray += ant(i)
      }
      for (i <- 0 to 6) {
        if(i==5){
          consArray += cons(i)
        }
        if(i==6){
          consArray += cons2(i)
        }
      }

      val ant_ = antArray.reduce(_ && _)
      val cons_ = consArray.reduce(_ && _)

      val assert = new Assert(ant_, cons_, () => new RISCVCPUv2(), SMT)
      assert.STE


    }
  }

}
