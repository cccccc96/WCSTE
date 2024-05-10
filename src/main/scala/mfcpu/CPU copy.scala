// package mfcpu

// import chisel3._
// import chisel3.util._
// import chisel3.stage.ChiselStage

// class self extends Module{
//   val io = IO(new Bundle{
//     val insn_in = Input(Vec(3, UInt(32.W)))
//     val o = Output(Bool())
//   })
//   val insn_in_1 = Input(Vec(8,UInt(32.W)))
//   val insn_in_2 = Input(Vec(8,UInt(32.W)))
//   val cpu1 = Module(new RISCVCPUv2)
//   val cpu2 = Module(new RISCVCPUv2)
//   for( i <- 0 until 8){
//     if(i==0||i==1||i==2){
//       insn_in_1(i) := io.insn_in(i)
//     }else{
//       insn_in_1 := 19.U 
//     }
//   }
//   for( i <- 0 until 8){
//     if(i==0||i==3||i==6){
//       insn_in_1(i) := io.insn_in(i)
//     }else{
//       insn_in_1 := 19.U 
//     }
//   }
//   cpu1.io.rvfi.insn_in := insn_in_1
//   cpu2.io.rvfi.insn_in := insn_in_2
//   io.o := cpu1.io.rvfi.regs(0) === cpu2.io.rvfi.regs(0)
//   for(i <- 1 until 32){
//     io.o := (cpu1.io.rvfi.regs(i) === cpu2.io.rvfi.regs(i))&&io.o
//   }
// }


