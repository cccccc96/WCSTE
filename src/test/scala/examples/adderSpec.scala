package examples


import SymbolicTrajectoryEvaluation._
import chisel3._
import chiseltest._
import org.scalatest.freespec.AnyFreeSpec
import scala.collection.mutable.ArrayBuffer
import chisel3._

class AdderSPec extends AnyFreeSpec with ChiselScalatestTester {

  // //A B cin=0
  // //sum A+B
  // ("spec of sum with no cin")   in {
  //   val n =4
  //   test(new Adder(n)) { dut =>
  //     var a = VAR("a",n)
  //     var b = VAR("b",n)
  //     var ant = at_cycle(
  //       is_bv(dut.io.A,a) &&
  //       is_bv(dut.io.B,b) &&
  //       is(dut.io.Cin,false) 
  //       ,0)
  //     var cons = at_cycle(
  //       is_bv(dut.io.Sum, (a+b))
  //       ,0
  //     )
  //     val assert = new Assert(ant, cons,() => new Adder(n), BDD)
  //     assert.STE
  //   }
  // }

    ("spec of sum with cin")  in {
    val n =4
    test(new Adder(n)) { dut =>
      var a = VAR("a",n)
      var b = VAR("b",n)
      var ant = at_cycle(
        is_bv(dut.io.A,a) &&
        is_bv(dut.io.B,b) &&
        is(dut.io.Cin,true) 
        ,0)
      var cons = at_cycle(
        is_bv(dut.io.Sum, ((a+b)+ BV_CONST(1,n)))
        ,0
      )
      val assert = new Assert(ant, cons,() => new Adder(n), SMT)
      assert.STE
    }
  }


}

