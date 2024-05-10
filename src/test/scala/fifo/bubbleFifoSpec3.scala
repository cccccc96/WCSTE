package fifo

import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec
import SymbolicTrajectoryEvaluation._
import io.circe.parser._
import io.circe.parser._
import io.circe.{Json, JsonObject}

class FifoSpec3 extends AnyFlatSpec with ChiselScalatestTester {

  // "mytest" should "pass" in {
  //   test(new BubbleFifo(UInt(16.W), 4)) { dut =>
  //     // 第一个时刻，进队请求false，出队请求false，进队数据0xab（无效）
  //     dut.io.enq.bits.asUInt.poke(0xab.U)
  //     dut.io.enq.valid.poke(false.B)
  //     dut.io.deq.ready.poke(false.B)
  //     dut.clock.step()

  //     // 第二个时刻，进队请求true，出队请求false，进队数据0x123
  //     dut.io.enq.bits.asUInt.poke(0x123.U) // anyconst
  //     dut.io.enq.valid.poke(true.B)
  //     dut.clock.step()

  //     // 第三个时刻，进队请求false，出队请求false，进队数据0xab（无效）
  //     dut.io.enq.bits.asUInt.poke(0xab.U)
  //     dut.io.enq.valid.poke(false.B)
  //     // 第四到六个时刻，进队请求false，出队请求false，进队数据0xab（无效）
  //     dut.clock.step(3) // 3正好2不行
  //     println(dut.io.deq.ready.peek().toString())
  //     // 第六个时刻，数据到达，可以进队，可以出队
  //     dut.io.enq.ready.expect(true.B)
  //     dut.io.deq.valid.expect(true.B)
  //     dut.io.deq.bits.asUInt.expect(0x123.U)
  //     // Read it out
  //     dut.io.deq.ready.poke(true.B)
  //     dut.clock.step()
  //     dut.io.deq.valid.expect(false.B)
  //     dut.io.deq.ready.poke(false.B)
  //     dut.clock.step()
  //   }
  // }

  // "bubbleFIFO BDD" should "pass" in {
  //   val w = 16
  //   val k = 4
  //   test(new BubbleFifo(UInt(w.W), k)) { dut =>
  //     val d = VAR("d", w)
  //     val ant =
  //       at_cycle(
  //         rst(true) && is(dut.io.enq.valid, true) && is(
  //           dut.io.deq.ready,
  //           false
  //         ),
  //         0
  //       ) &&
  //         at_cycle(
  //           rst(false) && is(dut.io.enq.valid, true)
  //             && is_bv(dut.io.enq.bits.asUInt, d, w - 1, 0)
  //             && is(dut.io.deq.ready, false),
  //           1
  //         ) &&
  //         at_cycle(
  //           rst(false) && is(dut.io.enq.valid, false) && is(
  //             dut.io.deq.ready,
  //             false
  //           ),
  //           2
  //         ) &&
  //         at_cycle(
  //           rst(false) && is(dut.io.enq.valid, false) && is(
  //             dut.io.deq.ready,
  //             false
  //           ),
  //           3
  //         ) &&
  //         at_cycle(
  //           rst(false) && is(dut.io.enq.valid, false) && is(
  //             dut.io.deq.ready,
  //             false
  //           ),
  //           4
  //         ) &&
  //         at_cycle(
  //           rst(false) && is(dut.io.enq.valid, false) && is(
  //             dut.io.deq.ready,
  //             false
  //           ),
  //           5
  //         )

  //     val cons =
  //       at_cycle(
  //         is(dut.io.deq.valid, true) && is_bv(
  //           dut.io.deq.bits.asUInt,
  //           d,
  //           w - 1,
  //           0
  //         ),
  //         5
  //       )

  //     val assert =
  //       new Assert(ant, cons, () => new BubbleFifo(UInt(w.W), k), SMT)

  //     // assert.STE
  //     val jsonString2 = """
  //   {
  //     "enq": {
  //       "valid": true,
  //       "bits": "d[15:0]"
  //     },
  //     "deq": {
  //       "ready" : false
  //     }
  //   }
  // """

  //     val jsonString = """
  //   {
  //     "enq": {
  //       "valid": true,
  //       "bits": "d[15:0]"
  //     },
  //     "deq": {
  //       "ready" : false
  //     }
  //   }
  // """

  //     // 将JSON字符串解析为Json
  //     val json: Json = parse(jsonString).getOrElse(Json.Null)

  //     // 遍历JSON
  //     // traverseJson(json, "")
  //     val bundle_io_var = Bundle_VAR(new FifoIO(UInt(w.W)),jsonString)
  //     println("czh")
  //     println(is_bundle(dut.io,bundle_io_var).eval1(1))
  //     println(P.vars)

  //     // def traverseJson(json: Json, prefix: String): Unit = {
  //     //   json.fold(
  //     //     (),
  //     //     bool => println(s"Boolean: $prefix = $bool"),
  //     //     num => println(s"Number: $prefix =  $num"),
  //     //     str => println(s"String: $prefix =  $str"),
  //     //     arr =>
  //     //       arr.zipWithIndex.foreach { case (element, index) =>
  //     //         println(s"Index: $index")
  //     //         traverseJson(element, prefix)
  //     //       },
  //     //     obj =>
  //     //       obj.toList.foreach { case (key, value) =>
  //     //         println(s"Key: ${prefix}$key")
  //     //         traverseJson(value, prefix + key + ".")
  //     //       }
  //     //   )
  //     // }
  //   }
  // }

  "bubbleFIFO BDD" should "pass" in {
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

  // "BubbleFifo" should "pass" in {
  //   test(new BubbleFifo(UInt(16.W), 4)).withAnnotations(Seq(WriteVcdAnnotation)) { dut =>
  //     testFn(dut)
  //   }
  // }

  // "DoubleBufferFifo" should "pass" in {
  //   test(new DoubleBufferFifo(UInt(16.W), 4)).withAnnotations(Seq(WriteVcdAnnotation)) { dut =>
  //     testFn(dut)
  //   }
  // }
}
