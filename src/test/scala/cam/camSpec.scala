package cam

import SymbolicTrajectoryEvaluation._
import chisel3._
import chiseltest._
import org.scalatest.freespec.AnyFreeSpec
import scala.collection.mutable.ArrayBuffer
import chisel3._

class camSpec extends AnyFreeSpec with ChiselScalatestTester {
   ("cam Spec") in {
    // 64;64
    // 128;128
    // 256;256
    var n = 64; //how much data can be stored
    var m = 64; //data width
    test(new CAM_m_n(m,n)) { dut =>
      def camline_data(i: Int) = {
        VAR(s"CAMLINEDATA${i}", m)
      }
      def suf(i:Int) = {
        if(i==0){
          ""
        }else{
          s"_$i"
        }
      }
      val keyIn = VAR(s"keyIn",m)
      var t: trajFormula = rst(false) && is_bv(dut.io.key,keyIn)

      for(i <- 0 until n){
        t = t && is_bv(s"CAMLine${suf(i)}.camCells", camline_data(i),m-1,0)
      }
      
      val ant =at_cycle(t, 0)

      var eqs:VAR = (camline_data(0) == keyIn)
      for(i<- 1 until n) {
        eqs =(eqs| (camline_data(i) == keyIn))
      }
      val cons = at_cycle(
        is(dut.io.hit,eqs), 
        0)

      val assert = new Assert(ant, cons, () => new CAM_m_n(m,n), SMT)
      assert.STE
    }
  }


}
