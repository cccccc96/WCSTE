package ste

import chisel3._
import chisel3.stage.{ChiselGeneratorAnnotation, ChiselStage, DesignAnnotation}

import java.io.PrintWriter
import java.nio.file.Paths
import scala.collection.mutable.ArrayBuffer
import scala.sys.process._
import scala.language.postfixOps
import java.io.FileWriter
import java.io.IOException
import scala.sys.process._


//store internal information
object P {
  val delim = ","
  var vars: Set[String] = Set[String]()
  var max_clock = 1
}

sealed trait trajFormula {
  // the formula value
  def f_val: String

  def eval1(t: Int = -1): String = {
    f_val
  }

  def eval2(t: Int = -1): String = {
    f_val
  }

  def eval1(): String = {
    f_val
  }

  def eval2(): String = {
    f_val
  }

  def &&(other: trajFormula) = and(this, other)
}

case class VAR(val name: String, val bv_size: Int = 1) extends trajFormula {
  /*
  VAR is a variable or formula
  variable can be boolean or bitvector
  formula op suppprted: !, &, |, +, *
   */
  // var information
  val var_ = s"$name,$bv_size"
  // 一个操作符数组，存着所有可用的操作符 ["!","&","|"]
  val ops = Array("!", "&", "|", "+", "*", "=")
  if (!P.vars.contains(var_)) {
    // 如果var_中不包含ops中的任何字符，将var_假如vars
    if (!ops.exists(var_.contains(_))) {
      P.vars += var_
    }
  }
  override def f_val: String = name

  def &(other: VAR) = VAR(s"( ${this.f_val} & ${other.f_val} )")

  def |(other: VAR) = VAR(s"( ${this.f_val} | ${other.f_val} )")

  def ==(other: VAR) = VAR(s"( ${this.f_val} = ${other.f_val} )")

  def unary_! = VAR(s"(! ${this.f_val} )")

  def *(other: VAR): VAR = VAR(s"( ${this.f_val} * ${other.f_val} )")

  def +(other: VAR): VAR = VAR(s"( ${this.f_val} + ${other.f_val} )")

  def ->(other: trajFormula): Imply = Imply(VAR(name), other)

  // def ITE(then_f: trajFormula, else_f: trajFormula): trajFormula = {
  //   VAR(s"(ITE-${this.f_val}-${then_f.f_val}-${else_f.f_val} )")
  // }
}

case class rst(val v: Boolean) extends trajFormula {
  /*
  rst is reset
   */
  override def f_val: String = {
    if (v) {
      "rst \n"
    } else {
      "no_rst \n"
    }
  }

  override def eval1(t: Int = -1): String = {
    // 如果v为true，"T"，否则"F"
    val value = if (v) "T" else "F"
    s"reset${P.delim}${value}${P.delim}$t\n"
  }

  override def eval2(t: Int = -1): String = {
    // 如果v为true，"T"，否则"F"
    val value = if (v) "T" else "F"
    s"reset${P.delim}${value}${P.delim}$t\n"
  }

  // def &&(other: trajFormula) = and(this, other)
}

case class is(val node: Chisel.Bool, val v: Any) extends trajFormula {
  /*
  node is v
  - node: Chisel Bool singal
  - v: VAR or Int or Boolean
   */
  override def f_val: String = {
    val nodeExpr = node.instanceName
    val valExpr = v match {
      case x: VAR     => if (x.bv_size > 1) println("is bvsize > 1"); x.f_val
      case x: Int     => x.toString
      case x: Boolean => if (x) "T" else "F"
    }
    s"$nodeExpr is $valExpr \n"
  }

  override def eval1(t: Int = -1): String = {
    val nodeExpr = node.instanceName
    val valExpr = v match {
      case x: VAR     => if (x.bv_size > 1) println("is bvsize > 1"); x.f_val
      case x: Int     => x.toString
      case x: Boolean => if (x) "T" else "F"
    }
    s"${nodeExpr}${P.delim}${valExpr}${P.delim}$t\n"
  }
  override def eval2(t: Int = -1): String = {
    var nodeExpr = node.instanceName
    var valExpr = v match {
      case x: VAR     => if (x.bv_size > 1) println("is bvsize > 1"); x.f_val
      case x: Int     => x.toString
      case x: Boolean => if (x) "T" else "F"
    }
    nodeExpr = nodeExpr.replace(".","_")
    valExpr = Util.FL_Format(valExpr)
    s"\"${nodeExpr}\" is ${valExpr} in_cycle $t "
  }
  // def &&(other: trajFormula) = and(this, other)
}

