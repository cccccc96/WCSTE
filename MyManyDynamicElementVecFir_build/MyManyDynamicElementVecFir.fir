circuit MyManyDynamicElementVecFir :
  module MyManyDynamicElementVecFir :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip in : UInt<8>, flip consts : UInt<8>[2], flip valid : UInt<1>, out : UInt<8>}

    reg taps_1 : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[DynamicFir.scala 15:66]
    when io.valid : @[DynamicFir.scala 16:64]
      taps_1 <= io.in @[DynamicFir.scala 16:68]
    node _io_out_T = mul(io.in, io.consts[0]) @[DynamicFir.scala 18:56]
    node _io_out_T_1 = mul(taps_1, io.consts[1]) @[DynamicFir.scala 18:56]
    node _io_out_T_2 = add(_io_out_T, _io_out_T_1) @[DynamicFir.scala 18:71]
    node _io_out_T_3 = tail(_io_out_T_2, 1) @[DynamicFir.scala 18:71]
    io.out <= _io_out_T_3 @[DynamicFir.scala 18:10]

