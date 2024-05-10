error id: file://<WORKSPACE>/src/main/scala/SymbolicTrajectoryEvaluation/var.scala:[4047..4052) in Input.VirtualFile("file://<WORKSPACE>/src/main/scala/SymbolicTrajectoryEvaluation/var.scala", "package SymbolicTrajectoryEvaluation

import chisel3._
import io.circe.parser._
import io.circe.parser._
import io.circe.{Json, JsonObject}

class VAR(var name: String, var bv_size: Int = 1) extends trajFormula {

  // var information
  val var_ = s"$name,$bv_size"
  if (!P.vars.contains(var_) && name != "expression") {
    P.vars += var_
  }

  override def f_val: String = s"${name}_${bv_size}"

  override def eval1(): String = name

  override def eval1(t: Int): String = name

  override def eval2(): String = name

  override def eval2(t: Int): String = name

  def &(other: trajFormula) = new AND(this, other)

  def |(other: trajFormula) = new OR(this, other)

  def >(other: trajFormula) = new BV_GT(this, other)

  def ==(other: trajFormula) = new EQUAL(this, other)

  def unary_! = new NOT(this)

  def *(other: trajFormula) = new MULT(this, other)

  def +(other: trajFormula) = new ADD(this, other)
}

object VAR {
  def apply(name: String, bv_size: Int = 1) = new VAR(name, bv_size)

}

class FixedPoint_VAR(var fname: String, var width:Int, var bp:Int) extends VAR(fname,width)
{
  override def f_val: String = s"${fname}_${width}"

  override def eval1(): String = fname

  override def eval1(t: Int): String = fname

  override def eval2(): String = fname

  override def eval2(t: Int): String = fname 
}

class AND(var left: trajFormula, var right: trajFormula)
    extends VAR("expression") {
  override def f_val: String = s"( ${left.f_val} & ${right.f_val} )"

  override def eval1(): String = s"( ${left.eval1()} & ${right.eval1()} )"

  override def eval2(): String = s"( ${left.eval2()} AND ${right.eval2()} )"
}

class OR(var left: trajFormula, var right: trajFormula)
    extends VAR("expression") {
  override def f_val: String = s"( ${left.f_val} | ${right.f_val} )"

  override def eval1(): String = s"( ${left.eval1()} | ${right.eval1()} )"

  override def eval2(): String = s"( ${left.eval2()} OR ${right.eval2()} )"
}

class EQUAL(var left: trajFormula, var right: trajFormula)
    extends VAR("expression") {
  override def f_val: String = s"( ${left.f_val} = ${right.f_val} )"

  override def eval1(): String = s"( ${left.eval1()} = ${right.eval1()} )"

  override def eval2(): String = s"( (bv_geq ${left.eval2()} ${right
      .eval2()} ) AND (bv_leq ${left.eval2()} ${right.eval2()}) )"
}

object EQUAL {
  def apply(left: trajFormula, right: trajFormula) = new EQUAL(left, right)
}

class NOT(var left: trajFormula) extends VAR("expression") {
  override def f_val: String = s"( ! ${left.f_val} )"

  override def eval1(): String = s"( ! ${left.eval1()} )"

  override def eval2(): String = s"( NOT ${left.eval2()} )"
}

object NOT {
  def apply(left: trajFormula) = new NOT(left)
}

class MULT(var left: trajFormula, var right: trajFormula)
    extends VAR("expression") {
  override def f_val: String = s"( ${left.f_val} * ${right.f_val} )"

  override def eval1(): String = s"( ${left.eval1()} * ${right.eval1()} )"

  override def eval2(): String = s"( bv_mul ${left.eval2()}  ${right.eval2()} )"
}

object MULT {
  def apply(left: trajFormula, right: trajFormula) = new MULT(left, right)
}

//半加
class ADD(var left: trajFormula, var right: trajFormula)
    extends VAR("expression") {
  override def f_val: String = s"( ${left.f_val} + ${right.f_val} )"

  override def eval1(): String = s"( ${left.eval1()} + ${right.eval1()} )"

  override def eval2(): String = {
    s"(list2bv (tl (bv2list (bv_add ${left.eval2()} ${right.eval2()}))))"
  }
}

object ADD {
  def apply(left: trajFormula, right: trajFormula) = new ADD(left, right)
}

class BV_CONST(var left: Int, var size: Int = 1) extends VAR("expression") {
  override def f_val: String = s"( BV_CONST $left )"

  override def eval1(): String = s"$left@$size"

  override def eval2(): String = {
    if (size == 1) {
      if (left == 1) {
        return "T"
      } else if (left == 0) {
        return "F"
      }
    }
    s"(int2bv $left )"
  }
}

object BV_CONST {
  def apply(left: Int, size: Int = 1) = new BV_CONST(left, size)
}

class

class BV_MOD(var left: trajFormula, var right: trajFormula)
    extends VAR("expression") {
  override def f_val: String = s"( ${left.f_val} % ${right.f_val} )"

  override def eval1(): String = s"( ${left.eval1()} % ${right.eval1()} )"

  override def eval2(): String = {
    s"(bv_mod ${left.eval2()} ${right.eval2()} )"
  }
}
object BV_MOD {
  def apply(left: trajFormula, right: trajFormula) = new BV_MOD(left, right)
}

