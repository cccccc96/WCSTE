package examples


import SymbolicTrajectoryEvaluation._
import chisel3._
import chiseltest._
import org.scalatest.freespec.AnyFreeSpec
import scala.collection.mutable.ArrayBuffer
import chisel3._

class DynamicMemorySearchSPec extends AnyFreeSpec with ChiselScalatestTester {
  ("DynamicMemorySearchSPec")   in {
    var n = 4 
    var w = 8
    var x = 2
    test(new DynamicMemorySearch(n,w)) { dut =>
      val wrAddr = VAR("wrAddr" , x)
      val data = VAR("d" , w)
      var ant = at_cycle(
        rst(true) &&
        is(dut.io.isWr,false)
        ,0
      )&&
      at_cycle(
        rst(false) && 
        is(dut.io.isWr,true) &&
        is_bv(dut.io.wrAddr,wrAddr) &&
        is_bv(dut.io.data,data) && 
        is(dut.io.en,false)
        ,1
      )
      for( i <- 2 to (2+n)){
        ant = ant && at_cycle(
          rst(false) && 
          is(dut.io.isWr,false) &&
          is(dut.io.en,false) &&
          is_bv(dut.io.data,data)
          ,i
        )
      }

      val cons = at_cycle(
        is(dut.io.done,true) &&
        is_bv(dut.io.target,wrAddr)
        ,n+2
      )
      

      val assert = new Assert(ant, cons,() => new DynamicMemorySearch(n,w), SMT)
      assert.STE
    }
  }


}

