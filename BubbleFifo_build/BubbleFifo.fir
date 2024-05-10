circuit BubbleFifo :
  module Buffer :
    input clock : Clock
    input reset : Reset
    output io : { flip enq : { flip ready : UInt<1>, valid : UInt<1>, bits : UInt<16>}, deq : { flip ready : UInt<1>, valid : UInt<1>, bits : UInt<16>}}

    reg fullReg : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[BubbleFifo.scala 15:26]
    reg dataReg : UInt<16>, clock with :
      reset => (UInt<1>("h0"), dataReg) @[BubbleFifo.scala 16:22]
    when fullReg : @[BubbleFifo.scala 18:20]
      when io.deq.ready : @[BubbleFifo.scala 19:27]
        fullReg <= UInt<1>("h0") @[BubbleFifo.scala 20:17]
    else :
      when io.enq.valid : @[BubbleFifo.scala 23:27]
        fullReg <= UInt<1>("h1") @[BubbleFifo.scala 24:17]
        dataReg <= io.enq.bits @[BubbleFifo.scala 25:17]
    node _io_enq_ready_T = eq(fullReg, UInt<1>("h0")) @[BubbleFifo.scala 29:21]
    io.enq.ready <= _io_enq_ready_T @[BubbleFifo.scala 29:18]
    io.deq.valid <= fullReg @[BubbleFifo.scala 30:18]
    io.deq.bits <= dataReg @[BubbleFifo.scala 31:17]

  module Buffer_1 :
    input clock : Clock
    input reset : Reset
    output io : { flip enq : { flip ready : UInt<1>, valid : UInt<1>, bits : UInt<16>}, deq : { flip ready : UInt<1>, valid : UInt<1>, bits : UInt<16>}}

    reg fullReg : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[BubbleFifo.scala 15:26]
    reg dataReg : UInt<16>, clock with :
      reset => (UInt<1>("h0"), dataReg) @[BubbleFifo.scala 16:22]
    when fullReg : @[BubbleFifo.scala 18:20]
      when io.deq.ready : @[BubbleFifo.scala 19:27]
        fullReg <= UInt<1>("h0") @[BubbleFifo.scala 20:17]
    else :
      when io.enq.valid : @[BubbleFifo.scala 23:27]
        fullReg <= UInt<1>("h1") @[BubbleFifo.scala 24:17]
        dataReg <= io.enq.bits @[BubbleFifo.scala 25:17]
    node _io_enq_ready_T = eq(fullReg, UInt<1>("h0")) @[BubbleFifo.scala 29:21]
    io.enq.ready <= _io_enq_ready_T @[BubbleFifo.scala 29:18]
    io.deq.valid <= fullReg @[BubbleFifo.scala 30:18]
    io.deq.bits <= dataReg @[BubbleFifo.scala 31:17]

  module Buffer_2 :
    input clock : Clock
    input reset : Reset
    output io : { flip enq : { flip ready : UInt<1>, valid : UInt<1>, bits : UInt<16>}, deq : { flip ready : UInt<1>, valid : UInt<1>, bits : UInt<16>}}

    reg fullReg : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[BubbleFifo.scala 15:26]
    reg dataReg : UInt<16>, clock with :
      reset => (UInt<1>("h0"), dataReg) @[BubbleFifo.scala 16:22]
    when fullReg : @[BubbleFifo.scala 18:20]
      when io.deq.ready : @[BubbleFifo.scala 19:27]
        fullReg <= UInt<1>("h0") @[BubbleFifo.scala 20:17]
    else :
      when io.enq.valid : @[BubbleFifo.scala 23:27]
        fullReg <= UInt<1>("h1") @[BubbleFifo.scala 24:17]
        dataReg <= io.enq.bits @[BubbleFifo.scala 25:17]
    node _io_enq_ready_T = eq(fullReg, UInt<1>("h0")) @[BubbleFifo.scala 29:21]
    io.enq.ready <= _io_enq_ready_T @[BubbleFifo.scala 29:18]
    io.deq.valid <= fullReg @[BubbleFifo.scala 30:18]
    io.deq.bits <= dataReg @[BubbleFifo.scala 31:17]

  module Buffer_3 :
    input clock : Clock
    input reset : Reset
    output io : { flip enq : { flip ready : UInt<1>, valid : UInt<1>, bits : UInt<16>}, deq : { flip ready : UInt<1>, valid : UInt<1>, bits : UInt<16>}}

    reg fullReg : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[BubbleFifo.scala 15:26]
    reg dataReg : UInt<16>, clock with :
      reset => (UInt<1>("h0"), dataReg) @[BubbleFifo.scala 16:22]
    when fullReg : @[BubbleFifo.scala 18:20]
      when io.deq.ready : @[BubbleFifo.scala 19:27]
        fullReg <= UInt<1>("h0") @[BubbleFifo.scala 20:17]
    else :
      when io.enq.valid : @[BubbleFifo.scala 23:27]
        fullReg <= UInt<1>("h1") @[BubbleFifo.scala 24:17]
        dataReg <= io.enq.bits @[BubbleFifo.scala 25:17]
    node _io_enq_ready_T = eq(fullReg, UInt<1>("h0")) @[BubbleFifo.scala 29:21]
    io.enq.ready <= _io_enq_ready_T @[BubbleFifo.scala 29:18]
    io.deq.valid <= fullReg @[BubbleFifo.scala 30:18]
    io.deq.bits <= dataReg @[BubbleFifo.scala 31:17]

  module BubbleFifo :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip enq : { flip ready : UInt<1>, valid : UInt<1>, bits : UInt<16>}, deq : { flip ready : UInt<1>, valid : UInt<1>, bits : UInt<16>}}

    inst Buffer of Buffer @[BubbleFifo.scala 34:51]
    Buffer.clock <= clock
    Buffer.reset <= reset
    inst Buffer_1 of Buffer_1 @[BubbleFifo.scala 34:51]
    Buffer_1.clock <= clock
    Buffer_1.reset <= reset
    inst Buffer_2 of Buffer_2 @[BubbleFifo.scala 34:51]
    Buffer_2.clock <= clock
    Buffer_2.reset <= reset
    inst Buffer_3 of Buffer_3 @[BubbleFifo.scala 34:51]
    Buffer_3.clock <= clock
    Buffer_3.reset <= reset
    Buffer_1.io.enq <= Buffer.io.deq @[BubbleFifo.scala 36:27]
    Buffer_2.io.enq <= Buffer_1.io.deq @[BubbleFifo.scala 36:27]
    Buffer_3.io.enq <= Buffer_2.io.deq @[BubbleFifo.scala 36:27]
    Buffer.io.enq <= io.enq @[BubbleFifo.scala 39:10]
    io.deq.bits <= Buffer_3.io.deq.bits @[BubbleFifo.scala 40:10]
    io.deq.valid <= Buffer_3.io.deq.valid @[BubbleFifo.scala 40:10]
    Buffer_3.io.deq.ready <= io.deq.ready @[BubbleFifo.scala 40:10]

