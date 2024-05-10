circuit Neuron :
  module Neuron :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip in : Fixed<16><<4>>[2], flip weights : Fixed<16><<4>>[2], out : Fixed<16><<4>>}

    node _mac_T = mul(io.in[0], io.weights[0]) @[Neuron.scala 18:77]
    node _mac_T_1 = mul(io.in[1], io.weights[1]) @[Neuron.scala 18:77]
    node _mac_T_2 = add(_mac_T, _mac_T_1) @[Neuron.scala 18:89]
    node _mac_T_3 = tail(_mac_T_2, 1) @[Neuron.scala 18:89]
    node mac = asFixedPoint(_mac_T_3, 8) @[Neuron.scala 18:89]
    node _io_out_T = leq(mac, asFixedPoint(UInt<1>("h0"), 4)) @[Neuron.scala 23:51]
    node _io_out_T_1 = mux(_io_out_T, asFixedPoint(UInt<1>("h0"), 4), asFixedPoint(UInt<8>("h74"), 4)) @[Neuron.scala 23:48]
    io.out <= _io_out_T_1 @[Neuron.scala 19:10]

