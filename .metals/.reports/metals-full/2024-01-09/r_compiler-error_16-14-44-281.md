file://<WORKSPACE>/src/test/scala/neuron/neuSpec.scala
### java.lang.IndexOutOfBoundsException: 0

occurred in the presentation compiler.

action parameters:
offset: 1105
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

  /** STE assert ant: clock 0 : !x1!x2->!a /\ x1!x2->!b /\ !x1x2->!c /\ x1x2->a
    * /\ x1x2->b /\ x1x2->c \=========> cons clock 1: !x1!x2 -> !o /\ x1x2 -> o
    */
  ("neuron ste assert pass use SMT") in {
    val Step: FixedPoint => FixedPoint = x => Mux(x <= 0.F(8.BP), 0.F(8.BP), 1.F(8.BP))
    val ReLU: FixedPoint => FixedPoint = x => Mux(x <= 0.F(8.BP), 0.F(8.BP), x)
    test(new Neuron(2, Step)) { dut =>
        val i1 = VAR("i1")
        val i2 = VAR("i2")
        val w1 = VAR("w1")
        val w2 = VAR("w2")
        val ant = at_cycle(
          is_array(dut.io.in,i1,0,15,0)&&
          is_array(dut.io.in,i2,1,15,0)&&
          is_array(dut.io.weights,w1,0,15,0)&&
          is_array(dut.io.weights,w2,1,15,0)&&
          ,0
        )
        val cons= at_cycle(
          Imply(()@@)
        )
      
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