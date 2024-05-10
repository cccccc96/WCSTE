file://<WORKSPACE>/src/test/scala/neuron/DynamicFirSpec.scala
### java.lang.NullPointerException

occurred in the presentation compiler.

action parameters:
offset: 461
uri: file://<WORKSPACE>/src/test/scala/neuron/DynamicFirSpec.scala
text:
```scala
package neuron
import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec
import SymbolicTrajectoryEvaluation._

class DynamicFirTest extends AnyFlatSpec with ChiselScalatestTester {
  behavior of "SimpleFirTest"
  it should "SimpleFirTest" in {
    val n:Int = 4
    val width:Int = 8
    val k:Int =4
    test(new MyManyDynamicElementVecFir(n)) { c =>
        def i(n: Int) = {
            VAR(s"i$n",width)
        }
        def const_ant@@
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
}   
}

```



#### Error stacktrace:

```
scala.reflect.internal.Definitions$DefinitionsClass.isByNameParamType(Definitions.scala:420)
	scala.reflect.internal.TreeInfo.isStableIdent(TreeInfo.scala:140)
	scala.reflect.internal.TreeInfo.isStableIdentifier(TreeInfo.scala:113)
	scala.reflect.internal.TreeInfo.isPath(TreeInfo.scala:102)
	scala.tools.nsc.interactive.Global.stabilizedType(Global.scala:974)
	scala.tools.nsc.interactive.Global.typedTreeAt(Global.scala:822)
	scala.meta.internal.pc.SignatureHelpProvider.signatureHelp(SignatureHelpProvider.scala:23)
	scala.meta.internal.pc.ScalaPresentationCompiler.$anonfun$signatureHelp$1(ScalaPresentationCompiler.scala:300)
```
#### Short summary: 

java.lang.NullPointerException