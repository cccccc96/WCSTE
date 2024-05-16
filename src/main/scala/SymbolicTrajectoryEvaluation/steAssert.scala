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

class Assert[T <: RawModule](
    val ant: trajFormula,
    val cons: trajFormula,
    val dutGen: () => T,
    val engine: EngineOption = SMT
) {

  //PATH & circuit module name
  var rootPath = System.getProperty("user.dir")
  var ponoPath = "./external/pono/build"
  var mod = Util.modName(dutGen)
  var buildPath = s"${rootPath}/${mod}_build"

  def f_val: String = {
    s"${ant.f_val} \n==>\n\n${cons.f_val}"
  }

  def generateRTL(
      targetDirSufix: String = "_build",
      outputFile: String = ""
  ): PrintWriter = {
    println("mod_name: " + mod)
    val targetDir = mod + targetDirSufix
    val arg = new ArrayBuffer[String]
    arg ++= Array("--target-dir", targetDir)
    val state = new ChiselStage()
    val rtl = state.emitSystemVerilog(dutGen(), arg.toArray)

    val suffix = "sv"
    val currentPath = Paths.get(System.getProperty("user.dir"))
    val out = if (outputFile.isEmpty) {
      mod + "." + suffix
    } else {
      outputFile
    }
    val filePath = Paths.get(currentPath.toString, targetDir, out)
    new PrintWriter(filePath.toString) {
      print(rtl);
      close()
    }
  }

  def generate_intermediate_Assert(): Unit = {
    val filename = "ste.assert"
    val filepath = Paths.get(buildPath, filename)
    val writer = new PrintWriter(filepath.toString)
    var intermediate_Assert = Util.intermediate_Assert_ant_cons_combine(ant.eval1(), cons.eval1())
    writer.write(intermediate_Assert)
    writer.close()
  }

  def run_SMT_STE(): Unit ={
    // 定义要执行的命令
    val buildPath_ = buildPath
    println(buildPath_)
    val command = s"${ponoPath}/pono " + buildPath_ + " " + mod
    println(command)

    // 使用Process类执行命令
    val output: String = command !!

    // 输出命令执行的结果
    println(output)
  }

  def generate_FL_Shell(): Unit = {
    val filename = "verify.sh"
    val filepath = Paths.get(buildPath, filename)
    val writer = new PrintWriter(filepath.toString)
    val content ="""
start_time=$(date +%s)
fl -noX -f verify.fl
end_time=$(date +%s)  
elapsed_time=$((end_time - start_time))  
echo "runtime: $elapsed_time s" > voss_res.txt
    """
    writer.write(content)
    writer.close()
    val command = "chmod +x " + filepath.toString
    command !!
  }

  def generate_FL(): Unit = {
    val filename = "verify.fl"
    val filepath = Paths.get(buildPath, filename)
    println(filepath.toString)
    val writer = new PrintWriter(filepath.toString)
    println(ant.eval2())
    var FL_str = Util.FL_ant_cons_combine(ant.eval2(), cons.eval2(),mod)
    writer.write(FL_str)
    writer.close()
  }
  
  def run_FL() = {
    val command = s"./verify.sh"
    // 使用Process类执行命令
    val output = Process(command, new java.io.File(buildPath)).!!
    println(output)
  }

  def STE = {
    // println(this->f_val)
    if(engine == BDD) {
      generateRTL()
      generate_FL()
      generate_FL_Shell()

      run_FL()
    }else if(engine == SMT) {
      generateRTL()
      generate_intermediate_Assert()
      run_SMT_STE()
    }
  }

}
