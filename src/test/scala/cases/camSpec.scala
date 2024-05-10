package cases

import SymbolicTrajectoryEvaluation._
import chisel3._
import chiseltest._
import org.scalatest.freespec.AnyFreeSpec
import scala.collection.mutable.ArrayBuffer
import chisel3._

class camSpec extends AnyFreeSpec with ChiselScalatestTester {

  // ("cam Spec2") in {
  //   test(new CAM_m_n(64,64)) { dut =>
  //     def camline_data(i: Int) = {
  //       VAR(s"CAMLINEDATA${i}", 64)
  //     }
  //     val keyIn = VAR(s"keyIn",64)

  //     var t: trajFormula = rst(false) && is_bv(dut.io.key,keyIn)
  //     for (i <- 1 to 64) {
  //       for(j<-1 to 64) {
  //         t = t&&is(s"i${i}/i${j}/oi", BV_EXTRACT(camline_data(i), j-1, j-1))
  //       }
  //     }
  //     val ant =at_cycle(t, 0)

  //     var eqs:VAR = (camline_data(1) == keyIn)
  //     for(i<- 2 to 64) {
  //       eqs =(eqs| (camline_data(i) == keyIn))
  //     }
  //     val cons = at_cycle(
  //       is(dut.io.hit,eqs), 
  //       0)

  //     val assert = new Assert(ant, cons, () => new CAM_m_n(64,64), BDD)
  //     assert.STE
  //   }
  // }

  // ("cam Spec") in {
  //   test(new CAM_m_n(2,4)) { dut =>
  //     def camline_data(i: Int) = {
  //       VAR(s"CAMLINEDATA${i}", 2)
  //     }
  //     val keyIn = VAR(s"keyIn",2)
  //     var t: trajFormula = rst(false) && is_bv(dut.io.key,keyIn)
  //     for (i <- 1 to 4) {
  //       t = t && is(s"i${i}/i1/oi", BV_EXTRACT(camline_data(i), 0, 0))
  //       t = t && is(s"i${i}/i2/oi", BV_EXTRACT(camline_data(i), 1, 1))
  //     }
  //     val ant =at_cycle(t, 0)

  //     var eqs:VAR = (camline_data(1) == keyIn)
  //     for(i<- 2 to 4) {
  //       eqs =(eqs| (camline_data(i) == keyIn))
  //     }
  //     val cons = at_cycle(
  //       is(dut.io.hit,eqs), 
  //       0)

  //     val assert = new Assert(ant, cons, () => new CAM_m_n(2,4), BDD)
  //     assert.STE
  //   }
  // }

  // ("cam Spec smt") in {
  //   test(new CAM_m_n(2,4)) { dut =>
  //     def camline_data(i: Int) = {
  //       VAR(s"CAMLINEDATA${i}", 2)
  //     }
  //     def suf(i:Int) = {
  //       if(i==0){
  //         ""
  //       }else{
  //         s"_$i"
  //       }
  //     }
  //     val keyIn = VAR(s"keyIn",2)
  //     var t: trajFormula = rst(false) && is_bv(dut.io.key,keyIn)
  //     for (i <- 0 until 4) {
  //       t = t && is(s"CAMLine_m${suf(i)}.CAMCell${suf(0)}.oi", BV_EXTRACT(camline_data(i), 0, 0))
  //       t = t && is(s"CAMLine_m${suf(i)}.CAMCell${suf(1)}.oi", BV_EXTRACT(camline_data(i), 1, 1))
  //     }
  //     val ant =at_cycle(t, 0)

  //     var eqs:VAR = (camline_data(0) == keyIn)
  //     for(i<- 1 until 4) {
  //       eqs =(eqs| (camline_data(i) == keyIn))
  //     }
  //     val cons = at_cycle(
  //       is(dut.io.hit,eqs), 
  //       0)

  //     val assert = new Assert(ant, cons, () => new CAM_m_n(2,4), SMT)
  //     assert.STE
  //   }
  // }

   ("cam Spec2 smt") in {
    var n = 64; //data

    var m = 64; //how much data can be stored

    test(new CAM_m_n(m,n)) { dut =>
      def camline_data(i: Int) = {
        VAR(s"CAMLINEDATA${i}", n)
      }
      def suf(i:Int) = {
        if(i==0){
          ""
        }else{
          s"_$i"
        }
      }
      val keyIn = VAR(s"keyIn",n)
      var t: trajFormula = rst(false) && is_bv(dut.io.key,keyIn)
      for (i <- 0 until m) {
        for(j <- 0 until n){
          t = t && is(s"CAMLine_m${suf(i)}.CAMCell${suf(j)}.oi", BV_EXTRACT(camline_data(i), j, j))
        }

      }
      val ant =at_cycle(t, 0)

      var eqs:VAR = (camline_data(0) == keyIn)
      for(i<- 1 until m) {
        eqs =(eqs| (camline_data(i) == keyIn))
      }
      val cons = at_cycle(
        is(dut.io.hit,eqs), 
        0)

      val assert = new Assert(ant, cons, () => new CAM_m_n(m,n), SMT)
      assert.STE
    }
  }

  // ("fifo ste assert pass use peekpoke") in {
  //   val w = 8
  //   val size = 16
  //   test(new srFIFO(w, size)) { dut =>
  //     dut.io.dataIn.poke(3.U)
  //     dut.io.push.poke(true.B)
  //     dut.clock.step()
  //     dut.io.push.poke(false.B)
  //     dut.io.pop.poke(true.B)
  //     println(dut.io.dataOut.peek().toString())
  //     dut.clock.step()
  //   }
  // }

}