case class is_bv(
    val node: Chisel.UInt,
    val v: Any,
    var left: Int = -1,
    var right: Int = -1
) extends trajFormula {
  // 默认情况就是整个node
  if (left == -1) {
    left = node.getWidth - 1
  }
  if (right == -1) {
    right = 0
  }

  /*
  node is v
  - node: Chisel UInt singal
  - v: VAR or Int
   */
  override def f_val: String = {
    val nodeExpr = node.instanceName
    val valExpr = v match {
      case x: VAR =>
        if (x.bv_size == 1) println("is_bv bvsize = 1"); s"${x.f_val}"
      case x: Int => x.toString
    }
    s"${nodeExpr} is_bv ${valExpr} ${left} ${right} \n"
  }

  override def eval1(t: Int): String = {
    val nodeExpr = node.instanceName
    val valExpr = v match {
      case x: VAR =>
        if (x.bv_size == 1) println("is_bv bvsize = 1"); s"${x.f_val}"
      case x: Int => x.toString
    }
    s"${nodeExpr}${P.delim}${valExpr}${P.delim}${left}${P.delim}${right}${P.delim}$t\n"
  }
  override def eval2(t: Int): String = {
    val nodeExpr = node.instanceName
    val valExpr = v match {
      case x: VAR =>
        if (x.bv_size == 1) println("is_bv bvsize = 1"); s"${x.f_val}"
      case x: Int => x.toString
    }
    s"${nodeExpr}${P.delim}${valExpr}${P.delim}${left}${P.delim}${right}${P.delim}$t\n"
  }
  // def &&(other: trajFormula) = and(this, other)
}

case class is_array(
    val node: Chisel.Mem[Chisel.UInt],
    val v: Any,
    var idx: Int,
    var left: Int,
    var right: Int
) extends trajFormula {

  /*
  node is v
  - node: Chisel UInt singal
  - v: VAR or Int
   */
  override def f_val: String = {
    val nodeExpr = node.instanceName
    val valExpr = v match {
      case x: VAR =>
        if (x.bv_size == 1) println("is_bv bvsize = 1"); s"${x.f_val}"
      case x: Int => x.toString
    }
    s"${nodeExpr}[${idx}] is_array ${valExpr} ${left} ${right} \n"
  }

  override def eval1(t: Int): String = {
    val nodeExpr = node.instanceName
    val valExpr = v match {
      case x: VAR =>
        if (x.bv_size == 1) println("is_bv bvsize = 1"); s"${x.f_val}"
      case x: Int => x.toString
    }
    s"${nodeExpr}[${idx}]${P.delim}${valExpr}${P.delim}${left}${P.delim}${right}${P.delim}$t\n"
  }

  override def eval2(t: Int): String = {
    val nodeExpr = node.instanceName
    val valExpr = v match {
      case x: VAR =>
        if (x.bv_size == 1) println("is_bv bvsize = 1"); s"${x.f_val}"
      case x: Int => x.toString
    }
    s"${nodeExpr}[${idx}]${P.delim}${valExpr}${P.delim}${left}${P.delim}${right}${P.delim}$t\n"
  }
  // def &&(other: trajFormula) = and(this, other)
}

