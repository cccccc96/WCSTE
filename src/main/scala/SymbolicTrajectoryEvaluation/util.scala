package SymbolicTrajectoryEvaluation
import  chisel3._
import chisel3.stage._
object Util {
  /*
  VAR(AND,OR...)/INT/BOOLEAN - f_val 
  */
  def var_toString_f(v:Any):String = {
    v match {
      case x: VAR     => x.f_val
      case x: Int     => x.toString
      case x: Boolean => if (x) "T" else "F"
    }
  }

  /*
  VAR(AND,OR...)/INT/BOOLEAN - eval1 
  */
  def var_toString_1(v:Any):String = {
    v match {
      case x: VAR     => x.eval1()
      case x: Int     => x.toString
      case x: Boolean => if (x) "T" else "F"
    }
  }

  /*
  VAR(AND,OR...)/INT/BOOLEAN - eval2 
  */
  def var_toString_2(v:Any):String = {
    v match {
      case x: VAR     => x.eval2()
      case x: Int     => x.toString
      case x: Boolean => if (x) "T" else "F"
    }
  }

  def escaped_string(str:String):String = {
    "\"" + str + "\""
  }

  def modName[T <: RawModule](dutGen: () => T): String = {
    val annos = ChiselGeneratorAnnotation(dutGen).elaborate
    val designAnno = annos.last
    designAnno match {
      case DesignAnnotation(dut) => dut.name
    }
  }

  def FL_Format(x: String): String = {
    var res = x 
    res = res.replace("!", " NOT ")
    res = res.replace("&", " AND ")
    res = res.replace("|", " OR ") 
    res 
  }

  def FL_CLOCK(x: Int):String = {
    s"\"clock\" is_clock $x"
  }

  def intermediate_Assert_ant_cons_combine(ant: String, cons: String): String = {
    var res = ""
    res = res + "VARS\n"
    for (element <- P.vars) {
      res += element + "\n"
    }
    res = res + "ANT\n"
    res = res + ant
    res = res + "\nCONS\n"
    res = res + cons
    res 
  }

  def FL_ant_cons_combine(ant: String, cons: String, mod: String): String = {
    var v_str = ""
    for(v <- P.vars){
      var arr = v.split(",")
      var name = arr(0)
      var bv_size = arr(1).toInt
      if(bv_size==1){
        v_str += s"let ${name} = variable \"${name}\" ;\n"
      }else{
        v_str += s"let ${name} = bv_variable \"${name}[${bv_size-1}:0]\" ;\n"
      }
    }
    s"""load \"ste.fl\";
update_vossrc "RECURSION-CALL-LIMIT" "100000";
update_vossrc "DYNAMIC-ORDERING" "NO";
let p = verilog2pexlif \"\" \"${mod}\" [\"${mod}.sv\"] [];
let ckt = pexlif2fsm p;
${v_str}
let ant = 
  ${FL_CLOCK(P.max_clock+1)} 
  and
  ${ant};
let cons = 
  ${cons};
let ste = STE "-e" ckt [] ant cons [];
ste;
printf "ste_r:";
get_ste_result ste "checkOK";
exit 0;
    """
  }
}