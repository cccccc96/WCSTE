package ram

import SymbolicTrajectoryEvaluation._
import chisel3._
import chiseltest._
import org.scalatest.freespec.AnyFreeSpec
import scala.collection.mutable.ArrayBuffer
import chisel3._

class ramSpec extends AnyFreeSpec with ChiselScalatestTester {
  "ram pass" in {
    // experimental parameter:
    // 64;6
    // 128;7
    // 256;10
    val width = 128;
    val addr_size = 7;
    test(new RWSmem(width, addr_size)) { dut =>
      var addr = VAR("addrv", addr_size)
      def memdata(i: Int) = VAR(s"memdata${i}", width)
      var ant: trajFormula = is(dut.io.enable, true) && is(dut.io.write, false)
      ant = ant && is_bv(dut.io.addr, addr)
      for (i <- 0 until math.pow(2, addr_size).toInt) {
        ant = ant && is_array(dut.mem, memdata(i), i, width - 1, 0)
      }
      ant = at_cycle(ant, 0)
      val cons_array = new ArrayBuffer[trajFormula]()
      for (i <- 0 until math.pow(2, addr_size).toInt) {
        var guard = EQUAL(addr, BV_CONST(i, addr_size))
        cons_array += Imply(guard, is_bv(dut.io.dataOut, memdata(i)))
      }
      var cons:trajFormula = cons_array.reduce(_ && _)
      cons = at_cycle(cons, 0)

      val assert =
        new Assert(ant, cons, () => new RWSmem(width, addr_size), SMT)
      assert.STE

    }
  }

}
