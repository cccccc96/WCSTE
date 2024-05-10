//
// SMatMul tester
//
// written by Kazutomo Yoshii <kazutomo.yoshii@gmail.com>
//
package matmul

import chisel3._
import chiseltest._
import org.scalatest.Tag
import org.scalatest.flatspec.AnyFlatSpec

//
// Use scalatest's option flags to include or exclude tags.
//
// To include only RequiresTreadle
// sbt "testOnly matmul.SMatMulSpec -- -n RequiresTreadle"
//
// To exclude RequiresTreadle, which selects RequiresVerilator
// sbt "testOnly matmul.SMatMulSpec -- -l RequiresTreadle"
//
object RequiresVerilator extends Tag("RequiresVerilator")
object RequiresTreadle extends Tag("RequiresTreadle")

class SMatMulSpec extends AnyFlatSpec with ChiselScalatestTester {
  def mmul(a: Array[Array[Int]], b: Array[Array[Int]]) : Array[Array[Int]] = {
    for(r <- a) yield {
      for(c <- b.transpose) yield r zip c map Function.tupled(_*_) reduceLeft (_+_)
    }
  }
  def matInit(n: Int,seed:Int) : Array[Array[Int]] = {
    val rseed = seed
    val maxval = 5
    val rnd = new scala.util.Random(rseed)

    Array.tabulate(n){ _ => Array.tabulate(n){_ => rnd.nextInt(maxval+1)+1}}
  }

  def matInit2(n:Int): Array[Array[Int]] = {
    val myArray: Array[Array[Int]] = Array.ofDim[Int](2, 2)
    if(n==1){
    myArray(0)(0) = 165
    myArray(0)(1) = 128
    myArray(1)(0) = 0
    // myArray(1)(1) = 0
    }
    else if(n==2){
          myArray(0)(0) = 246
    myArray(0)(1) = 0
    myArray(1)(0) = 192
    myArray(1)(1) = 0
    }
    return myArray
  }

  def printmat(m: Array[Array[Int]]) : Unit = {
    m.foreach{r => r.foreach{v => print(f"$v%4d")} ; print(" ;") }
    println()
  }

  private def testSMatMul(dut: SMatMul): Unit = {
    val n = dut.n
    val a = matInit(n,10)
    val b = matInit(n,1)
    // val a = matInit2(1)
    // val b = matInit2(2)
    val y = mmul(a, b)

    printmat(a)
    printmat(b)
    printmat(y)

    def checkresult() : List[Int] = {
      val ret = for(j <- 0 until n*n) yield {
        val out = dut.io.out(j).peek().litValue
        print(out.toString + " ")
        out.toInt // litValue returns BigInt
      }
      println("result")
      ret.toList
    }

    for (clk <- 0 until 2*n) {
      for (idx <- 0 until n) {
        val p = clk - idx
        if (p >= 0 && p < n) {
          dut.io.in_a(idx).poke(a(idx)(p))
          dut.io.in_b(idx).poke(b(p)(idx))
          println(f"clk $clk poke dut.io.in_a/b($idx) a($idx)($p) b($p)($idx): ${a(idx)(p)}*${b(p)(idx)} ")
        } else {
          dut.io.in_a(idx).poke(0)
          dut.io.in_b(idx).poke(0)
          println(f"clk $clk poke $idx $p: 0 ")
        }
      }
      dut.clock.step(1)
      print(f"clk: $clk: ")
      checkresult()
    }
    // println(dut.clock.)
    dut.clock.step(n-2) //  double check n-2 is correct
    print(f"clk: ${2*n-1+n-2}: ")
    val output = checkresult()

    var invalidcnt = 0
    for (i <- output zip y.flatten.toList) {
      if( i._1 != i._2 ) {
        println("Error: " + i._1 + " " + i._2)
        invalidcnt += 1
      }
    }

    if (invalidcnt == 0) println("Verification passed!")
    dut.clock.step(2)
  }

  // "SMatMul basic test on Verilator" should "pass" taggedAs RequiresVerilator in {
  //   test(new SMatMul()).withAnnotations(Seq(VerilatorBackendAnnotation, WriteVcdAnnotation))(testSMatMul)
  // }

  "SMatMul basic test on Treadle" should "pass" taggedAs RequiresTreadle in {
    test(new SMatMul(4))(testSMatMul)
  }
}
