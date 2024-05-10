import SymbolicTrajectoryEvaluation._
import chisel3._
import chiseltest._
import org.scalatest.freespec.AnyFreeSpec
class fifoSpec2 extends AnyFreeSpec with ChiselScalatestTester {
  ("fifo ste spec") in {
    val w = 2
    val size = 2
    test(new FIFO(w, size)) { dut =>
      def d_var(i: Int) = VAR("d" + i.toString(), w)
      var ant: trajFormula = at_cycle(is(dut.io.rst, true), 0)
      for (i <- 1 to 2 * size) {
        if (i <= size) { // cycle 1 to size push
          ant = ant && at_cycle(
            is(dut.io.rst, false) && is_bv(dut.io.dataIn, d_var(i)) &&
              is(dut.io.push, true) && is(dut.io.pop, false),
            i
          )
        } else { // cycle size+1 to 2*size pop
          ant = ant && at_cycle(
            is(dut.io.rst, false) && is(dut.io.push, false) && is(dut.io.pop, true),
            i
          )
        }
      }
      var cons: trajFormula = at_cycle(
        is(dut.io.full, true) && is_bv(dut.io.dataOut, d_var(size)),
        size + 1
      )
      for (i <- size + 2 to 2 * size) {
        cons = cons && at_cycle(
          is_bv(dut.io.dataOut, d_var(2*size-i+1)) && is(dut.io.full, false),
          i
        )
      }
      val assert = new Assert(ant, cons, () => new FIFO(w, size), SMT)
      assert.STE
    }
  }
}
