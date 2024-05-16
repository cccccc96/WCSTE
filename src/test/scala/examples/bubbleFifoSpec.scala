package examples

import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec
import SymbolicTrajectoryEvaluation._
import io.circe.parser._
import io.circe.parser._
import io.circe.{Json, JsonObject}

class FifoSpec extends AnyFlatSpec with ChiselScalatestTester {


  "bubbleFIFO" should "pass" in {
    val w = 16
    val k = 4
    test(new BubbleFifo(UInt(w.W), k)) { dut =>
      //bundle fresh variables
      val bundle_io_var_push_data = Bundle_VAR(
        new FifoIO(UInt(w.W)),
        """{
        "enq": {
          "valid": true,
          "bits" : "d[15:0]"
        },
        "deq": {
          "ready" : false
        }
      }"""
      )

      val bundle_io_var_data_received = Bundle_VAR(
        new FifoIO(UInt(w.W)),
        """{
        "deq": {
          "valid" : true,
          "bits" : "d[15:0]"
        }
      }"""
      )

      val d = VAR("d", w)
      val ant =
        at_cycle(rst(true),0) &&
          at_cycle(rst(false) && is_bundle(dut.io, bundle_io_var_push_data)
             ,1) &&
          at_cycle(rst(false),2) &&at_cycle(rst(false), 3) &&at_cycle(rst(false), 4) &&at_cycle(rst(false), 5)

      val cons =
        at_cycle(is_bundle(dut.io, bundle_io_var_data_received),
          5
        )

      val assert =
        new Assert(ant, cons, () => new BubbleFifo(UInt(w.W), k), BDD)

      assert.STE

    }
  }

}