case class Imply(val guard: VAR, val v: trajFormula) extends trajFormula {
  /*
  guard -> is/is_bv
   */
  override def f_val: String = {
    // assert v只能是is/is_bv
    if (!(v.isInstanceOf[is] || v.isInstanceOf[is_bv])) {
      println("Imply v is not is/is_bv")
    }
    val guardExpr = guard.f_val
    val valExpr = v.f_val
    s"${guardExpr} --> ${valExpr}"
  }

  override def eval1(t: Int): String = {
    v match {
      case is(node, v) =>
        s"Imply${P.delim}${guard.f_val}${P.delim}${is(node, v).eval1(t)}"
      case is_bv(node, v, left, right) =>
        s"Imply${P.delim}${guard.f_val}${P.delim}${is_bv(node, v, left, right).eval1(t)}"
      case is_array(node, v, idx, left, right) =>
        s"Imply${P.delim}${guard.f_val}${P.delim}${is_array(node, v, idx, left, right).eval1(t)}"
      case _ => println("Imply v is not is/is_bv"); ""
    }
  }
  override def eval2(t: Int): String = {
    var guard_val = Util.FL_Format(guard.f_val)
    v match {
      case is(node, v) =>
        s"${is(node, v).eval2(t)} when ${guard_val}"
      // case is_bv(node, v, left, right) =>
      //   s"Imply${P.delim}${guard.f_val}${P.delim}${is_bv(node, v, left, right).eval2(t)}"
      // case is_array(node, v, idx, left, right) =>
      //   s"Imply${P.delim}${guard.f_val}${P.delim}${is_array(node, v, idx, left, right).eval2(t)}"
      case _ => println("Imply v is not is/is_bv"); ""
    }
  }
  // def &&(other: trajFormula) = and(this, other)
}

case class and(val left: trajFormula, val right: trajFormula)
    extends trajFormula {
  /*
  is/isbv/Imply and is/isbv/Imply
  at_clock and at_clock
   */
  override def f_val: String = {
    s"${left.f_val} and ${right.f_val}"
  }
  // def &&(other: trajFormula) = and(this, other)

  /*
   */
  override def eval1(t: Int): String = {
    var res: String = ""
    left match {
      case Imply(guard, v) => res = res + Imply(guard, v).eval1(t)
      // at cycle time: node is v
      case rst(v)      => res = res + rst(v).eval1(t)
      case is(node, v) => res = res + s"${is(node, v).eval1(t)}"
      case is_bv(node, v, left, right) =>
        res = res + s"${is_bv(node, v, left, right).eval1(t)}"
      case is_array(node, v, idx, left, right) =>
        res = res + s"${is_array(node, v, idx, left, right).eval1(t)}"
      case and(left1, right1) => res = res + left1.eval1(t) + right1.eval1(t)
      case at_cycle(f, t)     => res = res + at_cycle(f, t).eval1(t)
      case _                  => println("and left is not trajFormula")
    }
    right match {
      case Imply(guard, v) => res = res + Imply(guard, v).eval1(t)
      // at cycle time: node is v
      case rst(v)      => res = res + rst(v).eval1(t)
      case is(node, v) => res = res + s"${is(node, v).eval1(t)}"
      case is_bv(node, v, left, right) =>
        res = res + s"${is_bv(node, v, left, right).eval1(t)}"
      case is_array(node, v, idx, left, right) =>
        res = res + s"${is_array(node, v, idx, left, right).eval1(t)}"
      case and(left2, right2) => res = res + left2.eval1(t) + right2.eval1(t)
      case at_cycle(f, t)     => res = res + at_cycle(f, t).eval1(t)
      case _                  => println("and right is not trajFormula")
    }
    return res
  }
  override def eval2(t: Int): String = {
    var res: String = ""
    left match {
      case Imply(guard, v) => res = res + Imply(guard, v).eval2(t)
      case rst(v)      => res = res + rst(v).eval2(t)
      case is(node, v) => res = res + s"${is(node, v).eval2(t)}"
      case is_bv(node, v, left, right) =>
        res = res + s"${is_bv(node, v, left, right).eval2(t)}"
      case is_array(node, v, idx, left, right) =>
        res = res + s"${is_array(node, v, idx, left, right).eval2(t)}"
      case and(left1, right1) => res = res + left1.eval2(t) + " and \n" + right1.eval2(t)
      case at_cycle(f, t)     => res = res + at_cycle(f, t).eval2(t)
      case _                  => println("and left is not trajFormula")
    }
    res += "\n and \n"
    right match {
      case Imply(guard, v) => res = res + Imply(guard, v).eval2(t)
      // at cycle time: node is v
      case rst(v)      => res = res + rst(v).eval2(t)
      case is(node, v) => res = res + s"${is(node, v).eval2(t)}"
      case is_bv(node, v, left, right) =>
        res = res + s"${is_bv(node, v, left, right).eval2(t)}"
      case is_array(node, v, idx, left, right) =>
        res = res + s"${is_array(node, v, idx, left, right).eval2(t)}"
      case and(left2, right2) => res = res + left2.eval2(t)+ " and \n" + right2.eval2(t)
      case at_cycle(f, t)     => res = res + at_cycle(f, t).eval2(t)
      case _                  => println("and right is not trajFormula")
    }
    res += "\n"
    return res
  }
}

