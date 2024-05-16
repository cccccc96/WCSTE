circuit RWSmem :
  module RWSmem :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip enable : UInt<1>, flip write : UInt<1>, flip addr : UInt<10>, flip dataIn : UInt<256>, dataOut : UInt<256>}

    reg mem : UInt<256>[1024], clock with :
      reset => (UInt<1>("h0"), mem) @[Ram.scala 16:16]
    io.dataOut <= UInt<1>("h0") @[Ram.scala 17:14]
    when io.enable : @[Ram.scala 18:19]
      when io.write : @[Ram.scala 19:20]
        mem[io.addr] <= io.dataIn @[Ram.scala 19:35]
      else :
        io.dataOut <= mem[io.addr] @[Ram.scala 20:31]

