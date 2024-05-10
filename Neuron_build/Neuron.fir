circuit Neuron :
  module Neuron :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip in : Fixed<16><<8>>[2], flip weights : Fixed<16><<8>>[2], out : Fixed<16><<8>>}

    node _mac_T = mul(io.in[0], io.weights[0]) @[Neuron.scala 18:77]
    node _mac_T_1 = mul(io.in[1], io.weights[1]) @[Neuron.scala 18:77]
    node _mac_T_2 = add(_mac_T, _mac_T_1) @[Neuron.scala 18:89]
    node _mac_T_3 = tail(_mac_T_2, 1) @[Neuron.scala 18:89]
    node mac = asFixedPoint(_mac_T_3, 16) @[Neuron.scala 18:89]
    node _io_out_T = leq(mac, asFixedPoint(UInt<1>("h0"), 8)) @[neuSpec.scala 13:53]
    node _io_out_T_1 = mux(_io_out_T, asFixedPoint(UInt<1>("h0"), 8), asFixedPoint(UInt<10>("h100"), 8)) @[neuSpec.scala 13:50]
    io.out <= _io_out_T_1 @[Neuron.scala 19:10]

