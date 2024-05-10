circuit FIFO :
  module FIFO :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip rst : UInt<1>, flip dataIn : UInt<2>, flip push : UInt<1>, flip pop : UInt<1>, dataOut : UInt<2>, full : UInt<1>, empty : UInt<1>}

    reg memRegs : UInt<2>[2], clock with :
      reset => (UInt<1>("h0"), memRegs) @[FIFO.scala 15:20]
    reg tailReg : UInt<1>, clock with :
      reset => (UInt<1>("h0"), tailReg) @[FIFO.scala 16:21]
    reg headReg : UInt<1>, clock with :
      reset => (UInt<1>("h0"), headReg) @[FIFO.scala 17:21]
    reg emptyReg : UInt<1>, clock with :
      reset => (UInt<1>("h0"), emptyReg) @[FIFO.scala 18:21]
    when io.rst : @[FIFO.scala 19:15]
      tailReg <= UInt<1>("h0") @[FIFO.scala 20:13]
      headReg <= UInt<1>("h0") @[FIFO.scala 21:13]
      emptyReg <= UInt<1>("h1") @[FIFO.scala 22:14]
    else :
      node _T = eq(io.full, UInt<1>("h0")) @[FIFO.scala 23:24]
      node _T_1 = and(io.push, _T) @[FIFO.scala 23:22]
      when _T_1 : @[FIFO.scala 23:34]
        memRegs[headReg] <= io.dataIn @[FIFO.scala 24:22]
        node _headReg_T = add(headReg, UInt<1>("h1")) @[FIFO.scala 25:24]
        node _headReg_T_1 = tail(_headReg_T, 1) @[FIFO.scala 25:24]
        headReg <= _headReg_T_1 @[FIFO.scala 25:13]
        emptyReg <= UInt<1>("h0") @[FIFO.scala 26:14]
      else :
        node _T_2 = eq(emptyReg, UInt<1>("h0")) @[FIFO.scala 27:23]
        node _T_3 = and(io.pop, _T_2) @[FIFO.scala 27:21]
        when _T_3 : @[FIFO.scala 27:34]
          node _tailReg_T = add(tailReg, UInt<1>("h1")) @[FIFO.scala 28:24]
          node _tailReg_T_1 = tail(_tailReg_T, 1) @[FIFO.scala 28:24]
          tailReg <= _tailReg_T_1 @[FIFO.scala 28:13]
          node _T_4 = add(tailReg, UInt<1>("h1")) @[FIFO.scala 29:19]
          node _T_5 = tail(_T_4, 1) @[FIFO.scala 29:19]
          node _T_6 = eq(_T_5, headReg) @[FIFO.scala 29:26]
          when _T_6 : @[FIFO.scala 29:39]
            emptyReg <= UInt<1>("h1") @[FIFO.scala 30:16]
    io.empty <= emptyReg @[FIFO.scala 33:12]
    node _io_dataOut_T = add(tailReg, UInt<1>("h1")) @[FIFO.scala 34:32]
    node _io_dataOut_T_1 = tail(_io_dataOut_T, 1) @[FIFO.scala 34:32]
    io.dataOut <= memRegs[_io_dataOut_T_1] @[FIFO.scala 34:14]
    node _io_full_T = eq(tailReg, headReg) @[FIFO.scala 35:23]
    node _io_full_T_1 = eq(emptyReg, UInt<1>("h0")) @[FIFO.scala 35:38]
    node _io_full_T_2 = and(_io_full_T, _io_full_T_1) @[FIFO.scala 35:36]
    io.full <= _io_full_T_2 @[FIFO.scala 35:11]

