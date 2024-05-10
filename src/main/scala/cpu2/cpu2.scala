package cpu2

import chisel3._
import chisel3.util._
import chisel3.stage.ChiselStage

class RVFI_IO extends Bundle {
  val rst = Input(Bool())
  val insn_in = Input(Vec(8, UInt(32.W)))

  val valid = Output(Bool())
  val insn = Output(UInt(32.W))
  val pc_rdata = Output(UInt(64.W))
  val pc_wdata = Output(UInt(64.W))
  val rs1_addr = Output(UInt(5.W))
  val rs2_addr = Output(UInt(5.W))
  val rs1_rdata = Output(UInt(64.W))
  val rs2_rdata = Output(UInt(64.W))
  val rd_addr = Output(UInt(5.W))
  val rd_wdata = Output(UInt(64.W))
  val mem_addr = Output(UInt(32.W))
  val mem_rdata = Output(UInt(64.W))
  val mem_wdata = Output(UInt(64.W))
  val regs = Vec(32, Output(UInt(64.W)))
  val insns_out = Vec(8, Output(UInt(64.W)))

}


class RISCVCPUv2Error extends Module {

  val io = IO(new Bundle {
    val rvfi = new RVFI_IO
  })
  val LD = "b000_0011".U(7.W)
  val SD = "b010_0011".U(7.W)
  val BEQ = "b110_0011".U(7.W) // (6/E)3
  val NOP = "h0000_0013".U(32.W)
  val ALUop = "b011_0011".U(7.W) // 51

  val PC = RegInit(0.U(64.W))
  val Regs = RegInit(VecInit(Seq.fill(32)(1.U(64.W))))
  // val Regs = Reg(Vec(32, UInt(64.W)))
  val IDEXA, IDEXB, EXMEMB, EXMEMALUOut, MEMWBValue = Reg(UInt(64.W))
  // val DMemory = Mem(1024, UInt(32.W))
  val DMemory = RegInit(VecInit(Seq.fill(1024)(1.U(32.W))))
  val IMemory = RegInit(VecInit(Seq.fill(1024)(1.U(32.W))))
  // val DMemory = Reg(Vec(1024, UInt(32.W)))
  // val IMemory = Reg(Vec(1024, UInt(32.W)))
  val IFIDIR, IDEXIR, EXMEMIR, MEMWBIR = RegInit(NOP)
  val IFIDrs1, IFIDrs2, MEMWBrd = Wire(UInt(5.W))
  val IFIDop, IDEXop, EXMEMop, MEMWBop = Wire(UInt(7.W))
  val CurPC = RegInit(0.U(64.W))
  val NextPC = RegInit(0.U(64.W))
  val czh = RegInit(0.U(64.W))

