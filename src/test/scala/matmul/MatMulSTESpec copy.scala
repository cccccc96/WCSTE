//
// SMatMul tester
//
// written by Kazutomo Yoshii <kazutomo.yoshii@gmail.com>
//
package matmul

import chisel3._
import chiseltest._
import org.scalatest.Tag
import org.scalatest.freespec.AnyFreeSpec
import SymbolicTrajectoryEvaluation._

//
// Use scalatest's option flags to include or exclude tags.
//
// To include only RequiresTreadle
// sbt "testOnly matmul.SMatMulSpec -- -n RequiresTreadle"
//
// To exclude RequiresTreadle, which selects RequiresVerilator
// sbt "testOnly matmul.SMatMulSpec -- -l RequiresTreadle"
//


class MatSpec2  extends AnyFreeSpec with ChiselScalatestTester {
 ("Mat Spec assert pass use SMT") in {
    val ninbits = 7;
    test(new SMatMul(32)) { dut =>
        val a11 = VAR("a11",ninbits+1);
        val a12 = VAR("a12",ninbits+1);
        val a21 = VAR("a21",ninbits+1);
        val a22 = VAR("a22",ninbits+1);
        val b11 = VAR("b11",ninbits+1);
        val b12 = VAR("b12",ninbits+1);
        val b21 = VAR("b21",ninbits+1);
        val b22 = VAR("b22",ninbits+1);

        val ant = at_cycle(rst(true),0)&&(
          at_cycle(
            rst(false)&&
          is_array(dut.io.in_a,a11,0,ninbits,0)&&
          is_array(dut.io.in_b,b11,0,ninbits,0) &&
          is_array(dut.io.in_a,BV_CONST(0,ninbits+1),1,ninbits,0)&&
          is_array(dut.io.in_b,BV_CONST(0,ninbits+1),1,ninbits,0)
          ,1)
        )&&(at_cycle(
          rst(false)&&
          is_array(dut.io.in_a,a12,0,ninbits,0)&&
          is_array(dut.io.in_b,b21,0,ninbits,0) &&
          is_array(dut.io.in_a,a21,1,ninbits,0)&&
          is_array(dut.io.in_b,b12,1,ninbits,0)
          ,2)
        )&&(at_cycle(
          rst(false)&&
          is_array(dut.io.in_a,a22,1,ninbits,0)&&
          is_array(dut.io.in_b,b22,1,ninbits,0) &&
          is_array(dut.io.in_a,BV_CONST(0,ninbits+1),0,ninbits,0)&&
          is_array(dut.io.in_b,BV_CONST(0,ninbits+1),0,ninbits,0)
          ,3)
        )

        val cons = at_cycle(
          is_array(dut.io.out,a11*b11+a12*b21,0,15,0)
          ,4)

        // val cons = at_cycle(is_array(dut.io.out,a11*b11+a12*b21,0,15,0)&&
        //   is_array(dut.io.out,a11*b12+a12*b22,1,15,0)&&
        //   is_array(dut.io.out,a21*b11+a22*b21,2,15,0)&&
        //   is_array(dut.io.out,a21*b12+a22*b22,3,15,0)
        //   ,4)

        val assert = new Assert(ant, cons, () => new SMatMul(128), SMT)
        assert.STE
        
      
    }
  }
}