class BV_EXTRACT(var v: trajFormula, var left: Int, var right: Int)
    extends VAR("expression") {
  override def f_val: String = s"( ${v.f_val} [ ${left}:${right}] )"

  override def eval1(): String = s"${v.eval1()}[${left}:${right}]"

  override def eval2(): String = {
    s"(BV_EXTRACT ${v.eval2()} $left $right )"
  }
}

object BV_EXTRACT {
  def apply(v: trajFormula, left: Int, right: Int) =
    new BV_EXTRACT(v, left, right)
}

class BV_GT(var left: trajFormula, var right: trajFormula)
    extends VAR("expression") {
  override def f_val: String = s"( ${left.f_val} > ${right.f_val} )"

  override def eval1(): String = s"( ${left.eval1()} > ${right.eval1()} )"

  override def eval2(): String = {
    s"(bv_gt ${left.eval2()} ${right.eval2()} )"
  }
}

object BV_GT {
  def apply(left: trajFormula, right: trajFormula) = new BV_GT(left, right)
}

class Bundle_VAR(var T: Any, var json: String) extends trajFormula {
  val json_parsed: Json = parse(json).getOrElse(Json.Null)
  traverseJson_addvar(json_parsed, "")
  def traverseJson_addvar(json: Json, prefix: String): Unit = {
    json.fold(
      (),
      bool => {},
      num => {},
      str => {
        var input: String = s"$str"
        val parts = input.stripPrefix("\\[").stripSuffix("]").split(":")
        if (parts.length == 2) {
          val name = input.takeWhile(_ != '[')
          val left_ = parts(0).split("\\[")
          val left = left_(1).toInt
          val right = parts(1)
          var var_ = s"$name,${left + 1}"
          if (!P.vars.contains(var_)) {
            P.vars += var_
          }
        } else {
          var var_ = s"$str,1"
          if (!P.vars.contains(var_)) {
            P.vars += var_
          }
        }
      },
      arr =>
        arr.zipWithIndex.foreach { case (element, index) =>
          traverseJson_addvar(element, "")
        },
      obj =>
        obj.toList.foreach { case (key, value) =>
          traverseJson_addvar(value, "")
        }
    )
  }

  def traverseJson_eval1(json: Json,pre: String, t: Int): String = {
    var ans: String = json.fold(
      "",
      bool => {
        var prefix:String = pre.stripSuffix("_")
        var v = s"$bool" match {
          case "true"  => "T"
          case "false" => "F"
        }
        return s"$prefix,$v,$t\n"
      },
      num => "",
      str => {
        var prefix:String = pre.stripSuffix("_")
        var input: String = s"$str"
        val parts = input.stripPrefix("\\[").stripSuffix("]").split(":")
        if (parts.length == 2) {
          val name = input.takeWhile(_ != '[')
          val left_ = parts(0).split("\\[")
          val left = left_(1).toInt
          val right = parts(1)
          return s"$prefix[$left:$right],$name,$t\n"
        } else {
          return s"$prefix,$str,$t\n"
        }
      },
      arr =>{
        arr.zipWithIndex.foreach { case (element, index) =>
          traverseJson_eval1(element, pre, t)
        }
        return ""
      },
      obj => {
        var r = ""
        obj.toList.foreach { case (key, value) =>
          r += traverseJson_eval1(value, pre + key + "_", t)
        }
        return r
      }
    )
    return ans
  }


  def traverseJson_eval2(json: Json,pre: String, t: Int): String = {
    var ans: String = json.fold(
      "",
      bool => {
        var prefix:String = pre.stripSuffix("_")
        var v = s"$bool" match {
          case "true"  => "T"
          case "false" => "F"
        }
        return s"\"$prefix\" is $v in_cycle $t\n"
      },
      num => {
        var prefix:String = pre.stripSuffix("_")
        return s"\"$prefix\" is $num in_cycle $t\n"
      },
      str => {
        var prefix:String = pre.stripSuffix("_")
        var input: String = s"$str"
        val parts = input.stripPrefix("\\[").stripSuffix("]").split(":")
        if (parts.length == 2) {
          val name = input.takeWhile(_ != '[')
          val left_ = parts(0).split("\\[")
          val left = left_(1).toInt
          val right = parts(1)
          return s"\"$prefix[$left:$right]\" is $name in_cycle $t\n"
        } else {
          return s"\"$prefix\" is $str in_cycle $t\n"
        }
      },
      arr =>{  //not exist in json
        arr.zipWithIndex.foreach { case (element, index) =>
          traverseJson_eval2(element, pre, t)
        }
        return ""
      },
      obj => {
        var r = ""
        obj.toList.foreach { case (key, value) =>
          r += traverseJson_eval2(value, pre + key + "_", t)
        }
        return r
      }
    )

    return ans
  }

  def eval2(prefix: String, t: Int):String = {
    var ans:String =  traverseJson_eval2(json_parsed, prefix, t)
    var ans2:String = ans.replaceAll("\n", s"\n and\n").stripSuffix(" and\n")
    return ans2 
  }

  def eval1(prefix: String, t: Int) = {
    traverseJson_eval1(json_parsed, prefix, t)
  }
}

object Bundle_VAR {
  def apply(T: Any, json: String) = new Bundle_VAR(T, json)
}
")
file://<WORKSPACE>/src/main/scala/SymbolicTrajectoryEvaluation/var.scala
file://<WORKSPACE>/src/main/scala/SymbolicTrajectoryEvaluation/var.scala:155: error: expected identifier; obtained class
class BV_MOD(var left: trajFormula, var right: trajFormula)
^
#### Short summary: 

expected identifier; obtained class