  when(io.rvfi.rst) {

    IFIDrs1 := IFIDIR(19, 15)
    IFIDrs2 := IFIDIR(24, 20)
    IDEXop := IDEXIR(6, 0)
    IFIDop := IFIDIR(6, 0)
    EXMEMop := EXMEMIR(6, 0)
    MEMWBop := MEMWBIR(6, 0)
    MEMWBrd := MEMWBIR(11, 7)
    for (i <- 0 until 8) {
      IMemory(i) := io.rvfi.insn_in(i)
    }

    // IMemory(1023) := 0.U
    // rvfi io rd_wdata
    //io.rvfi.rd_wdata := 0.U
  }.otherwise {
    IFIDrs1 := IFIDIR(19, 15)
    IFIDrs2 := IFIDIR(24, 20)
    IDEXop := IDEXIR(6, 0)
    IFIDop := IFIDIR(6, 0)
    EXMEMop := EXMEMIR(6, 0)
    MEMWBop := MEMWBIR(6, 0)
    MEMWBrd := MEMWBIR(11, 7)

    val EXMEMrd: UInt = EXMEMIR(11, 7)
    val IDEXrd: UInt = IDEXIR(11, 7)
    val IFID_funct3 = IFIDIR(14, 12)

    val bypassAFromWB =
      (IFIDrs1 === MEMWBrd) && (IFIDrs1 =/= 0.U) && (MEMWBop === ALUop || MEMWBop === LD)
    val bypassBFromWB =
      (IFIDrs2 === MEMWBrd) && (IFIDrs2 =/= 0.U) && (MEMWBop === ALUop || MEMWBop === LD)
    val bypassAFromMEM =
      (IFIDrs1 === EXMEMrd) && (IFIDrs1 =/= 0.U) && (EXMEMop === ALUop)
    val bypassBFromMEM =
      (IFIDrs2 === EXMEMrd) && (IFIDrs2 =/= 0.U) && (EXMEMop === ALUop)
    val bypassAFromEX =
      (IFIDrs1 === IDEXrd) && (IFIDrs1 =/= 0.U) && (IDEXop === ALUop)
    val bypassBFromEX =
      (IFIDrs2 === IDEXrd) && (IFIDrs2 =/= 0.U) && (IDEXop === ALUop)

    val stall = (
      (EXMEMop === LD) && (((IFIDrs1 === EXMEMrd) && (IFIDrs1 =/= 0.U)) || ((IFIDrs2 === EXMEMrd) && (IFIDrs2 =/= 0.U)))
    ) || (
      (IDEXop === LD) && (((IFIDrs1 === IDEXrd) && (IFIDrs1 =/= 0.U)) || ((IFIDrs2 === IDEXrd) && (IFIDrs2 =/= 0.U)))
    )

    var A, B = WireInit(0.U(64.W))
    val takeBranch = (IFIDop === BEQ) && (IFID_funct3 === 0.U) && (A === B)

    // Auxiliary
    val MEMWBrs1 = MEMWBIR(19, 15)
    val MEMWBrs2 = MEMWBIR(24, 20)


    //  assume(stall === false.B)
    when((~stall).asBool) {
      when((~takeBranch).asBool) {
        // first instruction in pipeline is being fetched
        // Fetch & increment PC
        IFIDIR := IMemory((PC >> 2.U).asUInt)
        PC := PC + 4.U
        NextPC := PC
      }.otherwise {
        IFIDIR := NOP
        val branchTarget = (CurPC.asSInt + Cat(
          IFIDIR(31),
          "b0".U(1.W),
          IFIDIR(30, 25),
          IFIDIR(11, 7)
        ).asSInt).asUInt
        czh:=0.U+Cat(
          IFIDIR(31),
          "b0".U(1.W),
          IFIDIR(30, 25),
          IFIDIR(11, 7)
        )
        PC := branchTarget
        NextPC := branchTarget
      }
      CurPC := PC

      // second instruction in pipeline is fetching registers
      when(bypassAFromEX) {
        IDEXA := IDEXA + IDEXB
        A := IDEXA + IDEXB
      }.elsewhen(bypassAFromMEM) {
        IDEXA := EXMEMALUOut
        A := EXMEMALUOut
      }.elsewhen(bypassAFromWB) {
        IDEXA := MEMWBValue
        A := MEMWBValue
      }.otherwise {
        IDEXA := Regs(IFIDrs1)
        A := Regs(IFIDrs1)
      }
      when(bypassBFromEX) {
        IDEXB := IDEXB + IDEXA
        B := IDEXB + IDEXA
      }.elsewhen(bypassBFromMEM) {
        IDEXB := EXMEMALUOut
        B := EXMEMALUOut
      }.elsewhen(bypassBFromWB) {
        IDEXB := MEMWBValue
        B := MEMWBValue
      }.otherwise {
        IDEXB := Regs(IFIDrs2)
        B := Regs(IFIDrs2)
      }
      IDEXIR := IFIDIR
    }.otherwise {
      IDEXIR := NOP
      IDEXA := 0.U
      IDEXB := 0.U
    }

    // third instruction is doing address calculation or ALU operation
    when(IDEXop === LD) {
      EXMEMALUOut := (IDEXA.asSInt + IDEXIR(31, 20).asSInt).asUInt
    }.elsewhen(IDEXop === SD) {
      EXMEMALUOut := (IDEXA.asSInt + Cat(
        IDEXIR(31, 25),
        IDEXIR(11, 7)
      ).asSInt).asUInt
    }.elsewhen(IDEXop === ALUop) {
      //    switch(IDEXIR(31, 25)) {
      //      is(0.U) {
      EXMEMALUOut := 12.U
      //      }
      //    }
    }
    EXMEMIR := IDEXIR
    EXMEMB := IDEXB

    // Mem stage of pipeline
    when(EXMEMop === ALUop) {
      MEMWBValue := EXMEMALUOut
    }.elsewhen(EXMEMop === LD) {
      MEMWBValue := DMemory((EXMEMALUOut).asUInt)
    }.elsewhen(EXMEMop === SD) {
      DMemory((EXMEMALUOut).asUInt) := EXMEMB
    }

    MEMWBIR := EXMEMIR

    // rvfi io rd_wdata
    //io.rvfi.rd_wdata := 0.U

    // WB stage
    when(((MEMWBop === LD) || (MEMWBop === ALUop)) && (MEMWBrd =/= 0.U)) {
      Regs(MEMWBrd) := MEMWBValue
      
    }
  }
  io.rvfi.rd_wdata := MEMWBValue
  // rvfi io
  io.rvfi.regs := Regs
  io.rvfi.insn := MEMWBIR
  io.rvfi.valid := false.B


