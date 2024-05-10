package cam

import SymbolicTrajectoryEvaluation._
import chisel3._
import chiseltest._
import org.scalatest.freespec.AnyFreeSpec
import scala.collection.mutable.ArrayBuffer
import chisel3._

class camSpec3 extends AnyFreeSpec with ChiselScalatestTester {

  
   ("cam Spec2 bdd") in {
    var n = 512; //how much data can be stored
    var m = 512; //data width
    test(new CAM_m_n(m,n)) { dut =>
      def camline_data(i: Int) = {
        VAR(s"CAMLINEDATA${i}", m)
      }
      def pref(i:Int) = {
        s"i${i+512}/"
        // s"i${i+1024}/"
      }
      val keyIn = VAR(s"keyIn",m)
      var t: trajFormula = rst(false) && is_bv(dut.io.key,keyIn)

      for(i <- 0 until n){
        t = t && is_bv(s"${pref(i)}camCells", camline_data(i),m-1,0)
      }
      
      val ant =at_cycle(t, 0)

      var eqs:VAR = (camline_data(0) == keyIn)
      for(i<- 1 until n) {
        eqs =(eqs| (camline_data(i) == keyIn))
      }
      val cons = at_cycle(
        is(dut.io.hit,eqs), 
        0)

      val assert = new Assert(ant, cons, () => new CAM_m_n(m,n), BDD)
      assert.STE
    }
  }

  //  ("cam Spec2 smt") in {
  //   var n = 128; //data

  //   var m = 128; //how much data can be stored

  //   test(new CAM_m_n(m,n)) { dut =>
  //     for(i <- 1 until 32){
  //       dut.io.we.poke(true.B)
  //       dut.io.din.poke(i.U)
  //       dut.io.waddr.poke(0.U)
  //       dut.clock.step()

  //       dut.io.we.poke(false.B)
  //       dut.io.key.poke(i.U)
  //       dut.clock.step()
  //       dut.io.hit.expect(true.B)
  //       println(dut.io.hit.peek())

  //     }
  //   }
  // }

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
