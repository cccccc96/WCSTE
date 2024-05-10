circuit SimpleFir :
  module SimpleFir :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip in : UInt<8>, out : UInt<8>}

    reg x_n1 : UInt, clock with :
      reset => (reset, UInt<1>("h0")) @[SimpleFir.scala 12:21]
    x_n1 <= io.in @[SimpleFir.scala 12:21]
    reg x_n2 : UInt, clock with :
      reset => (reset, UInt<1>("h0")) @[SimpleFir.scala 13:21]
    x_n2 <= x_n1 @[SimpleFir.scala 13:21]
    reg x_n3 : UInt, clock with :
      reset => (reset, UInt<1>("h0")) @[SimpleFir.scala 14:21]
    x_n3 <= x_n2 @[SimpleFir.scala 14:21]
    node _io_out_T = mul(io.in, UInt<1>("h1")) @[SimpleFir.scala 15:19]
    node _io_out_T_1 = mul(x_n1, UInt<2>("h2")) @[SimpleFir.scala 15:33]
    node _io_out_T_2 = add(_io_out_T, _io_out_T_1) @[SimpleFir.scala 15:26]
    node _io_out_T_3 = tail(_io_out_T_2, 1) @[SimpleFir.scala 15:26]
    node _io_out_T_4 = mul(x_n2, UInt<1>("h1")) @[SimpleFir.scala 15:47]
    node _io_out_T_5 = add(_io_out_T_3, _io_out_T_4) @[SimpleFir.scala 15:40]
    node _io_out_T_6 = tail(_io_out_T_5, 1) @[SimpleFir.scala 15:40]
    node _io_out_T_7 = mul(x_n3, UInt<1>("h1")) @[SimpleFir.scala 15:61]
    node _io_out_T_8 = add(_io_out_T_6, _io_out_T_7) @[SimpleFir.scala 15:54]
    node _io_out_T_9 = tail(_io_out_T_8, 1) @[SimpleFir.scala 15:54]
    io.out <= _io_out_T_9 @[SimpleFir.scala 15:10]

