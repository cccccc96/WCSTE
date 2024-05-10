// package mfcpu

// import chisel3._
// import chiseltest._
// import org.scalatest.flatspec.AnyFlatSpec
// import SymbolicTrajectoryEvaluation._
// import scala.collection.mutable.ArrayBuffer


// /** This is a trivial example of how to run this Specification From within sbt
//   * use:
//   * {{{
//   * testOnly gcd.GcdDecoupledTester
//   * }}}
//   * From a terminal shell use:
//   * {{{
//   * sbt 'testOnly gcd.GcdDecoupledTester'
//   * }}}
//   * //
//   */
// class cpuSpec2 extends AnyFlatSpec with ChiselScalatestTester {

//   "peek poke" should "pass" in {
//     test(new RISCVCPUv2()) { dut =>
//       // //12 = 12+13
//       // var x = "h00068033"
//       // dut.io.rvfi.rst.poke(true.B)
//       // // dut.io.rvfi.insn_in(0).poke("h00d60633".U(32.W))
//       // // dut.io.rvfi.insn_in(1).poke("h00d60633".U(32.W))
//       // // dut.io.rvfi.insn_in(2).poke("h00d60633".U(32.W))
//       // dut.io.rvfi.insn_in(0).poke(x.U(32.W))
//       // dut.io.rvfi.insn_in(1).poke(x.U(32.W))
//       // dut.io.rvfi.insn_in(2).poke(x.U(32.W))
//       // dut.io.rvfi.rs1_addr_in.poke(13.U)
//       // dut.io.rvfi.rs2_addr_in.poke(0.U)
//       // dut.io.rvfi.rs1_rdata_in.poke(1.U)
//       // dut.io.rvfi.rs2_rdata_in.poke(2.U)
//       // for(i <- 0 until 15){
//       //   dut.clock.step(1)
//       //   print(s"${i+1} clock : ")
//       //   println(dut.io.rvfi.regs(0).peek())
//       //   println(dut.io.rvfi.regs(13).peek())
//       //   println(dut.io.rvfi.mem_rdata.peek())
//       //   dut.io.rvfi.rst.poke(false.B)
//       // }


//       var x = "h00c60633"
      
//       //12 = 12+13
//       dut.io.rvfi.rst.poke(true.B)
//       dut.io.rvfi.insn_in(0).poke("h0000F883".U(32.W))
//       dut.io.rvfi.insn_in(1).poke("h00508A83".U(32.W))
//       // dut.io.rvfi.insn_in(2).poke("h00068033".U(32.W))
//       dut.io.rvfi.insn_in(2).poke("h03488063".U(32.W))

//       // dut.io.rvfi.insn_in(0).poke("h000a8583".U(32.W))
//       // dut.io.rvfi.insn_in(1).poke("h00078003".U(32.W))
//       // // dut.io.rvfi.insn_in(2).poke("h00068033".U(32.W))
//       // dut.io.rvfi.insn_in(2).poke("h000b00263".U(32.W))
//       // dut.io.rvfi.insn_in(2).poke("h000b00263".U(32.W))
//       dut.io.rvfi.rs1_addr_in.poke(1.U)
//       dut.io.rvfi.rs2_addr_in.poke(5.U)
//       dut.io.rvfi.rs1_rdata_in.poke(1.U)
//       dut.io.rvfi.rs2_rdata_in.poke(2.U)
//       dut.io.rvfi.mem_addr_in(0).poke(1.U)
//       dut.io.rvfi.mem_addr_in(1).poke(6.U)
//       dut.io.rvfi.mem_data_in(0).poke(1.U)
//       dut.io.rvfi.mem_data_in(1).poke(10.U)
//       for(i <- 0 until 12){
//         dut.clock.step(1)
//         print(s"${i+1} clock : \n")
//         println("reg1: "+dut.io.rvfi.regs(1).peek().toString())
//         println("reg17: "+dut.io.rvfi.regs(17).peek().toString())
//         println("reg21: "+dut.io.rvfi.regs(21).peek().toString())
//         println("pc_rdata: "+dut.io.rvfi.pc_rdata.peek().toString())
//         println("pc_wdata: "+dut.io.rvfi.pc_wdata.peek().toString())
//         println(dut.io.rvfi.mem_wdata.peek().toString())
//         dut.io.rvfi.rst.poke(false.B)
//       }
//     }
//   }

// }
