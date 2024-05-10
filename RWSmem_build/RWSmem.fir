circuit RWSmem :
  module RWSmem :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip enable : UInt<1>, flip write : UInt<1>, flip addr : UInt<2>, flip dataIn : UInt<2>, dataOut : UInt<2>}

    reg mem : UInt<2>[4], clock with :
      reset => (UInt<1>("h0"), mem) @[Ram.scala 19:16]
    io.dataOut <= UInt<1>("h0") @[Ram.scala 21:14]
    when io.enable : @[Ram.scala 23:19]
      when io.write : @[Ram.scala 24:20]
        mem[io.addr] <= io.dataIn @[Ram.scala 24:35]
      else :
        io.dataOut <= mem[io.addr] @[Ram.scala 25:31]

