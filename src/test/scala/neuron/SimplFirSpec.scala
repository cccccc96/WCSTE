package neuron
import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec
import SymbolicTrajectoryEvaluation._

class SimpleFirTest extends AnyFlatSpec with ChiselScalatestTester {
  behavior of "SimpleFirTest"
  it should "SimpleFirTest" in {
    test(new SimpleFir(1, 2, 1, 1)) { c =>
        def i(n: Int) = {
            VAR(s"i$n",8)
        }
        def ant(t:Int) = {
            at_cycle(
                is_bv(c.io.in,i(t))&&rst(false),t+1)
        }
        val ant_ = at_cycle(rst(true),0)&&ant(0)&&ant(1)&&ant(2)&&ant(3)
        val value = BV_CONST(1,8)*i(0)+BV_CONST(1,8)*i(1)+BV_CONST(2,8)*i(2)+BV_CONST(1,8)*i(3)
        val cons = at_cycle(
            is_bv(c.io.out,value),4)
        val assert = new Assert(ant_, cons, () => new SimpleFir(1, 2, 1, 1), SMT)

        assert.STE


    }
    test(new SimpleFir(1, 2, 1, 1)) { c =>
        c.io.in.poke(0.U)
        // c.io.out.expect(1.U)  // 1, 0, 0, 0
        c.clock.step(1)
        c.io.in.poke(0.U)
        // c.io.out.expect(5.U)  // 4, 1, 0, 0
        c.clock.step(1)
        c.io.in.poke(81.U)
        // c.io.out.expect(8.U)  // 3, 4, 1, 0
        c.clock.step(1)
        c.io.in.poke(0.U)
        println(c.io.out.peek())
        // c.io.out.expect(10.U)  // 2, 3, 4, 1
        c.clock.step(1)
        // c.io.in.poke(7.U)
        // c.io.out.expect(16.U)  // 7, 2, 3, 4
        // c.clock.step(1)
        // c.io.in.poke(0.U)
        // c.io.out.expect(12.U)  // 0, 7, 2, 3
    }
    // // Nonsymmetric filter
    // test(new SimpleFir(1, 2, 3, 4)) { c =>
    //     c.io.in.poke(1.U)
    //     c.io.out.expect(1.U)  // 1*1, 0*2, 0*3, 0*4
    //     c.clock.step(1)
    //     c.io.in.poke(4.U)
    //     c.io.out.expect(6.U)  // 4*1, 1*2, 0*3, 0*4
    //     c.clock.step(1)
    //     c.io.in.poke(3.U)
    //     c.io.out.expect(14.U)  // 3*1, 4*2, 1*3, 0*4
    //     c.clock.step(1)
    //     c.io.in.poke(2.U)
    //     c.io.out.expect(24.U)  // 2*1, 3*2, 4*3, 1*4
    //     c.clock.step(1)
    //     c.io.in.poke(7.U)
    //     c.io.out.expect(36.U)  // 7*1, 2*2, 3*3, 4*4
    //     c.clock.step(1)
    //     c.io.in.poke(0.U)
    //     c.io.out.expect(32.U)  // 0*1, 7*2, 2*3, 3*4
    // }
    // println("SUCCESS!!")
  }
}
