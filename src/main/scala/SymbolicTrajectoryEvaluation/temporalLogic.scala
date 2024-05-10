package SymbolicTrajectoryEvaluation

// 子类继承抽象类并传入参数
class at_cycle(val traj: trajFormula, val t: Int) extends trajFormula {
  P.max_clock = if (t > P.max_clock) t else P.max_clock

  override def f_val: String = {
    val trajExpr = traj.f_val
    s"at_cycle $t:\n $trajExpr"
  }
  

  override def eval1(): String = {
    
    traj.eval1(t)
  }

  override def eval2(): String = {
    println(s"at_cycle $t")
    traj.eval2(t)
  }

}

object at_cycle {
  def apply(traj: trajFormula, t: Int) = new at_cycle(traj, t)
}



class and(val left: trajFormula, val right: trajFormula) extends trajFormula {
   
  override def f_val: String = { 
    val leftExpr = left.f_val
    val rightExpr = right.f_val
    s"$leftExpr and  $rightExpr"
  }

  override def eval1(t:Int): String = {
    val leftExpr = left.eval1(t).stripSuffix("\n")
    val rightExpr = right.eval1(t).stripSuffix("\n")
    s"$leftExpr\n$rightExpr"
  }

  override def eval1(): String = {
    val leftExpr = left.eval1()
    val rightExpr = right.eval1()
    s"$leftExpr\n$rightExpr"
  }

  override def eval2(t:Int): String = {
    val leftExpr = left.eval2(t).stripSuffix("\n")
    val rightExpr = right.eval2(t).stripSuffix("\n")
    s"$leftExpr \n and \n $rightExpr"
  }

  override def eval2(): String = {
    val leftExpr = left.eval2()
    val rightExpr = right.eval2()
    s"$leftExpr \n and \n $rightExpr"
  }
}

object and {
  def apply(left: trajFormula, right: trajFormula) = new and(left, right)
}
