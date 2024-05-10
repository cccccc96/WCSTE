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

class MatSpec extends AnyFreeSpec with ChiselScalatestTester {
  ("Mat Spec assert pass use SMT") in {
    val ninbits = 8;
    val n =2;
    def mmul(a: Array[Array[VAR]], b: Array[Array[VAR]]): Array[Array[VAR]] = {
      val numRowsA = a.length
      val numColsA = a(0).length
      val numColsB = b(0).length
      val result = Array.ofDim[VAR](numRowsA, numColsB)
      for (i <- 0 until numRowsA) {
        for (j <- 0 until numColsB) {
          var sum: VAR = a(i)(0) * b(0)(j)
          for (k <- 1 until numColsA) {
            sum = sum + a(i)(k) * b(k)(j)
          }
          result(i)(j) = sum
        }
      }
      result
    }

    test(new SMatMul(n)) { dut =>
      val a: Array[Array[VAR]] = Array.ofDim[VAR](n, n)
      for (i <- 0 until n) {
        for (j <- 0 until n) {
          a(i)(j) = VAR(f"a$i$j", ninbits)
        }
      }
      val b: Array[Array[VAR]] = Array.ofDim[VAR](n, n)
      for (i <- 0 until n) {
        for (j <- 0 until n) {
          b(i)(j) = VAR(f"b$i$j", ninbits)
        }
      }

      var ant: trajFormula = at_cycle(rst(true), 0);

      for (clk <- 0 until 2 * n) {
        var ant_t :trajFormula = rst(false)
        for (idx <- 0 until n) {
          val p = clk - idx
          if (p >= 0 && p < n) {
            // dut.io.in_a(idx).poke(a(idx)(p))
            // dut.io.in_b(idx).poke(b(p)(idx))
            ant_t = ant_t && is_array(dut.io.in_a, a(idx)(p), idx, ninbits-1, 0) &&
              is_array(dut.io.in_b, b(p)(idx), idx, ninbits-1, 0)
          }
           else {
            // dut.io.in_a(idx).poke(0)
            // dut.io.in_b(idx).poke(0)
            ant_t = ant_t && is_array(dut.io.in_a, BV_CONST(0, ninbits), idx, ninbits-1, 0) &&
              is_array(dut.io.in_b, BV_CONST(0, ninbits), idx, ninbits-1, 0)
          }
        }
        ant = ant && at_cycle(ant_t, clk + 1)
      }

      for(clk <- 2*n until 3*n-1){
        var ant_t :trajFormula = rst(false)
        for (idx <- 0 until n) {
          val p = clk - idx

            // dut.io.in_a(idx).poke(0)
            // dut.io.in_b(idx).poke(0)
            ant_t = ant_t && is_array(dut.io.in_a, BV_CONST(0, ninbits), idx, ninbits-1, 0) &&
              is_array(dut.io.in_b, BV_CONST(0, ninbits), idx, ninbits-1, 0)
          
        }
        ant = ant && at_cycle(ant_t, clk + 1)
      }

      var cons:trajFormula = is_array(dut.io.out, mmul(a,b)(0)(0), 0, ninbits*2-1, 0);
      for(i <- 0 until n){
        for(j <- 0 until n){
          if(i!=0||j!=0){
            cons = cons && is_array(dut.io.out, mmul(a,b)(i)(j), i*n+j, ninbits*2-1, 0)        
          }
        }
      }
      cons = at_cycle(cons,3*n-1) 

      // cons = at_cycle(is_array(dut.io.out, mmul(a,b)(0)(0), 0, ninbits*2-1, 0),3*n-1)
      

      // val cons = at_cycle(is_array(dut.io.out,a11*b11+a12*b21,0,15,0)&&
      //   is_array(dut.io.out,a11*b12+a12*b22,1,15,0)&&
      //   is_array(dut.io.out,a21*b11+a22*b21,2,15,0)&&
      //   is_array(dut.io.out,a21*b12+a22*b22,3,15,0)
      //   ,4)

      val assert = new Assert(ant, cons, () => new SMatMul(n), SMT)
      assert.STE

    }
  }
}
