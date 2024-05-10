circuit DynamicMemorySearch :
  module DynamicMemorySearch :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip isWr : UInt<1>, flip wrAddr : UInt<2>, flip data : UInt<8>, flip en : UInt<1>, target : UInt<2>, done : UInt<1>}

    reg index : UInt<2>, clock with :
      reset => (reset, UInt<2>("h0")) @[DynamicMemorySearch.scala 14:23]
    cmem list : UInt<8> [4] @[DynamicMemorySearch.scala 16:19]
    infer mport memVal = list[index], clock @[DynamicMemorySearch.scala 17:20]
    node _done_T = eq(io.en, UInt<1>("h0")) @[DynamicMemorySearch.scala 19:16]
    node _done_T_1 = eq(memVal, io.data) @[DynamicMemorySearch.scala 19:35]
    node _done_T_2 = eq(index, UInt<2>("h3")) @[DynamicMemorySearch.scala 19:58]
    node _done_T_3 = or(_done_T_1, _done_T_2) @[DynamicMemorySearch.scala 19:48]
    node done = and(_done_T, _done_T_3) @[DynamicMemorySearch.scala 19:23]
    when io.isWr : @[DynamicMemorySearch.scala 21:18]
      infer mport MPORT = list[io.wrAddr], clock @[DynamicMemorySearch.scala 22:9]
      MPORT <= io.data @[DynamicMemorySearch.scala 22:21]
    else :
      when io.en : @[DynamicMemorySearch.scala 23:23]
        index <= UInt<1>("h0") @[DynamicMemorySearch.scala 24:11]
      else :
        node _T = eq(done, UInt<1>("h0")) @[DynamicMemorySearch.scala 25:21]
        when _T : @[DynamicMemorySearch.scala 25:34]
          node _index_T = add(index, UInt<1>("h1")) @[DynamicMemorySearch.scala 26:20]
          node _index_T_1 = tail(_index_T, 1) @[DynamicMemorySearch.scala 26:20]
          index <= _index_T_1 @[DynamicMemorySearch.scala 26:11]
    io.done <= done @[DynamicMemorySearch.scala 28:13]
    io.target <= index @[DynamicMemorySearch.scala 29:13]

