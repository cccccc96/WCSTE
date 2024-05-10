/**
  * ld 指令
  */

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
class cpuSpec6 extends AnyFlatSpec with ChiselScalatestTester {

  "mfcpu ste assert complicate" should "pass" in {
    test(new RISCVCPUv2()) { dut =>
      val rs1_addr_in = VAR("rs1_addr_in",5)
      val rs2_addr_in = VAR("rs2_addr_in",5)
      val rs1_rdata_in = VAR("rs1_rdata_in",64)
      val rs2_rdata_in = VAR("rs2_rdata_in",64)
      val mem_addr_in_0 = VAR("mem_addr_in_0",10)
      val mem_addr_in_1 = VAR("mem_addr_in_1",10)
      val mem_data_in_0 = VAR("mem_data_in_0",32)
      val mem_data_in_1 = VAR("mem_data_in_1",32)

      val ldrs1_0 = VAR("ldrs1_0",5)
      val ldrd_0 = VAR("ldrd_0",5)
      val ldrs1_1 = VAR("ldrs1_1",5)
      val ldrd_1 = VAR("ldrd_1",5)

      val pcj = 16




      def ld_insn(i:Int,rs1:VAR,rd:VAR) = {
          is_array(dut.io.rvfi.insn_in, 0, i, 31, 20) &&
          is_array(dut.io.rvfi.insn_in, 0, i, 14, 12) &&
          is_array(dut.io.rvfi.insn_in, 3, i, 6, 0) &&
          is_array(dut.io.rvfi.insn_in, rs1, i, 19, 15) &&
          is_array(dut.io.rvfi.insn_in, rd, i, 11, 7)
      }

      def beq_insn(i:Int,rs2:VAR,rs1:VAR,pcj:Int) = {
          is_array(dut.io.rvfi.insn_in, 0, i, 31, 25) &&
          is_array(dut.io.rvfi.insn_in, 0, i, 14, 12) &&
          is_array(dut.io.rvfi.insn_in, 99, i, 6, 0) &&
          is_array(dut.io.rvfi.insn_in, rs2, i, 24, 20) &&
          is_array(dut.io.rvfi.insn_in, rs1, i, 19, 15) &&
          is_array(dut.io.rvfi.insn_in, pcj, i, 11, 7)
      }
      

      def constrain() = {
        (rs1_addr_in==ldrs1_0) &
        (rs2_addr_in==ldrs1_1) &
        (!(mem_addr_in_0 == mem_addr_in_1))  &
        (!(ldrd_0==ldrs1_1)) &
        (!(ldrd_0==ldrs1_0)) &
        (!(ldrd_1==ldrs1_1)) &
        (!(ldrd_1==ldrs1_0)) &
        (!(rs1_addr_in==rs2_addr_in)) &
        (!(ldrs1_0==BV_CONST(0,5))) &
        (!(ldrs1_1==BV_CONST(0,5))) &
        (!(ldrd_0==BV_CONST(0,5))) &
        (!(ldrd_1==BV_CONST(0,5))) &
        (!(rs1_rdata_in==BV_CONST(0,64))) &
        (!(rs2_rdata_in==BV_CONST(0,64))) &
        (BV_EXTRACT(rs1_rdata_in,9,0)==mem_addr_in_0) &
        (BV_EXTRACT(rs2_rdata_in,9,0)==mem_addr_in_1) &
        (BV_EXTRACT(rs1_rdata_in,63,10)==BV_CONST(0,54)) &
        (BV_EXTRACT(rs2_rdata_in,63,10)==BV_CONST(0,54)) 
      }

      def constrain2() = {
        (rs1_addr_in==ldrs1_0) &
        (rs2_addr_in==ldrs1_1) &
        (!(mem_addr_in_0 == mem_addr_in_1))  &
        (!(ldrd_0==ldrs1_1)) &
        (!(ldrd_0==ldrs1_0)) &
        (!(ldrd_1==ldrs1_1)) &
        ((ldrd_1==ldrs1_0)) &
        (!(rs1_addr_in==rs2_addr_in)) &
        (!(ldrs1_0==BV_CONST(0,5))) &
        (!(ldrs1_1==BV_CONST(0,5))) &
        (!(ldrd_0==BV_CONST(0,5))) &
        (!(ldrd_1==BV_CONST(0,5))) &
        (!(rs1_rdata_in==BV_CONST(0,64))) &
        (!(rs2_rdata_in==BV_CONST(0,64))) &
        (BV_EXTRACT(rs1_rdata_in,9,0)==mem_addr_in_0) &
        (BV_EXTRACT(rs2_rdata_in,9,0)==mem_addr_in_1) &
        (BV_EXTRACT(rs1_rdata_in,63,10)==BV_CONST(0,54)) &
        (BV_EXTRACT(rs2_rdata_in,63,10)==BV_CONST(0,54)) 
      }

      def ant(i:Int) = {
        if(i==0) {
          at_cycle(
              rst(true) &&
              is(dut.io.rvfi.rst, true) &&
              is_bv(dut.io.rvfi.rs1_addr_in, rs1_addr_in) &&
              is_bv(dut.io.rvfi.rs2_addr_in, rs2_addr_in) &&
              is_bv(dut.io.rvfi.rs1_rdata_in, rs1_rdata_in) &&
              is_bv(dut.io.rvfi.rs2_rdata_in, rs2_rdata_in) &&
              is_array(dut.io.rvfi.mem_addr_in, mem_addr_in_0,0,9,0) &&
              is_array(dut.io.rvfi.mem_addr_in, mem_addr_in_1,1,9,0) &&
              is_array(dut.io.rvfi.mem_data_in, mem_data_in_0,0,31,0) &&
              is_array(dut.io.rvfi.mem_data_in, mem_data_in_1,1,31,0) &&
              ld_insn(0,ldrs1_0,ldrd_0) &&ld_insn(1,ldrs1_1,ldrd_1) &&beq_insn(2,ldrd_0,ldrd_1,pcj),
              0
          )
        }else{
          at_cycle(
            rst(false)&&
              is(dut.io.rvfi.rst, false),
            i
          )
        }
      }

      def cons(i:Int) = {
        if(i==5){
          at_cycle(
            Imply((!(ldrd_0 == ldrd_1))&constrain(), is_bv(dut.io.rvfi.rd_wdata, mem_data_in_0))
            ,
            i
          )
        }
      }


      // trajFormula数组
      var antArray = ArrayBuffer[trajFormula]()
      var consArray = ArrayBuffer[trajFormula]()

      for (i <- 0 to 7) {
        antArray += ant(i)
      }
      for (i <- 0 to 7) {
        if(i==5){
          consArray += at_cycle(
            Imply((!(ldrd_0 == ldrd_1))&constrain(), is_bv(dut.io.rvfi.rd_wdata, mem_data_in_0,31,0))
            ,
            i
          )
        }else if(i==6){
          consArray += at_cycle(
            Imply((!(ldrd_0 == ldrd_1))&constrain(), is_bv(dut.io.rvfi.rd_wdata, mem_data_in_1,31,0))
            ,
            i
          )
        }else if(i==7) {
            consArray += at_cycle(
            Imply((!(ldrd_0 == ldrd_1))&constrain2(), is_bv(dut.io.rvfi.rd_wdata, mem_data_in_1,31,0))
            ,
            i
          )
        }
      }

      val ant_ = antArray.reduce(_ && _)
      val cons_ = consArray.reduce(_ && _)

      val assert = new Assert(ant_, cons_, () => new RISCVCPUv2(), BDD)
      assert.STE


    }
  }

}
