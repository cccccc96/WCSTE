circuit Max2 :
  module Max2 :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip in0 : UInt<8>, flip in1 : UInt<8>, out : UInt<8>}

    node _io_out_T = gt(io.in0, io.in1) @[MaxN.scala 11:24]
    node _io_out_T_1 = mux(_io_out_T, io.in0, io.in1) @[MaxN.scala 11:16]
    io.out <= _io_out_T_1 @[MaxN.scala 11:10]

