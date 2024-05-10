package cases

import SymbolicTrajectoryEvaluation._
import chisel3._
import chiseltest._
import org.scalatest.freespec.AnyFreeSpec
import scala.collection.mutable.ArrayBuffer
import chisel3._

class ramSpec2 extends AnyFreeSpec with ChiselScalatestTester {
  "ram lunwen pass" in {
    val width = 2;
    val addr_size = 2;
    test(new RWSmem(width, addr_size)) { dut =>
      var addr = VAR("addrv", addr_size)
      def memdata(i: Int) = VAR(s"memdata${i}", width)
      var ant: trajFormula =
        at_cycle(
          is(dut.io.enable, true) && is(dut.io.write, true) && is_bv(
            dut.io.addr,
            addr
          ) ,
          0
        ) &&
          at_cycle(
            is(dut.io.enable, true) && is(dut.io.write, false) && is_bv(
              dut.io.addr,
              addr
            )&&is_bv(dut.io.dataOut,memdata(0)),
            1
          )


 //is_bv(dut.io.dataIn, memdata(0))
      var cons = at_cycle(is_bv(dut.io.dataIn, memdata(0)), 0)

      val assert =
        new Assert(ant, cons, () => new RWSmem(width, addr_size), SMT)
      assert.STE

      // var addr = VAR("addr", addr_size)
      // def dataIn(i:Int) = VAR(s"dataIn${i}", width)
      // val ant = at_cycle(
      //   rst(true) &&
      //     is(dut.io.enable, false),
      //   0
      // )
      // val cons = at_cycle(is_bv(dut.io.dataOut, dataIn), 2)
      // val assert =
      //   new Assert(ant, cons, () => new RWSmem(width, addr_size), BDD)
      // assert.STE
    }
  }

}
