package fifo

import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec
import SymbolicTrajectoryEvaluation._
import io.circe.parser._
import io.circe.parser._
import io.circe.{Json, JsonObject}

class FifoSpec2 extends AnyFlatSpec with ChiselScalatestTester {

  "bubbleFIFO BDD" should "pass" in {
    val w = 16
    val k = 4
    test(new BubbleFifo(UInt(w.W), k)) { dut =>
      val d = VAR("d", w)
      val ant =
        at_cycle(
          rst(true) && is(dut.io.enq.valid, true) && is(
            dut.io.deq.ready,
            false
          ),
          0
        ) &&
          at_cycle(
            rst(false) && is(dut.io.enq.valid, true)
              && is_bv(dut.io.enq.bits.asUInt, d, w - 1, 0)
              && is(dut.io.deq.ready, false),
            1
          ) &&
          at_cycle(
            rst(false) && is(dut.io.enq.valid, false) && is(
              dut.io.deq.ready,
              false
            ),
            2
          ) &&
          at_cycle(
            rst(false) && is(dut.io.enq.valid, false) && is(
              dut.io.deq.ready,
              false
            ),
            3
          ) &&
          at_cycle(
            rst(false) && is(dut.io.enq.valid, false) && is(
              dut.io.deq.ready,
              false
            ),
            4
          ) &&
          at_cycle(
            rst(false) && is(dut.io.enq.valid, false) && is(
              dut.io.deq.ready,
              false
            ),
            5
          )

      val cons =
        at_cycle(
          is(dut.io.deq.valid, true) && is_bv(
            dut.io.deq.bits.asUInt,
            d,
            w - 1,
            0
          ),
          5
        )

      val assert =
        new Assert(ant, cons, () => new BubbleFifo(UInt(w.W), k), BDD)

      assert.STE
    

      
    }
  }


}
