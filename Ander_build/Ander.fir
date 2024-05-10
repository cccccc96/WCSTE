circuit Ander :
  module Ander :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip a : UInt<1>, flip b : UInt<1>, flip c : UInt<1>, o : UInt<1>}

    node _r_T = and(io.a, io.b) @[Ander.scala 14:22]
    node _r_T_1 = and(_r_T, io.c) @[Ander.scala 14:28]
    reg r : UInt<1>, clock with :
      reset => (UInt<1>("h0"), r) @[Ander.scala 14:17]
    r <= _r_T_1 @[Ander.scala 14:17]
    io.o <= r @[Ander.scala 15:7]

