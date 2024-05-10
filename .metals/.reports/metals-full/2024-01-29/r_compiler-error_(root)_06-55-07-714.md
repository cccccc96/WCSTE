file://<WORKSPACE>/src/main/scala/neuron/DynamicFir.scala
### scala.ScalaReflectionException: value in is not a method

occurred in the presentation compiler.

action parameters:
uri: file://<WORKSPACE>/src/main/scala/neuron/DynamicFir.scala
text:
```scala
package neuron
import chisel3._
import chisel3.util._

class MyManyDynamicElementVecFir(length: Int,width: Int) extends Module {
  val io = IO(new Bundle {
    val in = Input(UInt(width.W))  /
     val consts = Input(Vec(length, UInt(8.W)))
    val valid = Input(Bool())
    val out = Output(UInt(width.W))
   
  })
  
  // Such concision! You'll learn what all this means later.
  val taps = Seq(io.in) ++ Seq.fill(io.consts.length - 1)(RegInit(0.U(8.W)))
  taps.zip(taps.tail).foreach { case (a, b) => when (io.valid) { b := a } }

  io.out := taps.zip(io.consts).map { case (a, b) => a * b }.reduce(_ + _)
}
```



#### Error stacktrace:

```
scala.reflect.api.Symbols$SymbolApi.asMethod(Symbols.scala:240)
	scala.reflect.api.Symbols$SymbolApi.asMethod$(Symbols.scala:234)
	scala.reflect.internal.Symbols$SymbolContextApiImpl.asMethod(Symbols.scala:99)
	scala.tools.nsc.typechecker.ContextErrors$TyperContextErrors$TyperErrorGen$.MissingArgsForMethodTpeError(ContextErrors.scala:761)
	scala.tools.nsc.typechecker.Typers$Typer.adaptMethodTypeToExpr$1(Typers.scala:972)
	scala.tools.nsc.typechecker.Typers$Typer.adapt(Typers.scala:1276)
	scala.tools.nsc.typechecker.Typers$Typer.typed(Typers.scala:6056)
	scala.tools.nsc.typechecker.Typers$Typer.typedDefDef(Typers.scala:6318)
	scala.tools.nsc.typechecker.Typers$Typer.typed1(Typers.scala:5950)
	scala.tools.nsc.typechecker.Typers$Typer.typed(Typers.scala:6041)
	scala.tools.nsc.typechecker.Typers$Typer.typedStat$1(Typers.scala:6119)
	scala.tools.nsc.typechecker.Typers$Typer.$anonfun$typedStats$4(Typers.scala:3362)
	scala.tools.nsc.typechecker.Typers$Typer.$anonfun$typedStats$4$adapted(Typers.scala:3357)
	scala.reflect.internal.Scopes$Scope.foreach(Scopes.scala:455)
	scala.tools.nsc.typechecker.Typers$Typer.addSynthetics$1(Typers.scala:3357)
	scala.tools.nsc.typechecker.Typers$Typer.typedStats(Typers.scala:3422)
	scala.tools.nsc.typechecker.Typers$Typer.typedTemplate(Typers.scala:2064)
	scala.tools.nsc.typechecker.Typers$Typer.typedClassDef(Typers.scala:1895)
	scala.tools.nsc.typechecker.Typers$Typer.typed1(Typers.scala:5951)
	scala.tools.nsc.typechecker.Typers$Typer.typed(Typers.scala:6041)
	scala.tools.nsc.typechecker.Typers$Typer.typedStat$1(Typers.scala:6119)
	scala.tools.nsc.typechecker.Typers$Typer.$anonfun$typedStats$8(Typers.scala:3410)
	scala.tools.nsc.typechecker.Typers$Typer.typedStats(Typers.scala:3410)
	scala.tools.nsc.typechecker.Typers$Typer.typedBlock(Typers.scala:2564)
	scala.tools.nsc.typechecker.Typers$Typer.typedOutsidePatternMode$1(Typers.scala:5960)
	scala.tools.nsc.typechecker.Typers$Typer.typed1(Typers.scala:5995)
	scala.tools.nsc.typechecker.Typers$Typer.typed(Typers.scala:6041)
	scala.tools.nsc.typechecker.Typers$Typer.typedArg(Typers.scala:3428)
	scala.tools.nsc.typechecker.Typers$Typer.handlePolymorphicCall$1(Typers.scala:3827)
	scala.tools.nsc.typechecker.Typers$Typer.doTypedApply(Typers.scala:3846)
	scala.tools.nsc.typechecker.Typers$Typer.normalTypedApply$1(Typers.scala:5095)
	scala.tools.nsc.typechecker.Typers$Typer.typedApply$1(Typers.scala:5104)
	scala.tools.nsc.typechecker.Typers$Typer.typed1(Typers.scala:5985)
	scala.tools.nsc.typechecker.Typers$Typer.typed(Typers.scala:6041)
	scala.tools.nsc.typechecker.Typers$Typer.computeType(Typers.scala:6130)
	scala.tools.nsc.typechecker.Namers$Namer.assignTypeToTree(Namers.scala:1127)
	scala.tools.nsc.typechecker.Namers$Namer.valDefSig(Namers.scala:1745)
	scala.tools.nsc.typechecker.Namers$Namer.memberSig(Namers.scala:1930)
	scala.tools.nsc.typechecker.Namers$Namer.typeSig(Namers.scala:1880)
	scala.tools.nsc.typechecker.Namers$Namer$ValTypeCompleter.completeImpl(Namers.scala:944)
	scala.tools.nsc.typechecker.Namers$LockingTypeCompleter.complete(Namers.scala:2078)
	scala.tools.nsc.typechecker.Namers$LockingTypeCompleter.complete$(Namers.scala:2076)
	scala.tools.nsc.typechecker.Namers$TypeCompleterBase.complete(Namers.scala:2071)
	scala.reflect.internal.Symbols$Symbol.completeInfo(Symbols.scala:1561)
	scala.reflect.internal.Symbols$Symbol.info(Symbols.scala:1533)
	scala.reflect.internal.Symbols$Symbol.initialize(Symbols.scala:1722)
	scala.tools.nsc.typechecker.Typers$Typer.typed1(Typers.scala:5625)
	scala.tools.nsc.typechecker.Typers$Typer.typed(Typers.scala:6041)
	scala.tools.nsc.typechecker.Typers$Typer.typedStat$1(Typers.scala:6119)
	scala.tools.nsc.typechecker.Typers$Typer.$anonfun$typedStats$8(Typers.scala:3410)
	scala.tools.nsc.typechecker.Typers$Typer.typedStats(Typers.scala:3410)
	scala.tools.nsc.typechecker.Typers$Typer.typedTemplate(Typers.scala:2064)
	scala.tools.nsc.typechecker.Typers$Typer.typedClassDef(Typers.scala:1895)
	scala.tools.nsc.typechecker.Typers$Typer.typed1(Typers.scala:5951)
	scala.tools.nsc.typechecker.Typers$Typer.typed(Typers.scala:6041)
	scala.tools.nsc.typechecker.Typers$Typer.typedStat$1(Typers.scala:6119)
	scala.tools.nsc.typechecker.Typers$Typer.$anonfun$typedStats$8(Typers.scala:3410)
	scala.tools.nsc.typechecker.Typers$Typer.typedStats(Typers.scala:3410)
	scala.tools.nsc.typechecker.Typers$Typer.typedPackageDef$1(Typers.scala:5634)
	scala.tools.nsc.typechecker.Typers$Typer.typed1(Typers.scala:5954)
	scala.tools.nsc.typechecker.Typers$Typer.typed(Typers.scala:6041)
	scala.tools.nsc.typechecker.Analyzer$typerFactory$TyperPhase.apply(Analyzer.scala:117)
	scala.tools.nsc.Global$GlobalPhase.applyPhase(Global.scala:459)
	scala.tools.nsc.interactive.Global$TyperRun.applyPhase(Global.scala:1349)
	scala.tools.nsc.interactive.Global$TyperRun.typeCheck(Global.scala:1342)
	scala.tools.nsc.interactive.Global.typeCheck(Global.scala:680)
	scala.meta.internal.pc.PcCollector.<init>(PcCollector.scala:29)
	scala.meta.internal.pc.PcSemanticTokensProvider$Collector$.<init>(PcSemanticTokensProvider.scala:19)
	scala.meta.internal.pc.PcSemanticTokensProvider.Collector$lzycompute$1(PcSemanticTokensProvider.scala:19)
	scala.meta.internal.pc.PcSemanticTokensProvider.Collector(PcSemanticTokensProvider.scala:19)
	scala.meta.internal.pc.PcSemanticTokensProvider.provide(PcSemanticTokensProvider.scala:72)
	scala.meta.internal.pc.ScalaPresentationCompiler.$anonfun$semanticTokens$1(ScalaPresentationCompiler.scala:159)
```
#### Short summary: 

scala.ScalaReflectionException: value in is not a method