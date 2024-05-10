package cases

import chisel3._
import chiseltest._
import org.scalatest.freespec.AnyFreeSpec
import scala.collection.mutable.ArrayBuffer
import chisel3._
import SymbolicTrajectoryEvaluation._

class anderPeekPoke extends AnyFreeSpec with ChiselScalatestTester {


  ("ander peek poke") in {
    test(new Ander()) { dut =>
      dut.io.a.poke(true.B)
      dut.io.b.poke(true.B)
      dut.io.c.poke(true.B)
      dut.clock.step(1)
      dut.io.o.expect(true.B)
    }
  }


}
