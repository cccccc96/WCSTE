package neuron
import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec
import SymbolicTrajectoryEvaluation._

class DynamicFirTest extends AnyFlatSpec with ChiselScalatestTester {
  behavior of "DynamicFirTest"
  it should "DynamicFirTest" in {
    val n:Int = 2
    val width:Int = 8
    val k:Int =2
    test(new MyManyDynamicElementVecFir(n,width)) { c =>
        def in(n: Int) = {
            VAR(s"i$n",width)
        }
        def b(n: Int) ={
            VAR(s"b$n",width)
        }
        def const_ant():trajFormula = {
            var const_ant_t:trajFormula = is_array(c.io.consts,b(0),0,width-1,0)
            for(i<-1 until n){
                const_ant_t = const_ant_t&&is_array(c.io.consts,b(i),i,width-1,0)
            }
            return const_ant_t
        }
        def ant(t:Int) = {
            at_cycle(
                is_bv(c.io.in,in(t))&&const_ant()&&rst(false)&&is(c.io.valid,true),t+1)
        }
        def res(t:Int):VAR = {
            var value:VAR = b(n-1)*in(t)
            for(i <- t+1 until t+n){
                value = value+b(n-1-i+t)*in(i)
            }
            return value
        }
        var ant_t:trajFormula = at_cycle(rst(true),0)
        for(i <- 0 until 2*n){
            ant_t = ant_t&&ant(i)
        }
        // for(i <- n+1 until 2*n){
        //     ant_t = ant_t&&at_cycle(const_ant()&&rst(false)&&is(c.io.valid,true),i)
        
        // }
        val cons = at_cycle(is_bv(c.io.out,res(0)),n)&&at_cycle(is_bv(c.io.out,res(1)),n+1)
        val assert = new Assert(ant_t, cons, () => new MyManyDynamicElementVecFir(n,width), BDD)

        assert.STE


    }
}   
}