case class at_cycle(val f: trajFormula, val t: Int) extends trajFormula {
  P.max_clock = if (t > P.max_clock) t else P.max_clock 
  override def f_val: String = {
    s"${f.f_val} at_cycle ${t}\n"
  }

  override def eval1(): String = {
    f.eval1(t)
  }

  override def eval2(): String = {
    f.eval2(t)
  }

  // def &&(other: trajFormula) = and(this, other)
}

// case class at_cycles(val f: trajFormula, val left: Int, val right: Int) extends trajFormula {
//   override def f_val: String = {
//     s"${f.f_val} at_cycles ${left} to ${right} \n"
//   }

//   def &&(other: trajFormula) = and(this, other)
// }

case class Assert(
    val ant: trajFormula,
    val cons: trajFormula,
    val engine: EngineOption = SMT
) extends trajFormula {
  override def f_val: String = {
    s"${ant.f_val} \n==>\n\n${cons.f_val}"
  }
  // 获取当前文件根目录
  val buildPath = System.getProperty("user.dir")
  val ponoPath = "/root/SteBmcSmt/pono/build"
  println(s"buildPath: ${buildPath}")
  var mod = ""
  // def eval(x: Any, time: Int = 0): String = {
  //   x match {
  //     case at_cycle(f, t) => {
  //       f match {
  //         //at_cycle Imply
  //         case Imply(guard, v) => Imply(guard, v).eval1(t)
  //         //at cycle t: node is v
  //         case is(node, v) => s"F ${is(node, v).eval1(t)}"
  //         case is_bv(node, v) => s"F ${is_bv(node, v).eval1(t)}"
  //         //at cycle t: is1 & is2 & Imply1 & Imply2 ...
  //         case and(left, right) => and(left,right).eval1(t)
  //       }
  //     }
  //     case and(left, right) => {
  //       var res = ""
  //       left match {
  //         case at_cycle(f, t) => res = res + eval1(at_cycle(f, t))
  //         case and(left1, right1) => res = res + eval1(left)
  //       }
  //       right match {
  //         case at_cycle(f, t) => res = res + eval1(at_cycle(f, t))
  //         case and(left1, right1) => res = res + eval1(right)
  //       }
  //       return res
  //     }
  //   }
  // }

  def format1(): Unit = {
    var res = ""
    res = res + "VARS\n"
    for (element <- P.vars) {
      res += element + "\n"
    }
    res = res + "ANT\n"
    res = res + ant.eval1()
    res = res + "CONS\n"
    res = res + cons.eval1()
    // 要写入的文件路径
    val filePath = buildPath + "/" + mod + "_build/ste.assert"
    try {
      // 创建 FileWriter 对象
      val fileWriter = new FileWriter(filePath)
      // 将内容写入文件
      fileWriter.write(res)
      println("write file success")
      // 关闭文件
      fileWriter.close()
    } catch {
      case e: IOException =>
        println("An error occurred while writing the file.")
    }
  }

  def format2(): Unit = {
    var res = Util.FL_ant_cons_combine(ant.eval2(), cons.eval2(),mod)
    // 要写入的文件路径
    val filePath = buildPath + "/" + mod + "_build/verify.fl"
    println(filePath)
    try {
      // 创建 FileWriter 对象
      val fileWriter = new FileWriter(filePath)
      // 将内容写入文件
      fileWriter.write(res)
      // 关闭文件
      fileWriter.close()
    } catch {
      case e: IOException =>
        println("An error occurred while writing the file.")
    }
  }
  def modName[T <: RawModule](dutGen: () => T): String = {
    val annos = ChiselGeneratorAnnotation(dutGen).elaborate
    val designAnno = annos.last
    designAnno match {
      case DesignAnnotation(dut) => dut.name
    }
  }
  def generateRTL[T <: RawModule](
      dutGen: () => T,
      targetDirSufix: String = "_build",
      outputFile: String = ""
  ): PrintWriter = {
    val name = modName(dutGen)
    mod = name
    println("mod_name: " + name)
    val targetDir = name + targetDirSufix
    val arg = new ArrayBuffer[String]
    arg ++= Array("--target-dir", targetDir)
    val state = new ChiselStage()
    val rtl = state.emitSystemVerilog(dutGen(), arg.toArray)

    val suffix = "sv"
    val currentPath = Paths.get(System.getProperty("user.dir"))
    val out = if (outputFile.isEmpty) {
      name + "." + suffix
    } else {
      outputFile
    }
    val filePath = Paths.get(currentPath.toString, targetDir, out)
    new PrintWriter(filePath.toString) {
      print(rtl);
      close()
    }
    //    rtl
  }

  def steInterfaceBDD() : Unit = {
    val buildPath_ = buildPath + "/" + mod + "_build"
    val command = s"./voss.sh"
    println("czh:")
    println(command)
    println(buildPath_)
    
    // 使用Process类执行命令
    val output = Process(command, new java.io.File(buildPath_)).!!


    // 输出命令执行的结果
    println(output)

    if(output.contains("ste_r:T")){
      assert(true)
    }else{
      assert(false)
    }
  }

  def steInterface(path: String): Unit = {
    // 定义要执行的命令
    val buildPath_ = buildPath + "/" + mod + "_build"
    println(ponoPath)
    val command = s"${ponoPath}/pono " + buildPath_ + " " + mod

    // 使用Process类执行命令
    val output: String = command !!

    // 输出命令执行的结果
    println(output)

  }

  def getResult() = {
    // read string from file
    val filePath = buildPath + "/" + mod + "_build/result"
    println(filePath)
    val source = scala.io.Source.fromFile(filePath)
    val lines =
      try source.mkString
      finally source.close()
    lines
  }

  def STE[T <: RawModule](dutGen: () => T) = {
    println(s"${ant.f_val} \n==>\n${cons.f_val}}")
    // init
    val name = modName(dutGen)
    mod = name
    if (engine==SMT) {

      // //generate SV
      // generateRTL(dutGen)
      // generate STE assert
      format1()
      // run STE
      steInterface("")
      // get result
      var res = false
      if (getResult().contains("FALSE")) {
        res = false
      } else {
        res = true
      }
      assert(res == true)
    } else if (engine==BDD) {
      // generate SV
      // generateRTL(dutGen)
      format2()
      steInterfaceBDD()
    }

  }
}

//
//class AND(val left:_, val right:_) extends trajFormula{
//  override def f_val: String = ???
//}

//sealed trait trajFomula
//
//
//case class VAR(name:_) extends trajFomula