  io.rvfi.pc_rdata := CurPC 

  io.rvfi.pc_wdata := PC

  io.rvfi.rs1_addr := IFIDrs1

  io.rvfi.rs2_addr := IFIDrs2

  io.rvfi.rs1_rdata := IDEXA

  io.rvfi.rs2_rdata := IDEXB

  io.rvfi.rd_addr := MEMWBrd

  io.rvfi.mem_addr := EXMEMALUOut

  io.rvfi.mem_rdata := MEMWBValue
  // io.rvfi.mem_wdata := EXMEMB
  io.rvfi.mem_wdata := DMemory(1)
  // io.rvfi.insns := IMemory
  for (i <- 0 until 8) {
    io.rvfi.insns_out(i) := IMemory(i)
  }

}

class RISCVCPUv2 extends Module {

  val io = IO(new Bundle {
    val rvfi = new RVFI_IO
  })
  val LD = "b000_0011".U(7.W)
  val SD = "b010_0011".U(7.W)
  val BEQ = "b110_0011".U(7.W) // (6/E)3
  val NOP = "h0000_0013".U(32.W)
  val ALUop = "b011_0011".U(7.W) // 51

  val PC = RegInit(0.U(64.W))
  val Regs = RegInit(VecInit(Seq.fill(32)(1.U(64.W))))
  // val Regs = Reg(Vec(32, UInt(64.W)))
  val IDEXA, IDEXB, EXMEMB, EXMEMALUOut, MEMWBValue = Reg(UInt(64.W))
  // val DMemory = Mem(1024, UInt(32.W))
  val DMemory = RegInit(VecInit(Seq.fill(1024)(1.U(32.W))))
  val IMemory = RegInit(VecInit(Seq.fill(1024)(1.U(32.W))))
  // val DMemory = Reg(Vec(1024, UInt(32.W)))
  // val IMemory = Reg(Vec(1024, UInt(32.W)))
  val IFIDIR, IDEXIR, EXMEMIR, MEMWBIR = RegInit(NOP)
  val IFIDrs1, IFIDrs2, MEMWBrd = Wire(UInt(5.W))
  val IFIDop, IDEXop, EXMEMop, MEMWBop = Wire(UInt(7.W))
  val CurPC = RegInit(0.U(64.W))
  val NextPC = RegInit(0.U(64.W))
  val czh = RegInit(0.U(64.W))

