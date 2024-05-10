package ste

object Util {
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

  // def FL_SHELL(buildPath:String) = {

  // }

  def FL_ant_cons_combine(ant: String, cons: String, mod: String): String = {
    var v_str = ""
    for(v <- P.vars){
      var arr = v.split(",")
      var name = arr(0)
      v_str += s"let ${name} = variable \"${name}\" ;\n"
    }
    s"""load \"ste.fl\";
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