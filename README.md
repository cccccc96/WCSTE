# WCSTE 

# STE Model Checker

This a **STE model checker** for formal verification of **Chisel**, with multi-verifying engines.

Compared with other STE tools (such as VOSS), the innovation of this tool is mainly concentrated in the following parts: 

- A novel STE algorithm combined with SMT and bound model checking. The proposed algorithm relies on an SMT solver, iteratively expanding according to the deepest step delineated in the STE specification. This approach enhances the computational capability of the conventional STE algorithm by integrating the BMC algorithm and SMT solver.  Our SMT-based STE is naturally aimed for verification at term -level. It extends STE from the bit-level to the word-level and extends the trajectory mechanism logic to align with the grammatical characteristics of Chisel. Because SMT-based STE is naturally constraint-solving in essence,  it incorporate both forward and backward semantics.
- Chisel’s STE verification ecosystem. The conventional STE exclusively   supports Verilog and SystemVerilog. This article enhances the STE verification ecosystem for Chisel. The tool emulates Chisel's native test module and seamlessly integrates STE into the Chisel project. In contrast to traditional STE, which mandates proficiency in the FL language, this approach enhances agile developent and verification in chisel ecosystem. Our case stuies in industry scale like processors and cache circuits have demonstrate the convenience and effectiveness of our approache.

## Verification Process

![steframework.png](WCSTE%202bcd5db1fead4051905488407d747ef8/steframework.png)

### Process1 - Chisel Frontend

The Chisel frontend module comprises two components: the Chisel circuit design and the Chisel STE Specification interface. The STE Specification interface serves as a tool for circuit designers to articulate circuit specifications utilizing an extended trajectory evaluation logic. To enhance user convenience, we have seamlessly incorporated the STE Specification interface into the Chisel project. Additionally, we expanded the verification module by leveraging Chisel's native test module and employed the extended trajectory evaluation logic to formulate circuit specifications for the verification process.

### Process2 - Preprocessing

The preprocessing module serves as a crucial intermediary between the frontend and backend, primarily tasked with circuit synthesis and coding. It undertakes the preparation of circuits and specifications in intermediate formats tailored to the different engines of the verification backend. In the case of traditional Symbolic Trajectory Evaluation engines, we employ Yosys to transform Chisel circuits into PExlif circuit netlists. Simultaneously, the STE specifications outlined by the frontend are encoded into the corresponding FL Functional Language format. In the context of the BMCSTE engine discussed in this article, the Chisel circuit undergoes conversion into a Btor2 circuit netlist. Subsequently, it is tran

### Process3 - Verification Backend

The verification backend module is dedicated to STE verification, employing two distinct approaches. The first utilizes the traditional Voss tool, employing a BDD-based symbolic simulation algorithm for STE calculations. The second introduces the BMCSTE algorithm, a novel STE approach combining Satisfiability Modulo Theories and Bounded Model Checking . In the contemporary realm of model checking, flexibility in choosing engines and algorithms holds significance. Consequently, this article offers users a selection of multi-verifying engines.

## Install

1 Prepare

This tool provides two verification engines. Engine 1 relies on the smt-switch implementation in pono, which provides related toolkits for Btor2 analysis and solver. Engine 2 depends on Voss2. Therefore, users need to install pono and voss as dependencies.

```scala
cd build
git clone https://github.com/stanford-centaur/pono.git
git clone https://github.com/TeamVoss/VossII.git

## install the Chisel environment
follow the guide of Chisel book
```

2 Install

```scala
cd build && make
```

3 Test whether the installation is successful

```scala
sbt "testOnly test.testSpec"
```

## The Chisel STE Spec

Users do not need to pay attention to how the backend is verified, but users need to understand what a complete STE specification is.

A complete STE specification can be viewed as **A(ntecedent)=>C(onsequce)**. It means that under the specified premise constraints (A), the specified expected results (C) can be obtained

How to define A and C specifically depends on the grammar we prescribed, which is called ETEL. 

![Untitled](WCSTE%202bcd5db1fead4051905488407d747ef8/Untitled.png)

![Untitled](WCSTE%202bcd5db1fead4051905488407d747ef8/Untitled%201.png)

For specific syntax, please refer to src/scala/ste.

## How to write a spec in Chisel using our tool

### A Motivated case

Chisel module

```scala
class Ander extends Module {
  val io= IO(new Bundle {
    val a = Input(Bool())
    val b = Input(Bool())
    val c = Input(Bool())
    val out =Output(Bool())
  })
  val o =RegNext(io.a&&io.b&&io.c)
  io.out:=o;
}
```

Use the STE-Spec to verify the hardware above. You can use the tool  for STE verification just like Chisel's peekpokeTest.

```scala
class AnderSPec extends AnyFreeSpec 
        with ChiselScalatestTester  {
  "Ander STE-SPEC" in {
    test(new Ander()) { dut =>
      val x1 = VAR("x1")
      val x2 = VAR("x2")
      val ant_ = at_cycle(
          (!x1&(!x2)) -> is(dut.io.a,false) &&
          (x1&(!x2)) -> is(dut.io.b,false)  &&
          (!x1&(x2)) -> is(dut.io.c,false)  &&
          (x1&x2) -> is(dut.io.a,true)      &&
          (!x1&x2) -> is(dut.io.b,true)     &&
          (x1&x2) -> is(dut.io.c,true),
          0
      )
      val cons_ = at_cycle(
        (!x1&(!x2)) -> is(dut.io.out,false) &&
        (x1&x2) -> is(dut.io.out,true),
        1
      )
      Assert(ant_,cons_).STE(
        ()=>new Ander(),
        BDD/SMT
      )
    }
  }
}
```