  when(io.rvfi.rst) {

    IFIDrs1 := IFIDIR(19, 15)
    IFIDrs2 := IFIDIR(24, 20)
    IDEXop := IDEXIR(6, 0)
    IFIDop := IFIDIR(6, 0)
    EXMEMop := EXMEMIR(6, 0)
    MEMWBop := MEMWBIR(6, 0)
    MEMWBrd := MEMWBIR(11, 7)
    for (i <- 0 until 8) {
      IMemory(i) := io.rvfi.insn_in(i)
    }

    // IMemory(1023) := 0.U
    // rvfi io rd_wdata
    //io.rvfi.rd_wdata := 0.U
  }.otherwise {
    IFIDrs1 := IFIDIR(19, 15)
    IFIDrs2 := IFIDIR(24, 20)
    IDEXop := IDEXIR(6, 0)
    IFIDop := IFIDIR(6, 0)
    EXMEMop := EXMEMIR(6, 0)
    MEMWBop := MEMWBIR(6, 0)
    MEMWBrd := MEMWBIR(11, 7)

    val EXMEMrd: UInt = EXMEMIR(11, 7)
    val IDEXrd: UInt = IDEXIR(11, 7)
    val IFID_funct3 = IFIDIR(14, 12)

    val bypassAFromWB =
      (IFIDrs1 === MEMWBrd) && (IFIDrs1 =/= 0.U) && (MEMWBop === ALUop || MEMWBop === LD)
    val bypassBFromWB =
      (IFIDrs2 === MEMWBrd) && (IFIDrs2 =/= 0.U) && (MEMWBop === ALUop || MEMWBop === LD)
    val bypassAFromMEM =
      (IFIDrs1 === EXMEMrd) && (IFIDrs1 =/= 0.U) && (EXMEMop === ALUop)
    val bypassBFromMEM =
      (IFIDrs2 === EXMEMrd) && (IFIDrs2 =/= 0.U) && (EXMEMop === ALUop)
    val bypassAFromEX =
      (IFIDrs1 === IDEXrd) && (IFIDrs1 =/= 0.U) && (IDEXop === ALUop)
    val bypassBFromEX =
      (IFIDrs2 === IDEXrd) && (IFIDrs2 =/= 0.U) && (IDEXop === ALUop)

    val stall = (
      (EXMEMop === LD) && (((IFIDrs1 === EXMEMrd) && (IFIDrs1 =/= 0.U)) || ((IFIDrs2 === EXMEMrd) && (IFIDrs2 =/= 0.U)))
    ) || (
      (IDEXop === LD) && (((IFIDrs1 === IDEXrd) && (IFIDrs1 =/= 0.U)) || ((IFIDrs2 === IDEXrd) && (IFIDrs2 =/= 0.U)))
    )

    var A, B = WireInit(0.U(64.W))
    val takeBranch = (IFIDop === BEQ) && (IFID_funct3 === 0.U) && (A === B)

    // Auxiliary
    val MEMWBrs1 = MEMWBIR(19, 15)
    val MEMWBrs2 = MEMWBIR(24, 20)


    //  assume(stall === false.B)
    when((~stall).asBool) {
      when((~takeBranch).asBool) {
        // first instruction in pipeline is being fetched
        // Fetch & increment PC
        IFIDIR := IMemory((PC >> 2.U).asUInt)
        PC := PC + 4.U
        NextPC := PC
      }.otherwise {
        IFIDIR := NOP
        val branchTarget = (CurPC.asSInt + Cat(
          IFIDIR(31),
          "b0".U(1.W),
          IFIDIR(30, 25),
          IFIDIR(11, 7)
        ).asSInt).asUInt
        czh:=0.U+Cat(
          IFIDIR(31),
          "b0".U(1.W),
          IFIDIR(30, 25),
          IFIDIR(11, 7)
        )
        PC := branchTarget
        NextPC := branchTarget
      }
      CurPC := PC

      // second instruction in pipeline is fetching registers
      when(bypassAFromEX) {
        IDEXA := IDEXA + IDEXB
        A := IDEXA + IDEXB
      }.elsewhen(bypassAFromMEM) {
        IDEXA := EXMEMALUOut
        A := EXMEMALUOut
      }.elsewhen(bypassAFromWB) {
        IDEXA := MEMWBValue
        A := MEMWBValue
      }.otherwise {
        IDEXA := Regs(IFIDrs1)
        A := Regs(IFIDrs1)
      }
      when(bypassBFromEX) {
        IDEXB := IDEXB + IDEXA
        B := IDEXB + IDEXA
      }.elsewhen(bypassBFromMEM) {
        IDEXB := EXMEMALUOut
        B := EXMEMALUOut
      }.elsewhen(bypassBFromWB) {
        IDEXB := MEMWBValue
        B := MEMWBValue
      }.otherwise {
        IDEXB := Regs(IFIDrs2)
        B := Regs(IFIDrs2)
      }
      IDEXIR := IFIDIR
    }.otherwise {
      IDEXIR := NOP
      IDEXA := 0.U
      IDEXB := 0.U
    }

    // third instruction is doing address calculation or ALU operation
    when(IDEXop === LD) {
      EXMEMALUOut := (IDEXA.asSInt + IDEXIR(31, 20).asSInt).asUInt
    }.elsewhen(IDEXop === SD) {
      EXMEMALUOut := (IDEXA.asSInt + Cat(
        IDEXIR(31, 25),
        IDEXIR(11, 7)
      ).asSInt).asUInt
    }.elsewhen(IDEXop === ALUop) {
      //    switch(IDEXIR(31, 25)) {
      //      is(0.U) {
      EXMEMALUOut := IDEXA + IDEXB
      //      }
      //    }
    }
    EXMEMIR := IDEXIR
    EXMEMB := IDEXB

    // Mem stage of pipeline
    when(EXMEMop === ALUop) {
      MEMWBValue := EXMEMALUOut
    }.elsewhen(EXMEMop === LD) {
      MEMWBValue := DMemory((EXMEMALUOut).asUInt)
    }.elsewhen(EXMEMop === SD) {
      DMemory((EXMEMALUOut).asUInt) := EXMEMB
    }

    MEMWBIR := EXMEMIR

    // rvfi io rd_wdata
    //io.rvfi.rd_wdata := 0.U

    // WB stage
    when(((MEMWBop === LD) || (MEMWBop === ALUop)) && (MEMWBrd =/= 0.U)) {
      Regs(MEMWBrd) := MEMWBValue
      
    }
  }
  io.rvfi.rd_wdata := MEMWBValue
  // rvfi io
  io.rvfi.regs := Regs
  io.rvfi.insn := MEMWBIR
  io.rvfi.valid := false.B


