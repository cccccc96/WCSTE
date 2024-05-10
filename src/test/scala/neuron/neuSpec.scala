package neuron

import SymbolicTrajectoryEvaluation._
import chisel3._
import chiseltest._
import org.scalatest.freespec.AnyFreeSpec
import scala.collection.mutable.ArrayBuffer
import chisel3._
import chisel3.experimental.{FixedPoint, _}

class neuronSpec extends AnyFreeSpec with ChiselScalatestTester {
  ("neuron ste assert pass use SMT") in {
    val Step: FixedPoint => FixedPoint = x => Mux(x <= 0.F(8.BP), 0.F(8.BP), 1.F(8.BP))
    val ReLU: FixedPoint => FixedPoint = x => Mux(x <= 0.F(8.BP), 0.F(8.BP), x)
    test(new Neuron(2, Step)) { dut =>
        val i1 = FixedPoint_VAR("i1",16,8)
        val i2 = FixedPoint_VAR("i2",16,8)
        val w1 = FixedPoint_VAR("w1",16,8)
        val w2 = FixedPoint_VAR("w2",16,8)
        val ant = at_cycle(
          is_array(dut.io.in,i1,0,15,0)&&
          is_array(dut.io.in,i2,1,15,0)&&
          is_array(dut.io.weights,w1,0,15,0)&&
          is_array(dut.io.weights,w2,1,15,0)
          ,0
        )
        // val cons= at_cycle(
        //   Imply(BV_CONST(0,32)>(i1*w1+i2*w2),is_bv(dut.io.out,BV_CONST(0,16),15,0)
        // ),0)
        val cons= at_cycle(
          Imply((BV_CONST(0,32)>(i1*w1+i2*w2)),is_fixedpoint(dut.io.out,FixedPoint_COSNT(0,"00000000",16,8))
        ),0)
        val assert = new Assert(ant, cons, () => new Neuron(2, Step), SMT)

        assert.STE
        // println(dut.io.out.)
      
    }
  }


}
