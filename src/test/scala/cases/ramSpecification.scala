package cases

import SymbolicTrajectoryEvaluation._
import chisel3._;import org.scalatest.freespec.AnyFreeSpec;
import chiseltest._
class ramSpec3 extends AnyFreeSpec with ChiselScalatestTester {
  "simple specification --- ram read adr followed by write to adr" in {
    val width = 2;val addr_size = 2;
    test(new RWSmem(width, addr_size)) { dut =>
      var addr = VAR("addrv", width)
      var data = VAR("data", addr_size)
      var ant: trajFormula =
        at_cycle(is(dut.io.enable, true) && is(dut.io.write, true) && 
              is_bv(dut.io.addr,addr)&&is_bv(dut.io.dataIn,data),0) &&
        at_cycle(is(dut.io.enable, true) && is(dut.io.write, false) && 
              is_bv(dut.io.addr,addr),1)
      var cons = at_cycle(is_bv(dut.io.dataOut, data), 1)
      new Assert(ant, cons, () => new RWSmem(width, addr_size), BDD)
    }
  }
}
