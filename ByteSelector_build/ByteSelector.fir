circuit ByteSelector :
  module ByteSelector :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip in : UInt<32>, flip offset : UInt<2>, out : UInt<8>}

    io.out <= UInt<8>("h0") @[ByteSelector.scala 12:10]
    node _T = eq(io.offset, UInt<2>("h0")) @[ByteSelector.scala 13:19]
    when _T : @[ByteSelector.scala 13:33]
      node _io_out_T = bits(io.in, 7, 0) @[ByteSelector.scala 14:20]
      io.out <= _io_out_T @[ByteSelector.scala 14:12]
    else :
      node _T_1 = eq(io.offset, UInt<1>("h1")) @[ByteSelector.scala 15:26]
      when _T_1 : @[ByteSelector.scala 15:35]
        node _io_out_T_1 = bits(io.in, 15, 8) @[ByteSelector.scala 16:20]
        io.out <= _io_out_T_1 @[ByteSelector.scala 16:12]
      else :
        node _T_2 = eq(io.offset, UInt<2>("h2")) @[ByteSelector.scala 17:26]
        when _T_2 : @[ByteSelector.scala 17:35]
          node _io_out_T_2 = bits(io.in, 23, 16) @[ByteSelector.scala 18:20]
          io.out <= _io_out_T_2 @[ByteSelector.scala 18:12]
        else :
          node _io_out_T_3 = bits(io.in, 31, 24) @[ByteSelector.scala 20:20]
          io.out <= _io_out_T_3 @[ByteSelector.scala 20:12]

