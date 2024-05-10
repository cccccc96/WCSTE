file://<WORKSPACE>/src/test/scala/neuron/neuSpec.scala
### java.lang.IndexOutOfBoundsException: 0

occurred in the presentation compiler.

action parameters:
offset: 640
uri: file://<WORKSPACE>/src/test/scala/neuron/neuSpec.scala
text:
```scala
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
        val i2 = FixedPoint_VAR("i2",16,8@@)
        val w1 = FixedPoint_VAR("w1",16)
        val w2 = FixedPoint_VAR("w2",16)
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

```



#### Error stacktrace:

```
scala.collection.LinearSeqOps.apply(LinearSeq.scala:131)
	scala.collection.LinearSeqOps.apply$(LinearSeq.scala:128)
	scala.collection.immutable.List.apply(List.scala:79)
	dotty.tools.dotc.util.Signatures$.countParams(Signatures.scala:501)
	dotty.tools.dotc.util.Signatures$.applyCallInfo(Signatures.scala:186)
	dotty.tools.dotc.util.Signatures$.computeSignatureHelp(Signatures.scala:94)
	dotty.tools.dotc.util.Signatures$.signatureHelp(Signatures.scala:63)
	scala.meta.internal.pc.MetalsSignatures$.signatures(MetalsSignatures.scala:17)
	scala.meta.internal.pc.SignatureHelpProvider$.signatureHelp(SignatureHelpProvider.scala:51)
	scala.meta.internal.pc.ScalaPresentationCompiler.signatureHelp$$anonfun$1(ScalaPresentationCompiler.scala:388)
```
#### Short summary: 

java.lang.IndexOutOfBoundsException: 0