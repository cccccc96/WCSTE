circuit Stack :
  module Stack :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip push : UInt<1>, flip pop : UInt<1>, flip en : UInt<1>, flip dataIn : UInt<32>, dataOut : UInt<32>}

    wire _stack_mem_WIRE : UInt<32>[10] @[Stack.scala 17:34]
    _stack_mem_WIRE[0] <= UInt<32>("h0") @[Stack.scala 17:34]
    _stack_mem_WIRE[1] <= UInt<32>("h0") @[Stack.scala 17:34]
    _stack_mem_WIRE[2] <= UInt<32>("h0") @[Stack.scala 17:34]
    _stack_mem_WIRE[3] <= UInt<32>("h0") @[Stack.scala 17:34]
    _stack_mem_WIRE[4] <= UInt<32>("h0") @[Stack.scala 17:34]
    _stack_mem_WIRE[5] <= UInt<32>("h0") @[Stack.scala 17:34]
    _stack_mem_WIRE[6] <= UInt<32>("h0") @[Stack.scala 17:34]
    _stack_mem_WIRE[7] <= UInt<32>("h0") @[Stack.scala 17:34]
    _stack_mem_WIRE[8] <= UInt<32>("h0") @[Stack.scala 17:34]
    _stack_mem_WIRE[9] <= UInt<32>("h0") @[Stack.scala 17:34]
    reg stack_mem : UInt<32>[10], clock with :
      reset => (reset, _stack_mem_WIRE) @[Stack.scala 17:26]
    reg sp : UInt<4>, clock with :
      reset => (reset, UInt<4>("h0")) @[Stack.scala 18:26]
    reg out : UInt<32>, clock with :
      reset => (reset, UInt<32>("h0")) @[Stack.scala 19:26]
    when io.en : @[Stack.scala 21:16]
      node _T = lt(sp, UInt<4>("ha")) @[Stack.scala 22:25]
      node _T_1 = and(io.push, _T) @[Stack.scala 22:18]
      when _T_1 : @[Stack.scala 22:42]
        stack_mem[sp] <= io.dataIn @[Stack.scala 23:21]
        node _sp_T = add(sp, UInt<1>("h1")) @[Stack.scala 24:16]
        node _sp_T_1 = tail(_sp_T, 1) @[Stack.scala 24:16]
        sp <= _sp_T_1 @[Stack.scala 24:10]
      else :
        node _T_2 = gt(sp, UInt<1>("h0")) @[Stack.scala 25:31]
        node _T_3 = and(io.pop, _T_2) @[Stack.scala 25:24]
        when _T_3 : @[Stack.scala 25:39]
          node _sp_T_2 = sub(sp, UInt<1>("h1")) @[Stack.scala 26:16]
          node _sp_T_3 = tail(_sp_T_2, 1) @[Stack.scala 26:16]
          sp <= _sp_T_3 @[Stack.scala 26:10]
      node _T_4 = gt(sp, UInt<1>("h0")) @[Stack.scala 28:14]
      when _T_4 : @[Stack.scala 28:21]
        node _out_T = sub(sp, UInt<1>("h1")) @[Stack.scala 29:27]
        node _out_T_1 = tail(_out_T, 1) @[Stack.scala 29:27]
        out <= stack_mem[_out_T_1] @[Stack.scala 29:11]
    io.dataOut <= out @[Stack.scala 33:14]

