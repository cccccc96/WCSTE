package examples


import SymbolicTrajectoryEvaluation._
import chisel3._
import chiseltest._
import org.scalatest.freespec.AnyFreeSpec
import scala.collection.mutable.ArrayBuffer
import chisel3._

class RiscvSPec extends AnyFreeSpec with ChiselScalatestTester {

  ("spec of Riscv") in {
    test(new Risc) { dut =>
      var insn = VAR("insn",32)
      var ant = 
        at_cycle(
          rst(true) &&
          is(dut.io.isWr,false) &&
          is(dut.io.boot,false)
          ,0) &&
        at_cycle(
          rst(false)&&
          is(dut.io.isWr,true) &&
          is(dut.io.boot,false) &&
          is_bv(dut.io.wrData,insn) &&
          is_bv(dut.io.wrAddr,0)
          ,1) &&
        at_cycle(
          rst(false)&&
          is(dut.io.isWr,false) &&
          is(dut.io.boot,false)
          ,2
        )
      var cons = 
        at_cycle(
          Imply(
            (BV_EXTRACT(insn,31,24)==BV_CONST(1,8)),
            is_bv(dut.io.out,(BV_EXTRACT(insn,15,8)+BV_EXTRACT(insn,7,0)),7,0)
          )
          ,2
        )
      val assert = new Assert(ant, cons,() => new Risc, SMT)
      assert.STE
    }
  }


}

