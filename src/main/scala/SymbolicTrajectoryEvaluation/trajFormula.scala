package SymbolicTrajectoryEvaluation


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

object P {
  val delim = ","
  var vars: Set[String] = Set[String]()
  var max_clock = 1
  var temp:String = ""
}

abstract class trajFormula {
  // the formula value
  def f_val: String =""

  //SMT
  def eval1(t: Int = -1): String = {
    f_val
  }

  //BDD
  def eval2(t: Int = -1): String = {
    println("call abstract eval2 with t")
    f_val
  }

  //SMT
  def eval1(): String = {
    f_val+"eval1"
  }

  //BDD
  def eval2(): String = {
    println("call abstract eval2")
    f_val
  }

  def &&(other: trajFormula) = and(this, other)
}


