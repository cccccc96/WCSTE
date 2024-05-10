// package mfcpu
// import ste._ 


// import chisel3._
// import chiseltest._
// import org.scalatest.freespec.AnyFreeSpec
// import scala.collection.mutable.ArrayBuffer
// import chisel3._

// //
// //class AND(val left:_, val right:_) extends trajFormula{
// //  override def expression: String = ???
// //}


// /**
//  * This is a trivial example of how to run this Specification
//  * From within sbt use:
//  * {{{
//  * testOnly gcd.GcdDecoupledTester
//  * }}}
//  * From a terminal shell use:
//  * {{{
//  * sbt 'testOnly gcd.GcdDecoupledTester'
//  * }}}
// //  */
// class mfcpuSPec extends AnyFreeSpec with ChiselScalatestTester  {
  
//   //重构前的代码
//   //代码已重构，该部分待修改
//   "mfcpu ste assert" in {
//     test(new RISCVCPUv2()) { dut =>
//       //variables
//       val k = 3
//       val max_cycle = k+4
//       val adr_width = dut.io.rvfi.rs1_addr_in.getWidth
//       val data_width = dut.io.rvfi.rs1_rdata_in.getWidth
//       val a1 = VAR("a1",adr_width)
//       val a2 = VAR("a2",adr_width)
//       val a3 = VAR("a3",adr_width)
//       val d1 = VAR("d1",data_width)
//       val d2 = VAR("d2",data_width)
//       //trajFormula数组
//       var antArray = ArrayBuffer[trajFormula]()
//       var consArray = ArrayBuffer[trajFormula]()

//       /*
//       antcedent
//       */
//       //funct7
//       //funct3
//       //opcode
//       //rs2
//       //rs1
//       //rd
//       def ant_insn(i:Int) = (
//         is_array(dut.IMemory,0,i,31,25) &&
//         is_array(dut.IMemory,0,i,14,12) &&
//         is_array(dut.IMemory,0,i,6,0) &&
//         is_array(dut.IMemory,a2,i,24,20) &&
//         is_array(dut.IMemory,a1,i,19,15) &&
//         is_array(dut.IMemory,a3,i,11,7) 
//       )
//       var ant_insn_ = ant_insn(0)
//       for(i <- 1 to (k-1)){
//         ant_insn_ = ant_insn_ && ant_insn(i)
//       }
      

//       //循环0-maxcycle
//       for (i <- 0 to (max_cycle)) {
//         if(i==0){
//           val ant_ = at_cycle(
//             rst(true) &&
//             is(dut.io.rvfi.rst,true) &&
//             is_bv(dut.io.rvfi.rs1_addr_in,a1) &&
//             is_bv(dut.io.rvfi.rs2_addr_in,a2) &&
//             is_bv(dut.io.rvfi.rs1_rdata_in,d1) &&
//             is_bv(dut.io.rvfi.rs2_rdata_in,d2) &&
//             ant_insn_
//             ,
//             0 
//           ) 
//           antArray += ant_
//         }else{
//           val ant_ = at_cycle(
//             rst(false) &&
//             is(dut.io.rvfi.rst,false) &&
//             ant_insn_
//             ,
//             i 
//           )
//           antArray += ant_
//         }
//       }
//       val ant=antArray.reduce(_&&_)

//       /*
//       consequence
//       */
//       for(i <- 0 to max_cycle) {
//         if(i==(k+4)){
//           val cons = at_cycle(
//             Imply((!(a1==a3))&(!(a2==a3)), 
//             is_bv(dut.io.rvfi.mem_rdata,d1+d2))
//             ,
//             i
//           )
//           consArray += cons
//         }
//       }
//       val cons=consArray.reduce(_&&_)

//       Assert(ant,cons,BDD).STE(()=>new RISCVCPUv2())

      


//     }
//   }


// }