  io.rvfi.pc_rdata := CurPC 

  io.rvfi.pc_wdata := PC

  io.rvfi.rs1_addr := IFIDrs1

  io.rvfi.rs2_addr := IFIDrs2

  io.rvfi.rs1_rdata := IDEXA

  io.rvfi.rs2_rdata := IDEXB

  io.rvfi.rd_addr := MEMWBrd

  io.rvfi.mem_addr := EXMEMALUOut

  io.rvfi.mem_rdata := MEMWBValue
  // io.rvfi.mem_wdata := EXMEMB
  io.rvfi.mem_wdata := DMemory(1)
  // io.rvfi.insns := IMemory
  for (i <- 0 until 8) {
    io.rvfi.insns_out(i) := IMemory(i)
  }
}




class self extends Module{
  val io = IO(new Bundle{
    val insn_in = Input(Vec(2, UInt(32.W)))
    val rst = Input(Bool())
    val regs1 = Vec(32, Output(UInt(64.W)))
    val regs2 = Vec(32, Output(UInt(64.W)))
    val insn_out1 = Output(Vec(8, UInt(32.W)))
    val insn_out2 = Output(Vec(8, UInt(32.W)))
    val o = Output(Bool())
  })
  val cpu1 = Module(new RISCVCPUv2)
  val cpu2 = Module(new RISCVCPUv2Error)
  for( i <- 0 until 8){
    if(i==0||i==1){
      cpu1.io.rvfi.insn_in(i) := io.insn_in(i)
    }else{
      cpu1.io.rvfi.insn_in(i)  := 19.U 
    }
  }
  for( i <- 0 until 8){
    if(i==0){
      cpu2.io.rvfi.insn_in(i)  := io.insn_in(i)
    }else if(i==3){
      cpu2.io.rvfi.insn_in(i)  := io.insn_in(1)
    }
    else{
      cpu2.io.rvfi.insn_in(i) := 19.U 
    }
  }
  cpu1.io.rvfi.rst := io.rst
  cpu2.io.rvfi.rst := io.rst



  val equalreg = cpu1.io.rvfi.regs.zip(cpu2.io.rvfi.regs).map { case (a, b) => a === b }.reduce(_ && _)

  io.o := equalreg
  io.regs1 := cpu1.io.rvfi.regs
  io.regs2 := cpu2.io.rvfi.regs
  for(i <- 0 until 8){
    io.insn_out1(i) := cpu1.io.rvfi.insns_out(i)
    io.insn_out2(i) := cpu2.io.rvfi.insns_out(i)
  }
  
  

}



