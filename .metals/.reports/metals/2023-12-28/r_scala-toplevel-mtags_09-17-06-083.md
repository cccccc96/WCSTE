error id: file://<WORKSPACE>/src/main/scala/SymbolicTrajectoryEvaluation/nodeIs.scala:[4087..4092) in Input.VirtualFile("file://<WORKSPACE>/src/main/scala/SymbolicTrajectoryEvaluation/nodeIs.scala", "package SymbolicTrajectoryEvaluation

import chisel3._

class is(val node: Any, val v: Any) extends trajFormula {

  override def f_val: String = {
    val nodeExpr = node match {
      case node: Chisel.Bool => node.instanceName.replace(".", "_")
      case node: String      => node
      case _                 => throw new Exception("node type error")
    }
    val valExpr = Util.var_toString_f(v)
    s"$nodeExpr is $valExpr \n"
  }

  override def eval1(t: Int = -1): String = {
    val nodeExpr = node match {
      case node: Chisel.Bool => node.instanceName.replace(".", "_")
      case node: String      => node
      case _                 => throw new Exception("node type error")
    }
    val valExpr = Util.var_toString_1(v)
    s"$nodeExpr,$valExpr,$t"
  }

  override def eval2(t: Int = -1): String = {
    val nodeExpr = node match {
      case node: Chisel.Bool => node.instanceName.replace(".", "_")
      case node: String      => node
      case _                 => throw new Exception("node type error")
    }
    var valExpr = Util.var_toString_2(v)
    s"${Util.escaped_string(nodeExpr)} is $valExpr in_cycle $t "
  }

  // def &&(other: trajFormula) = and(this, other)
}

object is {
  def apply(node: Any, v: Any) = new is(node, v)
}

class rst(val v: Boolean) extends trajFormula {
  /*
  rst is reset
   */
  override def f_val: String = {
    if (v) {
      "rst \n"
    } else {
      "not_rst \n"
    }
  }

  override def eval1(t: Int = -1): String = {
    val value = if (v) "T" else "F"
    s"reset,$value,$t"
  }

  override def eval2(t: Int = -1): String = {
    // 如果v为true，"T"，否则"F"
    val value = if (v) "T" else "F"
    s"${Util.escaped_string("reset")} is $value in_cycle $t "
  }
  // def &&(other: trajFormula) = and(this, other)
}

object rst {
  def apply(v: Boolean) = new rst(v)
}

class is_bv(
    val node: Any,
    val v: Any,
    var left: Int = -1, // left 大
    var right: Int = -1, // right 小
    var left2: Int = -1, // left 大
    var right2: Int = -1 // right 小
) extends trajFormula {
  node match {
    case node: Chisel.UInt =>
      if (left == -1 && right == -1) {
        left = node.getWidth - 1
        right = 0
      }
    case _ =>
  }

  override def f_val: String = {
    val nodeExpr = node match {
      case node: Chisel.UInt => node.instanceName
      case node: String      => node
      case _                 => throw new Exception("node type error")
    }
    val valExpr = Util.var_toString_f(v)
    s"$nodeExpr[$left:$right] is $valExpr \n"
  }

  override def eval1(t: Int): String = {
    var nodeExpr = node match {
      case node: Chisel.UInt => node.instanceName.replace(".", "_")
      case node: String      => node
      case _                 => throw new Exception("node type error")
    }

    var valExpr = Util.var_toString_1(v)
    if (left2 != -1) {
      valExpr = s"${valExpr}[$left2:$right2]"
    }
    s"$nodeExpr[$left:$right],$valExpr,$t"
  }

  override def eval2(t: Int = -1): String = {
    var nodeExpr = node match {
      case node: Chisel.UInt => node.instanceName.replace(".", "_")
      case node: String      => node
      case _                 => throw new Exception("node type error")
    }
    nodeExpr = nodeExpr + s"[$left:$right]"
    var valExpr = Util.var_toString_2(v)
    if (left2 != -1) {
      valExpr = s"(BV_EXTRACT ${valExpr} $left2 $right2 )"
    }
    s"${Util.escaped_string(nodeExpr)} is ${valExpr} in_cycle $t "
  }

  // def &&(other: trajFormula) = and(this, other)
}

