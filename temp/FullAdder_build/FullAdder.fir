circuit FullAdder :
  module FullAdder :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip a : UInt<1>, flip b : UInt<1>, flip cin : UInt<1>, sum : UInt<1>, cout : UInt<1>}

    node a_xor_b = xor(io.a, io.b) @[FullAdder.scala 16:22]
    node _io_sum_T = xor(a_xor_b, io.cin) @[FullAdder.scala 17:21]
    io.sum <= _io_sum_T @[FullAdder.scala 17:10]
    node a_and_b = and(io.a, io.b) @[FullAdder.scala 19:22]
    node b_and_cin = and(io.b, io.cin) @[FullAdder.scala 20:24]
    node a_and_cin = and(io.a, io.cin) @[FullAdder.scala 21:24]
    node _io_cout_T = or(a_and_b, b_and_cin) @[FullAdder.scala 22:22]
    node _io_cout_T_1 = or(_io_cout_T, a_and_cin) @[FullAdder.scala 22:34]
    io.cout <= _io_cout_T_1 @[FullAdder.scala 22:11]