object is_bv {
  def apply(
      node: Any,
      v: Any,
      left: Int = -1,
      right: Int = -1,
      left2: Int = -1,
      right2: Int = -1
  ) = new is_bv(node, v, left, right, left2, right2)
}

class is_bundle(val node: Any, val v: Bundle_VAR) extends trajFormula {
  override def eval1(t: Int): String = {
    val nodeExpr = node match {
      case node: Chisel.Bool => node.instanceName.replace(".", "_")
      case node: String      => node
      case _                 => throw new Exception("node type error")
    }
    v.eval1(nodeExpr, t)
  }
}

object 

//待定
class is_array(
    val node: Any,
    val v: Any,
    var idx: Int,
    var left: Int,
    var right: Int
) extends trajFormula {
  override def f_val: String = {
    val nodeExpr = node match {
      case node: Chisel.Vec[Chisel.UInt] => node.instanceName
      case node: Chisel.Mem[Chisel.UInt] => node.instanceName
      case _                             => "invalid type"
    }

    val valExpr = Util.var_toString_f(v)
    s"$nodeExpr[$left:$right] is $valExpr \n"
  }

  override def eval1(t: Int): String = {
    var nodeExpr = node match {
      case node: Chisel.Vec[Chisel.UInt] => node.instanceName.replace(".", "_")
      case node: Chisel.Mem[Chisel.UInt] => node.instanceName.replace(".", "_")
      case _                             => "invalid type"
    }
    node match {
      case node: Chisel.Vec[Chisel.UInt] => nodeExpr = s"${nodeExpr}_${idx}"
      case node: Chisel.Mem[Chisel.UInt] => nodeExpr = s"${nodeExpr}_${idx}_"
      case _                             => "invalid type"
    }
    // nodeExpr = s"${nodeExpr}_${idx}_"
    var valExpr = Util.var_toString_1(v)
    s"$nodeExpr[$left:$right],$valExpr,$t"
  }

  override def eval2(t: Int = -1): String = {
    var nodeExpr = node match {
      case node: Chisel.Vec[Chisel.UInt] => node.instanceName.replace(".", "_")
      case node: Chisel.Mem[Chisel.UInt] => node.instanceName.replace(".", "_")
      case _                             => "invalid type"
    }
    node match {
      case node: Chisel.Vec[Chisel.UInt] =>
        nodeExpr = nodeExpr + s"_$idx[$left:$right]"
      case node: Chisel.Mem[Chisel.UInt] =>
        nodeExpr = nodeExpr + s"[$idx][$left:$right]"
      case _ => "invalid type"
    }
    var valExpr = Util.var_toString_2(v)
    s"${Util.escaped_string(nodeExpr)} is ${valExpr} in_cycle $t "
  }
}

object is_array {
  def apply(
      node: Any,
      v: Any,
      idx: Int,
      left: Int,
      right: Int
  ) = new is_array(node, v, idx, left, right)
}

class Imply(val guard: Any, val traj: trajFormula) extends trajFormula {
  override def f_val: String = {
    val guardExpr = Util.var_toString_f(guard)
    val trajExpr = traj.f_val
    s"$guardExpr -> $trajExpr \n"
  }

  override def eval1(t: Int = -1): String = {
    var guardExpr = Util.var_toString_1(guard)
    var trajExpr = traj.eval1(t)
    s"GUARD,$guardExpr,$trajExpr"
  }

  override def eval2(t: Int = -1): String = {
    var guardExpr = Util.var_toString_2(guard)
    var trajExpr = traj.eval2(t)
    s"$trajExpr when $guardExpr"
  }
}

object Imply {
  def apply(guard: Any, traj: trajFormula) = new Imply(guard, traj)
}
")
file://<WORKSPACE>/src/main/scala/SymbolicTrajectoryEvaluation/nodeIs.scala
file://<WORKSPACE>/src/main/scala/SymbolicTrajectoryEvaluation/nodeIs.scala:156: error: expected identifier; obtained class
class is_array(
^
#### Short summary: 

expected identifier; obtained class