circuit CAM_m_n :
  module CAMLine :
    input clock : Clock
    input reset : Reset
    output io : { flip we : UInt<1>, flip wi : UInt<1>, flip key : UInt<64>, flip din : UInt<64>, hit : UInt<1>, camCells : UInt<64>}

    wire write : UInt<1> @[cam.scala 57:19]
    node _write_T = and(io.we, io.wi) @[cam.scala 58:18]
    write <= _write_T @[cam.scala 58:9]
    reg camCells : UInt<64>, clock with :
      reset => (UInt<1>("h0"), camCells) @[cam.scala 59:21]
    when write : @[cam.scala 61:14]
      camCells <= io.din @[cam.scala 62:14]
    node _io_hit_T = eq(camCells, io.key) @[cam.scala 65:23]
    io.hit <= _io_hit_T @[cam.scala 65:10]
    io.camCells <= camCells @[cam.scala 66:15]

  module CAMLine_1 :
    input clock : Clock
    input reset : Reset
    output io : { flip we : UInt<1>, flip wi : UInt<1>, flip key : UInt<64>, flip din : UInt<64>, hit : UInt<1>, camCells : UInt<64>}

    wire write : UInt<1> @[cam.scala 57:19]
    node _write_T = and(io.we, io.wi) @[cam.scala 58:18]
    write <= _write_T @[cam.scala 58:9]
    reg camCells : UInt<64>, clock with :
      reset => (UInt<1>("h0"), camCells) @[cam.scala 59:21]
    when write : @[cam.scala 61:14]
      camCells <= io.din @[cam.scala 62:14]
    node _io_hit_T = eq(camCells, io.key) @[cam.scala 65:23]
    io.hit <= _io_hit_T @[cam.scala 65:10]
    io.camCells <= camCells @[cam.scala 66:15]

  module CAMLine_2 :
    input clock : Clock
    input reset : Reset
    output io : { flip we : UInt<1>, flip wi : UInt<1>, flip key : UInt<64>, flip din : UInt<64>, hit : UInt<1>, camCells : UInt<64>}

    wire write : UInt<1> @[cam.scala 57:19]
    node _write_T = and(io.we, io.wi) @[cam.scala 58:18]
    write <= _write_T @[cam.scala 58:9]
    reg camCells : UInt<64>, clock with :
      reset => (UInt<1>("h0"), camCells) @[cam.scala 59:21]
    when write : @[cam.scala 61:14]
      camCells <= io.din @[cam.scala 62:14]
    node _io_hit_T = eq(camCells, io.key) @[cam.scala 65:23]
    io.hit <= _io_hit_T @[cam.scala 65:10]
    io.camCells <= camCells @[cam.scala 66:15]

  module CAMLine_3 :
    input clock : Clock
    input reset : Reset
    output io : { flip we : UInt<1>, flip wi : UInt<1>, flip key : UInt<64>, flip din : UInt<64>, hit : UInt<1>, camCells : UInt<64>}

    wire write : UInt<1> @[cam.scala 57:19]
    node _write_T = and(io.we, io.wi) @[cam.scala 58:18]
    write <= _write_T @[cam.scala 58:9]
    reg camCells : UInt<64>, clock with :
      reset => (UInt<1>("h0"), camCells) @[cam.scala 59:21]
    when write : @[cam.scala 61:14]
      camCells <= io.din @[cam.scala 62:14]
    node _io_hit_T = eq(camCells, io.key) @[cam.scala 65:23]
    io.hit <= _io_hit_T @[cam.scala 65:10]
    io.camCells <= camCells @[cam.scala 66:15]

  module CAMLine_4 :
    input clock : Clock
    input reset : Reset
    output io : { flip we : UInt<1>, flip wi : UInt<1>, flip key : UInt<64>, flip din : UInt<64>, hit : UInt<1>, camCells : UInt<64>}

    wire write : UInt<1> @[cam.scala 57:19]
    node _write_T = and(io.we, io.wi) @[cam.scala 58:18]
    write <= _write_T @[cam.scala 58:9]
    reg camCells : UInt<64>, clock with :
      reset => (UInt<1>("h0"), camCells) @[cam.scala 59:21]
    when write : @[cam.scala 61:14]
      camCells <= io.din @[cam.scala 62:14]
    node _io_hit_T = eq(camCells, io.key) @[cam.scala 65:23]
    io.hit <= _io_hit_T @[cam.scala 65:10]
    io.camCells <= camCells @[cam.scala 66:15]

  module CAMLine_5 :
    input clock : Clock
    input reset : Reset
    output io : { flip we : UInt<1>, flip wi : UInt<1>, flip key : UInt<64>, flip din : UInt<64>, hit : UInt<1>, camCells : UInt<64>}

    wire write : UInt<1> @[cam.scala 57:19]
    node _write_T = and(io.we, io.wi) @[cam.scala 58:18]
    write <= _write_T @[cam.scala 58:9]
    reg camCells : UInt<64>, clock with :
      reset => (UInt<1>("h0"), camCells) @[cam.scala 59:21]
    when write : @[cam.scala 61:14]
      camCells <= io.din @[cam.scala 62:14]
    node _io_hit_T = eq(camCells, io.key) @[cam.scala 65:23]
    io.hit <= _io_hit_T @[cam.scala 65:10]
    io.camCells <= camCells @[cam.scala 66:15]

  module CAMLine_6 :
    input clock : Clock
    input reset : Reset
    output io : { flip we : UInt<1>, flip wi : UInt<1>, flip key : UInt<64>, flip din : UInt<64>, hit : UInt<1>, camCells : UInt<64>}

    wire write : UInt<1> @[cam.scala 57:19]
    node _write_T = and(io.we, io.wi) @[cam.scala 58:18]
    write <= _write_T @[cam.scala 58:9]
    reg camCells : UInt<64>, clock with :
      reset => (UInt<1>("h0"), camCells) @[cam.scala 59:21]
    when write : @[cam.scala 61:14]
      camCells <= io.din @[cam.scala 62:14]
    node _io_hit_T = eq(camCells, io.key) @[cam.scala 65:23]
    io.hit <= _io_hit_T @[cam.scala 65:10]
    io.camCells <= camCells @[cam.scala 66:15]

  module CAMLine_7 :
    input clock : Clock
    input reset : Reset
    output io : { flip we : UInt<1>, flip wi : UInt<1>, flip key : UInt<64>, flip din : UInt<64>, hit : UInt<1>, camCells : UInt<64>}

    wire write : UInt<1> @[cam.scala 57:19]
    node _write_T = and(io.we, io.wi) @[cam.scala 58:18]
    write <= _write_T @[cam.scala 58:9]
    reg camCells : UInt<64>, clock with :
      reset => (UInt<1>("h0"), camCells) @[cam.scala 59:21]
    when write : @[cam.scala 61:14]
      camCells <= io.din @[cam.scala 62:14]
    node _io_hit_T = eq(camCells, io.key) @[cam.scala 65:23]
    io.hit <= _io_hit_T @[cam.scala 65:10]
    io.camCells <= camCells @[cam.scala 66:15]

  module CAMLine_8 :
    input clock : Clock
    input reset : Reset
    output io : { flip we : UInt<1>, flip wi : UInt<1>, flip key : UInt<64>, flip din : UInt<64>, hit : UInt<1>, camCells : UInt<64>}

    wire write : UInt<1> @[cam.scala 57:19]
    node _write_T = and(io.we, io.wi) @[cam.scala 58:18]
    write <= _write_T @[cam.scala 58:9]
    reg camCells : UInt<64>, clock with :
      reset => (UInt<1>("h0"), camCells) @[cam.scala 59:21]
    when write : @[cam.scala 61:14]
      camCells <= io.din @[cam.scala 62:14]
    node _io_hit_T = eq(camCells, io.key) @[cam.scala 65:23]
    io.hit <= _io_hit_T @[cam.scala 65:10]
    io.camCells <= camCells @[cam.scala 66:15]

  module CAMLine_9 :
    input clock : Clock
    input reset : Reset
    output io : { flip we : UInt<1>, flip wi : UInt<1>, flip key : UInt<64>, flip din : UInt<64>, hit : UInt<1>, camCells : UInt<64>}

    wire write : UInt<1> @[cam.scala 57:19]
    node _write_T = and(io.we, io.wi) @[cam.scala 58:18]
    write <= _write_T @[cam.scala 58:9]
    reg camCells : UInt<64>, clock with :
      reset => (UInt<1>("h0"), camCells) @[cam.scala 59:21]
    when write : @[cam.scala 61:14]
      camCells <= io.din @[cam.scala 62:14]
    node _io_hit_T = eq(camCells, io.key) @[cam.scala 65:23]
    io.hit <= _io_hit_T @[cam.scala 65:10]
    io.camCells <= camCells @[cam.scala 66:15]

  module CAMLine_10 :
    input clock : Clock
    input reset : Reset
    output io : { flip we : UInt<1>, flip wi : UInt<1>, flip key : UInt<64>, flip din : UInt<64>, hit : UInt<1>, camCells : UInt<64>}

    wire write : UInt<1> @[cam.scala 57:19]
    node _write_T = and(io.we, io.wi) @[cam.scala 58:18]
    write <= _write_T @[cam.scala 58:9]
    reg camCells : UInt<64>, clock with :
      reset => (UInt<1>("h0"), camCells) @[cam.scala 59:21]
    when write : @[cam.scala 61:14]
      camCells <= io.din @[cam.scala 62:14]
    node _io_hit_T = eq(camCells, io.key) @[cam.scala 65:23]
    io.hit <= _io_hit_T @[cam.scala 65:10]
    io.camCells <= camCells @[cam.scala 66:15]

  module CAMLine_11 :
    input clock : Clock
    input reset : Reset
    output io : { flip we : UInt<1>, flip wi : UInt<1>, flip key : UInt<64>, flip din : UInt<64>, hit : UInt<1>, camCells : UInt<64>}

    wire write : UInt<1> @[cam.scala 57:19]
    node _write_T = and(io.we, io.wi) @[cam.scala 58:18]
    write <= _write_T @[cam.scala 58:9]
    reg camCells : UInt<64>, clock with :
      reset => (UInt<1>("h0"), camCells) @[cam.scala 59:21]
    when write : @[cam.scala 61:14]
      camCells <= io.din @[cam.scala 62:14]
    node _io_hit_T = eq(camCells, io.key) @[cam.scala 65:23]
    io.hit <= _io_hit_T @[cam.scala 65:10]
    io.camCells <= camCells @[cam.scala 66:15]

  module CAMLine_12 :
    input clock : Clock
    input reset : Reset
    output io : { flip we : UInt<1>, flip wi : UInt<1>, flip key : UInt<64>, flip din : UInt<64>, hit : UInt<1>, camCells : UInt<64>}

    wire write : UInt<1> @[cam.scala 57:19]
    node _write_T = and(io.we, io.wi) @[cam.scala 58:18]
    write <= _write_T @[cam.scala 58:9]
    reg camCells : UInt<64>, clock with :
      reset => (UInt<1>("h0"), camCells) @[cam.scala 59:21]
    when write : @[cam.scala 61:14]
      camCells <= io.din @[cam.scala 62:14]
    node _io_hit_T = eq(camCells, io.key) @[cam.scala 65:23]
    io.hit <= _io_hit_T @[cam.scala 65:10]
    io.camCells <= camCells @[cam.scala 66:15]

  module CAMLine_13 :
    input clock : Clock
    input reset : Reset
    output io : { flip we : UInt<1>, flip wi : UInt<1>, flip key : UInt<64>, flip din : UInt<64>, hit : UInt<1>, camCells : UInt<64>}

    wire write : UInt<1> @[cam.scala 57:19]
    node _write_T = and(io.we, io.wi) @[cam.scala 58:18]
    write <= _write_T @[cam.scala 58:9]
    reg camCells : UInt<64>, clock with :
      reset => (UInt<1>("h0"), camCells) @[cam.scala 59:21]
    when write : @[cam.scala 61:14]
      camCells <= io.din @[cam.scala 62:14]
    node _io_hit_T = eq(camCells, io.key) @[cam.scala 65:23]
    io.hit <= _io_hit_T @[cam.scala 65:10]
    io.camCells <= camCells @[cam.scala 66:15]

  module CAMLine_14 :
    input clock : Clock
    input reset : Reset
    output io : { flip we : UInt<1>, flip wi : UInt<1>, flip key : UInt<64>, flip din : UInt<64>, hit : UInt<1>, camCells : UInt<64>}

    wire write : UInt<1> @[cam.scala 57:19]
    node _write_T = and(io.we, io.wi) @[cam.scala 58:18]
    write <= _write_T @[cam.scala 58:9]
    reg camCells : UInt<64>, clock with :
      reset => (UInt<1>("h0"), camCells) @[cam.scala 59:21]
    when write : @[cam.scala 61:14]
      camCells <= io.din @[cam.scala 62:14]
    node _io_hit_T = eq(camCells, io.key) @[cam.scala 65:23]
    io.hit <= _io_hit_T @[cam.scala 65:10]
    io.camCells <= camCells @[cam.scala 66:15]

  module CAMLine_15 :
    input clock : Clock
    input reset : Reset
    output io : { flip we : UInt<1>, flip wi : UInt<1>, flip key : UInt<64>, flip din : UInt<64>, hit : UInt<1>, camCells : UInt<64>}

    wire write : UInt<1> @[cam.scala 57:19]
    node _write_T = and(io.we, io.wi) @[cam.scala 58:18]
    write <= _write_T @[cam.scala 58:9]
    reg camCells : UInt<64>, clock with :
      reset => (UInt<1>("h0"), camCells) @[cam.scala 59:21]
    when write : @[cam.scala 61:14]
      camCells <= io.din @[cam.scala 62:14]
    node _io_hit_T = eq(camCells, io.key) @[cam.scala 65:23]
    io.hit <= _io_hit_T @[cam.scala 65:10]
    io.camCells <= camCells @[cam.scala 66:15]

  module CAMLine_16 :
    input clock : Clock
    input reset : Reset
    output io : { flip we : UInt<1>, flip wi : UInt<1>, flip key : UInt<64>, flip din : UInt<64>, hit : UInt<1>, camCells : UInt<64>}

    wire write : UInt<1> @[cam.scala 57:19]
    node _write_T = and(io.we, io.wi) @[cam.scala 58:18]
    write <= _write_T @[cam.scala 58:9]
    reg camCells : UInt<64>, clock with :
      reset => (UInt<1>("h0"), camCells) @[cam.scala 59:21]
    when write : @[cam.scala 61:14]
      camCells <= io.din @[cam.scala 62:14]
    node _io_hit_T = eq(camCells, io.key) @[cam.scala 65:23]
    io.hit <= _io_hit_T @[cam.scala 65:10]
    io.camCells <= camCells @[cam.scala 66:15]

  module CAMLine_17 :
    input clock : Clock
    input reset : Reset
    output io : { flip we : UInt<1>, flip wi : UInt<1>, flip key : UInt<64>, flip din : UInt<64>, hit : UInt<1>, camCells : UInt<64>}

    wire write : UInt<1> @[cam.scala 57:19]
    node _write_T = and(io.we, io.wi) @[cam.scala 58:18]
    write <= _write_T @[cam.scala 58:9]
    reg camCells : UInt<64>, clock with :
      reset => (UInt<1>("h0"), camCells) @[cam.scala 59:21]
    when write : @[cam.scala 61:14]
      camCells <= io.din @[cam.scala 62:14]
    node _io_hit_T = eq(camCells, io.key) @[cam.scala 65:23]
    io.hit <= _io_hit_T @[cam.scala 65:10]
    io.camCells <= camCells @[cam.scala 66:15]

  module CAMLine_18 :
    input clock : Clock
    input reset : Reset
    output io : { flip we : UInt<1>, flip wi : UInt<1>, flip key : UInt<64>, flip din : UInt<64>, hit : UInt<1>, camCells : UInt<64>}

    wire write : UInt<1> @[cam.scala 57:19]
    node _write_T = and(io.we, io.wi) @[cam.scala 58:18]
    write <= _write_T @[cam.scala 58:9]
    reg camCells : UInt<64>, clock with :
      reset => (UInt<1>("h0"), camCells) @[cam.scala 59:21]
    when write : @[cam.scala 61:14]
      camCells <= io.din @[cam.scala 62:14]
    node _io_hit_T = eq(camCells, io.key) @[cam.scala 65:23]
    io.hit <= _io_hit_T @[cam.scala 65:10]
    io.camCells <= camCells @[cam.scala 66:15]

  module CAMLine_19 :
    input clock : Clock
    input reset : Reset
    output io : { flip we : UInt<1>, flip wi : UInt<1>, flip key : UInt<64>, flip din : UInt<64>, hit : UInt<1>, camCells : UInt<64>}

    wire write : UInt<1> @[cam.scala 57:19]
    node _write_T = and(io.we, io.wi) @[cam.scala 58:18]
    write <= _write_T @[cam.scala 58:9]
    reg camCells : UInt<64>, clock with :
      reset => (UInt<1>("h0"), camCells) @[cam.scala 59:21]
    when write : @[cam.scala 61:14]
      camCells <= io.din @[cam.scala 62:14]
    node _io_hit_T = eq(camCells, io.key) @[cam.scala 65:23]
    io.hit <= _io_hit_T @[cam.scala 65:10]
    io.camCells <= camCells @[cam.scala 66:15]

  module CAMLine_20 :
    input clock : Clock
    input reset : Reset
    output io : { flip we : UInt<1>, flip wi : UInt<1>, flip key : UInt<64>, flip din : UInt<64>, hit : UInt<1>, camCells : UInt<64>}

    wire write : UInt<1> @[cam.scala 57:19]
    node _write_T = and(io.we, io.wi) @[cam.scala 58:18]
    write <= _write_T @[cam.scala 58:9]
    reg camCells : UInt<64>, clock with :
      reset => (UInt<1>("h0"), camCells) @[cam.scala 59:21]
    when write : @[cam.scala 61:14]
      camCells <= io.din @[cam.scala 62:14]
    node _io_hit_T = eq(camCells, io.key) @[cam.scala 65:23]
    io.hit <= _io_hit_T @[cam.scala 65:10]
    io.camCells <= camCells @[cam.scala 66:15]

  module CAMLine_21 :
    input clock : Clock
    input reset : Reset
    output io : { flip we : UInt<1>, flip wi : UInt<1>, flip key : UInt<64>, flip din : UInt<64>, hit : UInt<1>, camCells : UInt<64>}

    wire write : UInt<1> @[cam.scala 57:19]
    node _write_T = and(io.we, io.wi) @[cam.scala 58:18]
    write <= _write_T @[cam.scala 58:9]
    reg camCells : UInt<64>, clock with :
      reset => (UInt<1>("h0"), camCells) @[cam.scala 59:21]
    when write : @[cam.scala 61:14]
      camCells <= io.din @[cam.scala 62:14]
    node _io_hit_T = eq(camCells, io.key) @[cam.scala 65:23]
    io.hit <= _io_hit_T @[cam.scala 65:10]
    io.camCells <= camCells @[cam.scala 66:15]

  module CAMLine_22 :
    input clock : Clock
    input reset : Reset
    output io : { flip we : UInt<1>, flip wi : UInt<1>, flip key : UInt<64>, flip din : UInt<64>, hit : UInt<1>, camCells : UInt<64>}

    wire write : UInt<1> @[cam.scala 57:19]
    node _write_T = and(io.we, io.wi) @[cam.scala 58:18]
    write <= _write_T @[cam.scala 58:9]
    reg camCells : UInt<64>, clock with :
      reset => (UInt<1>("h0"), camCells) @[cam.scala 59:21]
    when write : @[cam.scala 61:14]
      camCells <= io.din @[cam.scala 62:14]
    node _io_hit_T = eq(camCells, io.key) @[cam.scala 65:23]
    io.hit <= _io_hit_T @[cam.scala 65:10]
    io.camCells <= camCells @[cam.scala 66:15]

  module CAMLine_23 :
    input clock : Clock
    input reset : Reset
    output io : { flip we : UInt<1>, flip wi : UInt<1>, flip key : UInt<64>, flip din : UInt<64>, hit : UInt<1>, camCells : UInt<64>}

    wire write : UInt<1> @[cam.scala 57:19]
    node _write_T = and(io.we, io.wi) @[cam.scala 58:18]
    write <= _write_T @[cam.scala 58:9]
    reg camCells : UInt<64>, clock with :
      reset => (UInt<1>("h0"), camCells) @[cam.scala 59:21]
    when write : @[cam.scala 61:14]
      camCells <= io.din @[cam.scala 62:14]
    node _io_hit_T = eq(camCells, io.key) @[cam.scala 65:23]
    io.hit <= _io_hit_T @[cam.scala 65:10]
    io.camCells <= camCells @[cam.scala 66:15]

  module CAMLine_24 :
    input clock : Clock
    input reset : Reset
    output io : { flip we : UInt<1>, flip wi : UInt<1>, flip key : UInt<64>, flip din : UInt<64>, hit : UInt<1>, camCells : UInt<64>}

    wire write : UInt<1> @[cam.scala 57:19]
    node _write_T = and(io.we, io.wi) @[cam.scala 58:18]
    write <= _write_T @[cam.scala 58:9]
    reg camCells : UInt<64>, clock with :
      reset => (UInt<1>("h0"), camCells) @[cam.scala 59:21]
    when write : @[cam.scala 61:14]
      camCells <= io.din @[cam.scala 62:14]
    node _io_hit_T = eq(camCells, io.key) @[cam.scala 65:23]
    io.hit <= _io_hit_T @[cam.scala 65:10]
    io.camCells <= camCells @[cam.scala 66:15]

  module CAMLine_25 :
    input clock : Clock
    input reset : Reset
    output io : { flip we : UInt<1>, flip wi : UInt<1>, flip key : UInt<64>, flip din : UInt<64>, hit : UInt<1>, camCells : UInt<64>}

    wire write : UInt<1> @[cam.scala 57:19]
    node _write_T = and(io.we, io.wi) @[cam.scala 58:18]
    write <= _write_T @[cam.scala 58:9]
    reg camCells : UInt<64>, clock with :
      reset => (UInt<1>("h0"), camCells) @[cam.scala 59:21]
    when write : @[cam.scala 61:14]
      camCells <= io.din @[cam.scala 62:14]
    node _io_hit_T = eq(camCells, io.key) @[cam.scala 65:23]
    io.hit <= _io_hit_T @[cam.scala 65:10]
    io.camCells <= camCells @[cam.scala 66:15]

  module CAMLine_26 :
    input clock : Clock
    input reset : Reset
    output io : { flip we : UInt<1>, flip wi : UInt<1>, flip key : UInt<64>, flip din : UInt<64>, hit : UInt<1>, camCells : UInt<64>}

    wire write : UInt<1> @[cam.scala 57:19]
    node _write_T = and(io.we, io.wi) @[cam.scala 58:18]
    write <= _write_T @[cam.scala 58:9]
    reg camCells : UInt<64>, clock with :
      reset => (UInt<1>("h0"), camCells) @[cam.scala 59:21]
    when write : @[cam.scala 61:14]
      camCells <= io.din @[cam.scala 62:14]
    node _io_hit_T = eq(camCells, io.key) @[cam.scala 65:23]
    io.hit <= _io_hit_T @[cam.scala 65:10]
    io.camCells <= camCells @[cam.scala 66:15]

  module CAMLine_27 :
    input clock : Clock
    input reset : Reset
    output io : { flip we : UInt<1>, flip wi : UInt<1>, flip key : UInt<64>, flip din : UInt<64>, hit : UInt<1>, camCells : UInt<64>}

    wire write : UInt<1> @[cam.scala 57:19]
    node _write_T = and(io.we, io.wi) @[cam.scala 58:18]
    write <= _write_T @[cam.scala 58:9]
    reg camCells : UInt<64>, clock with :
      reset => (UInt<1>("h0"), camCells) @[cam.scala 59:21]
    when write : @[cam.scala 61:14]
      camCells <= io.din @[cam.scala 62:14]
    node _io_hit_T = eq(camCells, io.key) @[cam.scala 65:23]
    io.hit <= _io_hit_T @[cam.scala 65:10]
    io.camCells <= camCells @[cam.scala 66:15]

  module CAMLine_28 :
    input clock : Clock
    input reset : Reset
    output io : { flip we : UInt<1>, flip wi : UInt<1>, flip key : UInt<64>, flip din : UInt<64>, hit : UInt<1>, camCells : UInt<64>}

    wire write : UInt<1> @[cam.scala 57:19]
    node _write_T = and(io.we, io.wi) @[cam.scala 58:18]
    write <= _write_T @[cam.scala 58:9]
    reg camCells : UInt<64>, clock with :
      reset => (UInt<1>("h0"), camCells) @[cam.scala 59:21]
    when write : @[cam.scala 61:14]
      camCells <= io.din @[cam.scala 62:14]
    node _io_hit_T = eq(camCells, io.key) @[cam.scala 65:23]
    io.hit <= _io_hit_T @[cam.scala 65:10]
    io.camCells <= camCells @[cam.scala 66:15]

  module CAMLine_29 :
    input clock : Clock
    input reset : Reset
    output io : { flip we : UInt<1>, flip wi : UInt<1>, flip key : UInt<64>, flip din : UInt<64>, hit : UInt<1>, camCells : UInt<64>}

    wire write : UInt<1> @[cam.scala 57:19]
    node _write_T = and(io.we, io.wi) @[cam.scala 58:18]
    write <= _write_T @[cam.scala 58:9]
    reg camCells : UInt<64>, clock with :
      reset => (UInt<1>("h0"), camCells) @[cam.scala 59:21]
    when write : @[cam.scala 61:14]
      camCells <= io.din @[cam.scala 62:14]
    node _io_hit_T = eq(camCells, io.key) @[cam.scala 65:23]
    io.hit <= _io_hit_T @[cam.scala 65:10]
    io.camCells <= camCells @[cam.scala 66:15]

  module CAMLine_30 :
    input clock : Clock
    input reset : Reset
    output io : { flip we : UInt<1>, flip wi : UInt<1>, flip key : UInt<64>, flip din : UInt<64>, hit : UInt<1>, camCells : UInt<64>}

    wire write : UInt<1> @[cam.scala 57:19]
    node _write_T = and(io.we, io.wi) @[cam.scala 58:18]
    write <= _write_T @[cam.scala 58:9]
    reg camCells : UInt<64>, clock with :
      reset => (UInt<1>("h0"), camCells) @[cam.scala 59:21]
    when write : @[cam.scala 61:14]
      camCells <= io.din @[cam.scala 62:14]
    node _io_hit_T = eq(camCells, io.key) @[cam.scala 65:23]
    io.hit <= _io_hit_T @[cam.scala 65:10]
    io.camCells <= camCells @[cam.scala 66:15]

  module CAMLine_31 :
    input clock : Clock
    input reset : Reset
    output io : { flip we : UInt<1>, flip wi : UInt<1>, flip key : UInt<64>, flip din : UInt<64>, hit : UInt<1>, camCells : UInt<64>}

    wire write : UInt<1> @[cam.scala 57:19]
    node _write_T = and(io.we, io.wi) @[cam.scala 58:18]
    write <= _write_T @[cam.scala 58:9]
    reg camCells : UInt<64>, clock with :
      reset => (UInt<1>("h0"), camCells) @[cam.scala 59:21]
    when write : @[cam.scala 61:14]
      camCells <= io.din @[cam.scala 62:14]
    node _io_hit_T = eq(camCells, io.key) @[cam.scala 65:23]
    io.hit <= _io_hit_T @[cam.scala 65:10]
    io.camCells <= camCells @[cam.scala 66:15]

  module CAMLine_32 :
    input clock : Clock
    input reset : Reset
    output io : { flip we : UInt<1>, flip wi : UInt<1>, flip key : UInt<64>, flip din : UInt<64>, hit : UInt<1>, camCells : UInt<64>}

    wire write : UInt<1> @[cam.scala 57:19]
    node _write_T = and(io.we, io.wi) @[cam.scala 58:18]
    write <= _write_T @[cam.scala 58:9]
    reg camCells : UInt<64>, clock with :
      reset => (UInt<1>("h0"), camCells) @[cam.scala 59:21]
    when write : @[cam.scala 61:14]
      camCells <= io.din @[cam.scala 62:14]
    node _io_hit_T = eq(camCells, io.key) @[cam.scala 65:23]
    io.hit <= _io_hit_T @[cam.scala 65:10]
    io.camCells <= camCells @[cam.scala 66:15]

  module CAMLine_33 :
    input clock : Clock
    input reset : Reset
    output io : { flip we : UInt<1>, flip wi : UInt<1>, flip key : UInt<64>, flip din : UInt<64>, hit : UInt<1>, camCells : UInt<64>}

    wire write : UInt<1> @[cam.scala 57:19]
    node _write_T = and(io.we, io.wi) @[cam.scala 58:18]
    write <= _write_T @[cam.scala 58:9]
    reg camCells : UInt<64>, clock with :
      reset => (UInt<1>("h0"), camCells) @[cam.scala 59:21]
    when write : @[cam.scala 61:14]
      camCells <= io.din @[cam.scala 62:14]
    node _io_hit_T = eq(camCells, io.key) @[cam.scala 65:23]
    io.hit <= _io_hit_T @[cam.scala 65:10]
    io.camCells <= camCells @[cam.scala 66:15]

  module CAMLine_34 :
    input clock : Clock
    input reset : Reset
    output io : { flip we : UInt<1>, flip wi : UInt<1>, flip key : UInt<64>, flip din : UInt<64>, hit : UInt<1>, camCells : UInt<64>}

    wire write : UInt<1> @[cam.scala 57:19]
    node _write_T = and(io.we, io.wi) @[cam.scala 58:18]
    write <= _write_T @[cam.scala 58:9]
    reg camCells : UInt<64>, clock with :
      reset => (UInt<1>("h0"), camCells) @[cam.scala 59:21]
    when write : @[cam.scala 61:14]
      camCells <= io.din @[cam.scala 62:14]
    node _io_hit_T = eq(camCells, io.key) @[cam.scala 65:23]
    io.hit <= _io_hit_T @[cam.scala 65:10]
    io.camCells <= camCells @[cam.scala 66:15]

  module CAMLine_35 :
    input clock : Clock
    input reset : Reset
    output io : { flip we : UInt<1>, flip wi : UInt<1>, flip key : UInt<64>, flip din : UInt<64>, hit : UInt<1>, camCells : UInt<64>}

    wire write : UInt<1> @[cam.scala 57:19]
    node _write_T = and(io.we, io.wi) @[cam.scala 58:18]
    write <= _write_T @[cam.scala 58:9]
    reg camCells : UInt<64>, clock with :
      reset => (UInt<1>("h0"), camCells) @[cam.scala 59:21]
    when write : @[cam.scala 61:14]
      camCells <= io.din @[cam.scala 62:14]
    node _io_hit_T = eq(camCells, io.key) @[cam.scala 65:23]
    io.hit <= _io_hit_T @[cam.scala 65:10]
    io.camCells <= camCells @[cam.scala 66:15]

  module CAMLine_36 :
    input clock : Clock
    input reset : Reset
    output io : { flip we : UInt<1>, flip wi : UInt<1>, flip key : UInt<64>, flip din : UInt<64>, hit : UInt<1>, camCells : UInt<64>}

    wire write : UInt<1> @[cam.scala 57:19]
    node _write_T = and(io.we, io.wi) @[cam.scala 58:18]
    write <= _write_T @[cam.scala 58:9]
    reg camCells : UInt<64>, clock with :
      reset => (UInt<1>("h0"), camCells) @[cam.scala 59:21]
    when write : @[cam.scala 61:14]
      camCells <= io.din @[cam.scala 62:14]
    node _io_hit_T = eq(camCells, io.key) @[cam.scala 65:23]
    io.hit <= _io_hit_T @[cam.scala 65:10]
    io.camCells <= camCells @[cam.scala 66:15]

  module CAMLine_37 :
    input clock : Clock
    input reset : Reset
    output io : { flip we : UInt<1>, flip wi : UInt<1>, flip key : UInt<64>, flip din : UInt<64>, hit : UInt<1>, camCells : UInt<64>}

    wire write : UInt<1> @[cam.scala 57:19]
    node _write_T = and(io.we, io.wi) @[cam.scala 58:18]
    write <= _write_T @[cam.scala 58:9]
    reg camCells : UInt<64>, clock with :
      reset => (UInt<1>("h0"), camCells) @[cam.scala 59:21]
    when write : @[cam.scala 61:14]
      camCells <= io.din @[cam.scala 62:14]
    node _io_hit_T = eq(camCells, io.key) @[cam.scala 65:23]
    io.hit <= _io_hit_T @[cam.scala 65:10]
    io.camCells <= camCells @[cam.scala 66:15]

  module CAMLine_38 :
    input clock : Clock
    input reset : Reset
    output io : { flip we : UInt<1>, flip wi : UInt<1>, flip key : UInt<64>, flip din : UInt<64>, hit : UInt<1>, camCells : UInt<64>}

    wire write : UInt<1> @[cam.scala 57:19]
    node _write_T = and(io.we, io.wi) @[cam.scala 58:18]
    write <= _write_T @[cam.scala 58:9]
    reg camCells : UInt<64>, clock with :
      reset => (UInt<1>("h0"), camCells) @[cam.scala 59:21]
    when write : @[cam.scala 61:14]
      camCells <= io.din @[cam.scala 62:14]
    node _io_hit_T = eq(camCells, io.key) @[cam.scala 65:23]
    io.hit <= _io_hit_T @[cam.scala 65:10]
    io.camCells <= camCells @[cam.scala 66:15]

  module CAMLine_39 :
    input clock : Clock
    input reset : Reset
    output io : { flip we : UInt<1>, flip wi : UInt<1>, flip key : UInt<64>, flip din : UInt<64>, hit : UInt<1>, camCells : UInt<64>}

    wire write : UInt<1> @[cam.scala 57:19]
    node _write_T = and(io.we, io.wi) @[cam.scala 58:18]
    write <= _write_T @[cam.scala 58:9]
    reg camCells : UInt<64>, clock with :
      reset => (UInt<1>("h0"), camCells) @[cam.scala 59:21]
    when write : @[cam.scala 61:14]
      camCells <= io.din @[cam.scala 62:14]
    node _io_hit_T = eq(camCells, io.key) @[cam.scala 65:23]
    io.hit <= _io_hit_T @[cam.scala 65:10]
    io.camCells <= camCells @[cam.scala 66:15]

  module CAMLine_40 :
    input clock : Clock
    input reset : Reset
    output io : { flip we : UInt<1>, flip wi : UInt<1>, flip key : UInt<64>, flip din : UInt<64>, hit : UInt<1>, camCells : UInt<64>}

    wire write : UInt<1> @[cam.scala 57:19]
    node _write_T = and(io.we, io.wi) @[cam.scala 58:18]
    write <= _write_T @[cam.scala 58:9]
    reg camCells : UInt<64>, clock with :
      reset => (UInt<1>("h0"), camCells) @[cam.scala 59:21]
    when write : @[cam.scala 61:14]
      camCells <= io.din @[cam.scala 62:14]
    node _io_hit_T = eq(camCells, io.key) @[cam.scala 65:23]
    io.hit <= _io_hit_T @[cam.scala 65:10]
    io.camCells <= camCells @[cam.scala 66:15]

  module CAMLine_41 :
    input clock : Clock
    input reset : Reset
    output io : { flip we : UInt<1>, flip wi : UInt<1>, flip key : UInt<64>, flip din : UInt<64>, hit : UInt<1>, camCells : UInt<64>}

    wire write : UInt<1> @[cam.scala 57:19]
    node _write_T = and(io.we, io.wi) @[cam.scala 58:18]
    write <= _write_T @[cam.scala 58:9]
    reg camCells : UInt<64>, clock with :
      reset => (UInt<1>("h0"), camCells) @[cam.scala 59:21]
    when write : @[cam.scala 61:14]
      camCells <= io.din @[cam.scala 62:14]
    node _io_hit_T = eq(camCells, io.key) @[cam.scala 65:23]
    io.hit <= _io_hit_T @[cam.scala 65:10]
    io.camCells <= camCells @[cam.scala 66:15]

  module CAMLine_42 :
    input clock : Clock
    input reset : Reset
    output io : { flip we : UInt<1>, flip wi : UInt<1>, flip key : UInt<64>, flip din : UInt<64>, hit : UInt<1>, camCells : UInt<64>}

    wire write : UInt<1> @[cam.scala 57:19]
    node _write_T = and(io.we, io.wi) @[cam.scala 58:18]
    write <= _write_T @[cam.scala 58:9]
    reg camCells : UInt<64>, clock with :
      reset => (UInt<1>("h0"), camCells) @[cam.scala 59:21]
    when write : @[cam.scala 61:14]
      camCells <= io.din @[cam.scala 62:14]
    node _io_hit_T = eq(camCells, io.key) @[cam.scala 65:23]
    io.hit <= _io_hit_T @[cam.scala 65:10]
    io.camCells <= camCells @[cam.scala 66:15]

  module CAMLine_43 :
    input clock : Clock
    input reset : Reset
    output io : { flip we : UInt<1>, flip wi : UInt<1>, flip key : UInt<64>, flip din : UInt<64>, hit : UInt<1>, camCells : UInt<64>}

    wire write : UInt<1> @[cam.scala 57:19]
    node _write_T = and(io.we, io.wi) @[cam.scala 58:18]
    write <= _write_T @[cam.scala 58:9]
    reg camCells : UInt<64>, clock with :
      reset => (UInt<1>("h0"), camCells) @[cam.scala 59:21]
    when write : @[cam.scala 61:14]
      camCells <= io.din @[cam.scala 62:14]
    node _io_hit_T = eq(camCells, io.key) @[cam.scala 65:23]
    io.hit <= _io_hit_T @[cam.scala 65:10]
    io.camCells <= camCells @[cam.scala 66:15]

  module CAMLine_44 :
    input clock : Clock
    input reset : Reset
    output io : { flip we : UInt<1>, flip wi : UInt<1>, flip key : UInt<64>, flip din : UInt<64>, hit : UInt<1>, camCells : UInt<64>}

    wire write : UInt<1> @[cam.scala 57:19]
    node _write_T = and(io.we, io.wi) @[cam.scala 58:18]
    write <= _write_T @[cam.scala 58:9]
    reg camCells : UInt<64>, clock with :
      reset => (UInt<1>("h0"), camCells) @[cam.scala 59:21]
    when write : @[cam.scala 61:14]
      camCells <= io.din @[cam.scala 62:14]
    node _io_hit_T = eq(camCells, io.key) @[cam.scala 65:23]
    io.hit <= _io_hit_T @[cam.scala 65:10]
    io.camCells <= camCells @[cam.scala 66:15]

  module CAMLine_45 :
    input clock : Clock
    input reset : Reset
    output io : { flip we : UInt<1>, flip wi : UInt<1>, flip key : UInt<64>, flip din : UInt<64>, hit : UInt<1>, camCells : UInt<64>}

    wire write : UInt<1> @[cam.scala 57:19]
    node _write_T = and(io.we, io.wi) @[cam.scala 58:18]
    write <= _write_T @[cam.scala 58:9]
    reg camCells : UInt<64>, clock with :
      reset => (UInt<1>("h0"), camCells) @[cam.scala 59:21]
    when write : @[cam.scala 61:14]
      camCells <= io.din @[cam.scala 62:14]
    node _io_hit_T = eq(camCells, io.key) @[cam.scala 65:23]
    io.hit <= _io_hit_T @[cam.scala 65:10]
    io.camCells <= camCells @[cam.scala 66:15]

  module CAMLine_46 :
    input clock : Clock
    input reset : Reset
    output io : { flip we : UInt<1>, flip wi : UInt<1>, flip key : UInt<64>, flip din : UInt<64>, hit : UInt<1>, camCells : UInt<64>}

    wire write : UInt<1> @[cam.scala 57:19]
    node _write_T = and(io.we, io.wi) @[cam.scala 58:18]
    write <= _write_T @[cam.scala 58:9]
    reg camCells : UInt<64>, clock with :
      reset => (UInt<1>("h0"), camCells) @[cam.scala 59:21]
    when write : @[cam.scala 61:14]
      camCells <= io.din @[cam.scala 62:14]
    node _io_hit_T = eq(camCells, io.key) @[cam.scala 65:23]
    io.hit <= _io_hit_T @[cam.scala 65:10]
    io.camCells <= camCells @[cam.scala 66:15]

  module CAMLine_47 :
    input clock : Clock
    input reset : Reset
    output io : { flip we : UInt<1>, flip wi : UInt<1>, flip key : UInt<64>, flip din : UInt<64>, hit : UInt<1>, camCells : UInt<64>}

    wire write : UInt<1> @[cam.scala 57:19]
    node _write_T = and(io.we, io.wi) @[cam.scala 58:18]
    write <= _write_T @[cam.scala 58:9]
    reg camCells : UInt<64>, clock with :
      reset => (UInt<1>("h0"), camCells) @[cam.scala 59:21]
    when write : @[cam.scala 61:14]
      camCells <= io.din @[cam.scala 62:14]
    node _io_hit_T = eq(camCells, io.key) @[cam.scala 65:23]
    io.hit <= _io_hit_T @[cam.scala 65:10]
    io.camCells <= camCells @[cam.scala 66:15]

  module CAMLine_48 :
    input clock : Clock
    input reset : Reset
    output io : { flip we : UInt<1>, flip wi : UInt<1>, flip key : UInt<64>, flip din : UInt<64>, hit : UInt<1>, camCells : UInt<64>}

    wire write : UInt<1> @[cam.scala 57:19]
    node _write_T = and(io.we, io.wi) @[cam.scala 58:18]
    write <= _write_T @[cam.scala 58:9]
    reg camCells : UInt<64>, clock with :
      reset => (UInt<1>("h0"), camCells) @[cam.scala 59:21]
    when write : @[cam.scala 61:14]
      camCells <= io.din @[cam.scala 62:14]
    node _io_hit_T = eq(camCells, io.key) @[cam.scala 65:23]
    io.hit <= _io_hit_T @[cam.scala 65:10]
    io.camCells <= camCells @[cam.scala 66:15]

  module CAMLine_49 :
    input clock : Clock
    input reset : Reset
    output io : { flip we : UInt<1>, flip wi : UInt<1>, flip key : UInt<64>, flip din : UInt<64>, hit : UInt<1>, camCells : UInt<64>}

    wire write : UInt<1> @[cam.scala 57:19]
    node _write_T = and(io.we, io.wi) @[cam.scala 58:18]
    write <= _write_T @[cam.scala 58:9]
    reg camCells : UInt<64>, clock with :
      reset => (UInt<1>("h0"), camCells) @[cam.scala 59:21]
    when write : @[cam.scala 61:14]
      camCells <= io.din @[cam.scala 62:14]
    node _io_hit_T = eq(camCells, io.key) @[cam.scala 65:23]
    io.hit <= _io_hit_T @[cam.scala 65:10]
    io.camCells <= camCells @[cam.scala 66:15]

  module CAMLine_50 :
    input clock : Clock
    input reset : Reset
    output io : { flip we : UInt<1>, flip wi : UInt<1>, flip key : UInt<64>, flip din : UInt<64>, hit : UInt<1>, camCells : UInt<64>}

    wire write : UInt<1> @[cam.scala 57:19]
    node _write_T = and(io.we, io.wi) @[cam.scala 58:18]
    write <= _write_T @[cam.scala 58:9]
    reg camCells : UInt<64>, clock with :
      reset => (UInt<1>("h0"), camCells) @[cam.scala 59:21]
    when write : @[cam.scala 61:14]
      camCells <= io.din @[cam.scala 62:14]
    node _io_hit_T = eq(camCells, io.key) @[cam.scala 65:23]
    io.hit <= _io_hit_T @[cam.scala 65:10]
    io.camCells <= camCells @[cam.scala 66:15]

  module CAMLine_51 :
    input clock : Clock
    input reset : Reset
    output io : { flip we : UInt<1>, flip wi : UInt<1>, flip key : UInt<64>, flip din : UInt<64>, hit : UInt<1>, camCells : UInt<64>}

    wire write : UInt<1> @[cam.scala 57:19]
    node _write_T = and(io.we, io.wi) @[cam.scala 58:18]
    write <= _write_T @[cam.scala 58:9]
    reg camCells : UInt<64>, clock with :
      reset => (UInt<1>("h0"), camCells) @[cam.scala 59:21]
    when write : @[cam.scala 61:14]
      camCells <= io.din @[cam.scala 62:14]
    node _io_hit_T = eq(camCells, io.key) @[cam.scala 65:23]
    io.hit <= _io_hit_T @[cam.scala 65:10]
    io.camCells <= camCells @[cam.scala 66:15]

  module CAMLine_52 :
    input clock : Clock
    input reset : Reset
    output io : { flip we : UInt<1>, flip wi : UInt<1>, flip key : UInt<64>, flip din : UInt<64>, hit : UInt<1>, camCells : UInt<64>}

    wire write : UInt<1> @[cam.scala 57:19]
    node _write_T = and(io.we, io.wi) @[cam.scala 58:18]
    write <= _write_T @[cam.scala 58:9]
    reg camCells : UInt<64>, clock with :
      reset => (UInt<1>("h0"), camCells) @[cam.scala 59:21]
    when write : @[cam.scala 61:14]
      camCells <= io.din @[cam.scala 62:14]
    node _io_hit_T = eq(camCells, io.key) @[cam.scala 65:23]
    io.hit <= _io_hit_T @[cam.scala 65:10]
    io.camCells <= camCells @[cam.scala 66:15]

  module CAMLine_53 :
    input clock : Clock
    input reset : Reset
    output io : { flip we : UInt<1>, flip wi : UInt<1>, flip key : UInt<64>, flip din : UInt<64>, hit : UInt<1>, camCells : UInt<64>}

    wire write : UInt<1> @[cam.scala 57:19]
    node _write_T = and(io.we, io.wi) @[cam.scala 58:18]
    write <= _write_T @[cam.scala 58:9]
    reg camCells : UInt<64>, clock with :
      reset => (UInt<1>("h0"), camCells) @[cam.scala 59:21]
    when write : @[cam.scala 61:14]
      camCells <= io.din @[cam.scala 62:14]
    node _io_hit_T = eq(camCells, io.key) @[cam.scala 65:23]
    io.hit <= _io_hit_T @[cam.scala 65:10]
    io.camCells <= camCells @[cam.scala 66:15]

  module CAMLine_54 :
    input clock : Clock
    input reset : Reset
    output io : { flip we : UInt<1>, flip wi : UInt<1>, flip key : UInt<64>, flip din : UInt<64>, hit : UInt<1>, camCells : UInt<64>}

    wire write : UInt<1> @[cam.scala 57:19]
    node _write_T = and(io.we, io.wi) @[cam.scala 58:18]
    write <= _write_T @[cam.scala 58:9]
    reg camCells : UInt<64>, clock with :
      reset => (UInt<1>("h0"), camCells) @[cam.scala 59:21]
    when write : @[cam.scala 61:14]
      camCells <= io.din @[cam.scala 62:14]
    node _io_hit_T = eq(camCells, io.key) @[cam.scala 65:23]
    io.hit <= _io_hit_T @[cam.scala 65:10]
    io.camCells <= camCells @[cam.scala 66:15]

  module CAMLine_55 :
    input clock : Clock
    input reset : Reset
    output io : { flip we : UInt<1>, flip wi : UInt<1>, flip key : UInt<64>, flip din : UInt<64>, hit : UInt<1>, camCells : UInt<64>}

    wire write : UInt<1> @[cam.scala 57:19]
    node _write_T = and(io.we, io.wi) @[cam.scala 58:18]
    write <= _write_T @[cam.scala 58:9]
    reg camCells : UInt<64>, clock with :
      reset => (UInt<1>("h0"), camCells) @[cam.scala 59:21]
    when write : @[cam.scala 61:14]
      camCells <= io.din @[cam.scala 62:14]
    node _io_hit_T = eq(camCells, io.key) @[cam.scala 65:23]
    io.hit <= _io_hit_T @[cam.scala 65:10]
    io.camCells <= camCells @[cam.scala 66:15]

  module CAMLine_56 :
    input clock : Clock
    input reset : Reset
    output io : { flip we : UInt<1>, flip wi : UInt<1>, flip key : UInt<64>, flip din : UInt<64>, hit : UInt<1>, camCells : UInt<64>}

    wire write : UInt<1> @[cam.scala 57:19]
    node _write_T = and(io.we, io.wi) @[cam.scala 58:18]
    write <= _write_T @[cam.scala 58:9]
    reg camCells : UInt<64>, clock with :
      reset => (UInt<1>("h0"), camCells) @[cam.scala 59:21]
    when write : @[cam.scala 61:14]
      camCells <= io.din @[cam.scala 62:14]
    node _io_hit_T = eq(camCells, io.key) @[cam.scala 65:23]
    io.hit <= _io_hit_T @[cam.scala 65:10]
    io.camCells <= camCells @[cam.scala 66:15]

  module CAMLine_57 :
    input clock : Clock
    input reset : Reset
    output io : { flip we : UInt<1>, flip wi : UInt<1>, flip key : UInt<64>, flip din : UInt<64>, hit : UInt<1>, camCells : UInt<64>}

    wire write : UInt<1> @[cam.scala 57:19]
    node _write_T = and(io.we, io.wi) @[cam.scala 58:18]
    write <= _write_T @[cam.scala 58:9]
    reg camCells : UInt<64>, clock with :
      reset => (UInt<1>("h0"), camCells) @[cam.scala 59:21]
    when write : @[cam.scala 61:14]
      camCells <= io.din @[cam.scala 62:14]
    node _io_hit_T = eq(camCells, io.key) @[cam.scala 65:23]
    io.hit <= _io_hit_T @[cam.scala 65:10]
    io.camCells <= camCells @[cam.scala 66:15]

  module CAMLine_58 :
    input clock : Clock
    input reset : Reset
    output io : { flip we : UInt<1>, flip wi : UInt<1>, flip key : UInt<64>, flip din : UInt<64>, hit : UInt<1>, camCells : UInt<64>}

    wire write : UInt<1> @[cam.scala 57:19]
    node _write_T = and(io.we, io.wi) @[cam.scala 58:18]
    write <= _write_T @[cam.scala 58:9]
    reg camCells : UInt<64>, clock with :
      reset => (UInt<1>("h0"), camCells) @[cam.scala 59:21]
    when write : @[cam.scala 61:14]
      camCells <= io.din @[cam.scala 62:14]
    node _io_hit_T = eq(camCells, io.key) @[cam.scala 65:23]
    io.hit <= _io_hit_T @[cam.scala 65:10]
    io.camCells <= camCells @[cam.scala 66:15]

  module CAMLine_59 :
    input clock : Clock
    input reset : Reset
    output io : { flip we : UInt<1>, flip wi : UInt<1>, flip key : UInt<64>, flip din : UInt<64>, hit : UInt<1>, camCells : UInt<64>}

    wire write : UInt<1> @[cam.scala 57:19]
    node _write_T = and(io.we, io.wi) @[cam.scala 58:18]
    write <= _write_T @[cam.scala 58:9]
    reg camCells : UInt<64>, clock with :
      reset => (UInt<1>("h0"), camCells) @[cam.scala 59:21]
    when write : @[cam.scala 61:14]
      camCells <= io.din @[cam.scala 62:14]
    node _io_hit_T = eq(camCells, io.key) @[cam.scala 65:23]
    io.hit <= _io_hit_T @[cam.scala 65:10]
    io.camCells <= camCells @[cam.scala 66:15]

  module CAMLine_60 :
    input clock : Clock
    input reset : Reset
    output io : { flip we : UInt<1>, flip wi : UInt<1>, flip key : UInt<64>, flip din : UInt<64>, hit : UInt<1>, camCells : UInt<64>}

    wire write : UInt<1> @[cam.scala 57:19]
    node _write_T = and(io.we, io.wi) @[cam.scala 58:18]
    write <= _write_T @[cam.scala 58:9]
    reg camCells : UInt<64>, clock with :
      reset => (UInt<1>("h0"), camCells) @[cam.scala 59:21]
    when write : @[cam.scala 61:14]
      camCells <= io.din @[cam.scala 62:14]
    node _io_hit_T = eq(camCells, io.key) @[cam.scala 65:23]
    io.hit <= _io_hit_T @[cam.scala 65:10]
    io.camCells <= camCells @[cam.scala 66:15]

  module CAMLine_61 :
    input clock : Clock
    input reset : Reset
    output io : { flip we : UInt<1>, flip wi : UInt<1>, flip key : UInt<64>, flip din : UInt<64>, hit : UInt<1>, camCells : UInt<64>}

    wire write : UInt<1> @[cam.scala 57:19]
    node _write_T = and(io.we, io.wi) @[cam.scala 58:18]
    write <= _write_T @[cam.scala 58:9]
    reg camCells : UInt<64>, clock with :
      reset => (UInt<1>("h0"), camCells) @[cam.scala 59:21]
    when write : @[cam.scala 61:14]
      camCells <= io.din @[cam.scala 62:14]
    node _io_hit_T = eq(camCells, io.key) @[cam.scala 65:23]
    io.hit <= _io_hit_T @[cam.scala 65:10]
    io.camCells <= camCells @[cam.scala 66:15]

  module CAMLine_62 :
    input clock : Clock
    input reset : Reset
    output io : { flip we : UInt<1>, flip wi : UInt<1>, flip key : UInt<64>, flip din : UInt<64>, hit : UInt<1>, camCells : UInt<64>}

    wire write : UInt<1> @[cam.scala 57:19]
    node _write_T = and(io.we, io.wi) @[cam.scala 58:18]
    write <= _write_T @[cam.scala 58:9]
    reg camCells : UInt<64>, clock with :
      reset => (UInt<1>("h0"), camCells) @[cam.scala 59:21]
    when write : @[cam.scala 61:14]
      camCells <= io.din @[cam.scala 62:14]
    node _io_hit_T = eq(camCells, io.key) @[cam.scala 65:23]
    io.hit <= _io_hit_T @[cam.scala 65:10]
    io.camCells <= camCells @[cam.scala 66:15]

  module CAMLine_63 :
    input clock : Clock
    input reset : Reset
    output io : { flip we : UInt<1>, flip wi : UInt<1>, flip key : UInt<64>, flip din : UInt<64>, hit : UInt<1>, camCells : UInt<64>}

    wire write : UInt<1> @[cam.scala 57:19]
    node _write_T = and(io.we, io.wi) @[cam.scala 58:18]
    write <= _write_T @[cam.scala 58:9]
    reg camCells : UInt<64>, clock with :
      reset => (UInt<1>("h0"), camCells) @[cam.scala 59:21]
    when write : @[cam.scala 61:14]
      camCells <= io.din @[cam.scala 62:14]
    node _io_hit_T = eq(camCells, io.key) @[cam.scala 65:23]
    io.hit <= _io_hit_T @[cam.scala 65:10]
    io.camCells <= camCells @[cam.scala 66:15]

  module CAM_m_n :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip we : UInt<1>, flip key : UInt<64>, flip din : UInt<64>, flip waddr : UInt<64>, hit : UInt<1>}

    inst CAMLine of CAMLine @[cam.scala 81:36]
    CAMLine.clock <= clock
    CAMLine.reset <= reset
    inst CAMLine_1 of CAMLine_1 @[cam.scala 81:36]
    CAMLine_1.clock <= clock
    CAMLine_1.reset <= reset
    inst CAMLine_2 of CAMLine_2 @[cam.scala 81:36]
    CAMLine_2.clock <= clock
    CAMLine_2.reset <= reset
    inst CAMLine_3 of CAMLine_3 @[cam.scala 81:36]
    CAMLine_3.clock <= clock
    CAMLine_3.reset <= reset
    inst CAMLine_4 of CAMLine_4 @[cam.scala 81:36]
    CAMLine_4.clock <= clock
    CAMLine_4.reset <= reset
    inst CAMLine_5 of CAMLine_5 @[cam.scala 81:36]
    CAMLine_5.clock <= clock
    CAMLine_5.reset <= reset
    inst CAMLine_6 of CAMLine_6 @[cam.scala 81:36]
    CAMLine_6.clock <= clock
    CAMLine_6.reset <= reset
    inst CAMLine_7 of CAMLine_7 @[cam.scala 81:36]
    CAMLine_7.clock <= clock
    CAMLine_7.reset <= reset
    inst CAMLine_8 of CAMLine_8 @[cam.scala 81:36]
    CAMLine_8.clock <= clock
    CAMLine_8.reset <= reset
    inst CAMLine_9 of CAMLine_9 @[cam.scala 81:36]
    CAMLine_9.clock <= clock
    CAMLine_9.reset <= reset
    inst CAMLine_10 of CAMLine_10 @[cam.scala 81:36]
    CAMLine_10.clock <= clock
    CAMLine_10.reset <= reset
    inst CAMLine_11 of CAMLine_11 @[cam.scala 81:36]
    CAMLine_11.clock <= clock
    CAMLine_11.reset <= reset
    inst CAMLine_12 of CAMLine_12 @[cam.scala 81:36]
    CAMLine_12.clock <= clock
    CAMLine_12.reset <= reset
    inst CAMLine_13 of CAMLine_13 @[cam.scala 81:36]
    CAMLine_13.clock <= clock
    CAMLine_13.reset <= reset
    inst CAMLine_14 of CAMLine_14 @[cam.scala 81:36]
    CAMLine_14.clock <= clock
    CAMLine_14.reset <= reset
    inst CAMLine_15 of CAMLine_15 @[cam.scala 81:36]
    CAMLine_15.clock <= clock
    CAMLine_15.reset <= reset
    inst CAMLine_16 of CAMLine_16 @[cam.scala 81:36]
    CAMLine_16.clock <= clock
    CAMLine_16.reset <= reset
    inst CAMLine_17 of CAMLine_17 @[cam.scala 81:36]
    CAMLine_17.clock <= clock
    CAMLine_17.reset <= reset
    inst CAMLine_18 of CAMLine_18 @[cam.scala 81:36]
    CAMLine_18.clock <= clock
    CAMLine_18.reset <= reset
    inst CAMLine_19 of CAMLine_19 @[cam.scala 81:36]
    CAMLine_19.clock <= clock
    CAMLine_19.reset <= reset
    inst CAMLine_20 of CAMLine_20 @[cam.scala 81:36]
    CAMLine_20.clock <= clock
    CAMLine_20.reset <= reset
    inst CAMLine_21 of CAMLine_21 @[cam.scala 81:36]
    CAMLine_21.clock <= clock
    CAMLine_21.reset <= reset
    inst CAMLine_22 of CAMLine_22 @[cam.scala 81:36]
    CAMLine_22.clock <= clock
    CAMLine_22.reset <= reset
    inst CAMLine_23 of CAMLine_23 @[cam.scala 81:36]
    CAMLine_23.clock <= clock
    CAMLine_23.reset <= reset
    inst CAMLine_24 of CAMLine_24 @[cam.scala 81:36]
    CAMLine_24.clock <= clock
    CAMLine_24.reset <= reset
    inst CAMLine_25 of CAMLine_25 @[cam.scala 81:36]
    CAMLine_25.clock <= clock
    CAMLine_25.reset <= reset
    inst CAMLine_26 of CAMLine_26 @[cam.scala 81:36]
    CAMLine_26.clock <= clock
    CAMLine_26.reset <= reset
    inst CAMLine_27 of CAMLine_27 @[cam.scala 81:36]
    CAMLine_27.clock <= clock
    CAMLine_27.reset <= reset
    inst CAMLine_28 of CAMLine_28 @[cam.scala 81:36]
    CAMLine_28.clock <= clock
    CAMLine_28.reset <= reset
    inst CAMLine_29 of CAMLine_29 @[cam.scala 81:36]
    CAMLine_29.clock <= clock
    CAMLine_29.reset <= reset
    inst CAMLine_30 of CAMLine_30 @[cam.scala 81:36]
    CAMLine_30.clock <= clock
    CAMLine_30.reset <= reset
    inst CAMLine_31 of CAMLine_31 @[cam.scala 81:36]
    CAMLine_31.clock <= clock
    CAMLine_31.reset <= reset
    inst CAMLine_32 of CAMLine_32 @[cam.scala 81:36]
    CAMLine_32.clock <= clock
    CAMLine_32.reset <= reset
    inst CAMLine_33 of CAMLine_33 @[cam.scala 81:36]
    CAMLine_33.clock <= clock
    CAMLine_33.reset <= reset
    inst CAMLine_34 of CAMLine_34 @[cam.scala 81:36]
    CAMLine_34.clock <= clock
    CAMLine_34.reset <= reset
    inst CAMLine_35 of CAMLine_35 @[cam.scala 81:36]
    CAMLine_35.clock <= clock
    CAMLine_35.reset <= reset
    inst CAMLine_36 of CAMLine_36 @[cam.scala 81:36]
    CAMLine_36.clock <= clock
    CAMLine_36.reset <= reset
    inst CAMLine_37 of CAMLine_37 @[cam.scala 81:36]
    CAMLine_37.clock <= clock
    CAMLine_37.reset <= reset
    inst CAMLine_38 of CAMLine_38 @[cam.scala 81:36]
    CAMLine_38.clock <= clock
    CAMLine_38.reset <= reset
    inst CAMLine_39 of CAMLine_39 @[cam.scala 81:36]
    CAMLine_39.clock <= clock
    CAMLine_39.reset <= reset
    inst CAMLine_40 of CAMLine_40 @[cam.scala 81:36]
    CAMLine_40.clock <= clock
    CAMLine_40.reset <= reset
    inst CAMLine_41 of CAMLine_41 @[cam.scala 81:36]
    CAMLine_41.clock <= clock
    CAMLine_41.reset <= reset
    inst CAMLine_42 of CAMLine_42 @[cam.scala 81:36]
    CAMLine_42.clock <= clock
    CAMLine_42.reset <= reset
    inst CAMLine_43 of CAMLine_43 @[cam.scala 81:36]
    CAMLine_43.clock <= clock
    CAMLine_43.reset <= reset
    inst CAMLine_44 of CAMLine_44 @[cam.scala 81:36]
    CAMLine_44.clock <= clock
    CAMLine_44.reset <= reset
    inst CAMLine_45 of CAMLine_45 @[cam.scala 81:36]
    CAMLine_45.clock <= clock
    CAMLine_45.reset <= reset
    inst CAMLine_46 of CAMLine_46 @[cam.scala 81:36]
    CAMLine_46.clock <= clock
    CAMLine_46.reset <= reset
    inst CAMLine_47 of CAMLine_47 @[cam.scala 81:36]
    CAMLine_47.clock <= clock
    CAMLine_47.reset <= reset
    inst CAMLine_48 of CAMLine_48 @[cam.scala 81:36]
    CAMLine_48.clock <= clock
    CAMLine_48.reset <= reset
    inst CAMLine_49 of CAMLine_49 @[cam.scala 81:36]
    CAMLine_49.clock <= clock
    CAMLine_49.reset <= reset
    inst CAMLine_50 of CAMLine_50 @[cam.scala 81:36]
    CAMLine_50.clock <= clock
    CAMLine_50.reset <= reset
    inst CAMLine_51 of CAMLine_51 @[cam.scala 81:36]
    CAMLine_51.clock <= clock
    CAMLine_51.reset <= reset
    inst CAMLine_52 of CAMLine_52 @[cam.scala 81:36]
    CAMLine_52.clock <= clock
    CAMLine_52.reset <= reset
    inst CAMLine_53 of CAMLine_53 @[cam.scala 81:36]
    CAMLine_53.clock <= clock
    CAMLine_53.reset <= reset
    inst CAMLine_54 of CAMLine_54 @[cam.scala 81:36]
    CAMLine_54.clock <= clock
    CAMLine_54.reset <= reset
    inst CAMLine_55 of CAMLine_55 @[cam.scala 81:36]
    CAMLine_55.clock <= clock
    CAMLine_55.reset <= reset
    inst CAMLine_56 of CAMLine_56 @[cam.scala 81:36]
    CAMLine_56.clock <= clock
    CAMLine_56.reset <= reset
    inst CAMLine_57 of CAMLine_57 @[cam.scala 81:36]
    CAMLine_57.clock <= clock
    CAMLine_57.reset <= reset
    inst CAMLine_58 of CAMLine_58 @[cam.scala 81:36]
    CAMLine_58.clock <= clock
    CAMLine_58.reset <= reset
    inst CAMLine_59 of CAMLine_59 @[cam.scala 81:36]
    CAMLine_59.clock <= clock
    CAMLine_59.reset <= reset
    inst CAMLine_60 of CAMLine_60 @[cam.scala 81:36]
    CAMLine_60.clock <= clock
    CAMLine_60.reset <= reset
    inst CAMLine_61 of CAMLine_61 @[cam.scala 81:36]
    CAMLine_61.clock <= clock
    CAMLine_61.reset <= reset
    inst CAMLine_62 of CAMLine_62 @[cam.scala 81:36]
    CAMLine_62.clock <= clock
    CAMLine_62.reset <= reset
    inst CAMLine_63 of CAMLine_63 @[cam.scala 81:36]
    CAMLine_63.clock <= clock
    CAMLine_63.reset <= reset
    CAMLine.io.we <= io.we @[cam.scala 85:20]
    node _T = bits(io.waddr, 0, 0) @[cam.scala 86:31]
    CAMLine.io.wi <= _T @[cam.scala 86:20]
    CAMLine.io.key <= io.key @[cam.scala 87:21]
    CAMLine.io.din <= io.din @[cam.scala 88:21]
    CAMLine_1.io.we <= io.we @[cam.scala 85:20]
    node _T_1 = bits(io.waddr, 1, 1) @[cam.scala 86:31]
    CAMLine_1.io.wi <= _T_1 @[cam.scala 86:20]
    CAMLine_1.io.key <= io.key @[cam.scala 87:21]
    CAMLine_1.io.din <= io.din @[cam.scala 88:21]
    CAMLine_2.io.we <= io.we @[cam.scala 85:20]
    node _T_2 = bits(io.waddr, 2, 2) @[cam.scala 86:31]
    CAMLine_2.io.wi <= _T_2 @[cam.scala 86:20]
    CAMLine_2.io.key <= io.key @[cam.scala 87:21]
    CAMLine_2.io.din <= io.din @[cam.scala 88:21]
    CAMLine_3.io.we <= io.we @[cam.scala 85:20]
    node _T_3 = bits(io.waddr, 3, 3) @[cam.scala 86:31]
    CAMLine_3.io.wi <= _T_3 @[cam.scala 86:20]
    CAMLine_3.io.key <= io.key @[cam.scala 87:21]
    CAMLine_3.io.din <= io.din @[cam.scala 88:21]
    CAMLine_4.io.we <= io.we @[cam.scala 85:20]
    node _T_4 = bits(io.waddr, 4, 4) @[cam.scala 86:31]
    CAMLine_4.io.wi <= _T_4 @[cam.scala 86:20]
    CAMLine_4.io.key <= io.key @[cam.scala 87:21]
    CAMLine_4.io.din <= io.din @[cam.scala 88:21]
    CAMLine_5.io.we <= io.we @[cam.scala 85:20]
    node _T_5 = bits(io.waddr, 5, 5) @[cam.scala 86:31]
    CAMLine_5.io.wi <= _T_5 @[cam.scala 86:20]
    CAMLine_5.io.key <= io.key @[cam.scala 87:21]
    CAMLine_5.io.din <= io.din @[cam.scala 88:21]
    CAMLine_6.io.we <= io.we @[cam.scala 85:20]
    node _T_6 = bits(io.waddr, 6, 6) @[cam.scala 86:31]
    CAMLine_6.io.wi <= _T_6 @[cam.scala 86:20]
    CAMLine_6.io.key <= io.key @[cam.scala 87:21]
    CAMLine_6.io.din <= io.din @[cam.scala 88:21]
    CAMLine_7.io.we <= io.we @[cam.scala 85:20]
    node _T_7 = bits(io.waddr, 7, 7) @[cam.scala 86:31]
    CAMLine_7.io.wi <= _T_7 @[cam.scala 86:20]
    CAMLine_7.io.key <= io.key @[cam.scala 87:21]
    CAMLine_7.io.din <= io.din @[cam.scala 88:21]
    CAMLine_8.io.we <= io.we @[cam.scala 85:20]
    node _T_8 = bits(io.waddr, 8, 8) @[cam.scala 86:31]
    CAMLine_8.io.wi <= _T_8 @[cam.scala 86:20]
    CAMLine_8.io.key <= io.key @[cam.scala 87:21]
    CAMLine_8.io.din <= io.din @[cam.scala 88:21]
    CAMLine_9.io.we <= io.we @[cam.scala 85:20]
    node _T_9 = bits(io.waddr, 9, 9) @[cam.scala 86:31]
    CAMLine_9.io.wi <= _T_9 @[cam.scala 86:20]
    CAMLine_9.io.key <= io.key @[cam.scala 87:21]
    CAMLine_9.io.din <= io.din @[cam.scala 88:21]
    CAMLine_10.io.we <= io.we @[cam.scala 85:20]
    node _T_10 = bits(io.waddr, 10, 10) @[cam.scala 86:31]
    CAMLine_10.io.wi <= _T_10 @[cam.scala 86:20]
    CAMLine_10.io.key <= io.key @[cam.scala 87:21]
    CAMLine_10.io.din <= io.din @[cam.scala 88:21]
    CAMLine_11.io.we <= io.we @[cam.scala 85:20]
    node _T_11 = bits(io.waddr, 11, 11) @[cam.scala 86:31]
    CAMLine_11.io.wi <= _T_11 @[cam.scala 86:20]
    CAMLine_11.io.key <= io.key @[cam.scala 87:21]
    CAMLine_11.io.din <= io.din @[cam.scala 88:21]
    CAMLine_12.io.we <= io.we @[cam.scala 85:20]
    node _T_12 = bits(io.waddr, 12, 12) @[cam.scala 86:31]
    CAMLine_12.io.wi <= _T_12 @[cam.scala 86:20]
    CAMLine_12.io.key <= io.key @[cam.scala 87:21]
    CAMLine_12.io.din <= io.din @[cam.scala 88:21]
    CAMLine_13.io.we <= io.we @[cam.scala 85:20]
    node _T_13 = bits(io.waddr, 13, 13) @[cam.scala 86:31]
    CAMLine_13.io.wi <= _T_13 @[cam.scala 86:20]
    CAMLine_13.io.key <= io.key @[cam.scala 87:21]
    CAMLine_13.io.din <= io.din @[cam.scala 88:21]
    CAMLine_14.io.we <= io.we @[cam.scala 85:20]
    node _T_14 = bits(io.waddr, 14, 14) @[cam.scala 86:31]
    CAMLine_14.io.wi <= _T_14 @[cam.scala 86:20]
    CAMLine_14.io.key <= io.key @[cam.scala 87:21]
    CAMLine_14.io.din <= io.din @[cam.scala 88:21]
    CAMLine_15.io.we <= io.we @[cam.scala 85:20]
    node _T_15 = bits(io.waddr, 15, 15) @[cam.scala 86:31]
    CAMLine_15.io.wi <= _T_15 @[cam.scala 86:20]
    CAMLine_15.io.key <= io.key @[cam.scala 87:21]
    CAMLine_15.io.din <= io.din @[cam.scala 88:21]
    CAMLine_16.io.we <= io.we @[cam.scala 85:20]
    node _T_16 = bits(io.waddr, 16, 16) @[cam.scala 86:31]
    CAMLine_16.io.wi <= _T_16 @[cam.scala 86:20]
    CAMLine_16.io.key <= io.key @[cam.scala 87:21]
    CAMLine_16.io.din <= io.din @[cam.scala 88:21]
    CAMLine_17.io.we <= io.we @[cam.scala 85:20]
    node _T_17 = bits(io.waddr, 17, 17) @[cam.scala 86:31]
    CAMLine_17.io.wi <= _T_17 @[cam.scala 86:20]
    CAMLine_17.io.key <= io.key @[cam.scala 87:21]
    CAMLine_17.io.din <= io.din @[cam.scala 88:21]
    CAMLine_18.io.we <= io.we @[cam.scala 85:20]
    node _T_18 = bits(io.waddr, 18, 18) @[cam.scala 86:31]
    CAMLine_18.io.wi <= _T_18 @[cam.scala 86:20]
    CAMLine_18.io.key <= io.key @[cam.scala 87:21]
    CAMLine_18.io.din <= io.din @[cam.scala 88:21]
    CAMLine_19.io.we <= io.we @[cam.scala 85:20]
    node _T_19 = bits(io.waddr, 19, 19) @[cam.scala 86:31]
    CAMLine_19.io.wi <= _T_19 @[cam.scala 86:20]
    CAMLine_19.io.key <= io.key @[cam.scala 87:21]
    CAMLine_19.io.din <= io.din @[cam.scala 88:21]
    CAMLine_20.io.we <= io.we @[cam.scala 85:20]
    node _T_20 = bits(io.waddr, 20, 20) @[cam.scala 86:31]
    CAMLine_20.io.wi <= _T_20 @[cam.scala 86:20]
    CAMLine_20.io.key <= io.key @[cam.scala 87:21]
    CAMLine_20.io.din <= io.din @[cam.scala 88:21]
    CAMLine_21.io.we <= io.we @[cam.scala 85:20]
    node _T_21 = bits(io.waddr, 21, 21) @[cam.scala 86:31]
    CAMLine_21.io.wi <= _T_21 @[cam.scala 86:20]
    CAMLine_21.io.key <= io.key @[cam.scala 87:21]
    CAMLine_21.io.din <= io.din @[cam.scala 88:21]
    CAMLine_22.io.we <= io.we @[cam.scala 85:20]
    node _T_22 = bits(io.waddr, 22, 22) @[cam.scala 86:31]
    CAMLine_22.io.wi <= _T_22 @[cam.scala 86:20]
    CAMLine_22.io.key <= io.key @[cam.scala 87:21]
    CAMLine_22.io.din <= io.din @[cam.scala 88:21]
    CAMLine_23.io.we <= io.we @[cam.scala 85:20]
    node _T_23 = bits(io.waddr, 23, 23) @[cam.scala 86:31]
    CAMLine_23.io.wi <= _T_23 @[cam.scala 86:20]
    CAMLine_23.io.key <= io.key @[cam.scala 87:21]
    CAMLine_23.io.din <= io.din @[cam.scala 88:21]
    CAMLine_24.io.we <= io.we @[cam.scala 85:20]
    node _T_24 = bits(io.waddr, 24, 24) @[cam.scala 86:31]
    CAMLine_24.io.wi <= _T_24 @[cam.scala 86:20]
    CAMLine_24.io.key <= io.key @[cam.scala 87:21]
    CAMLine_24.io.din <= io.din @[cam.scala 88:21]
    CAMLine_25.io.we <= io.we @[cam.scala 85:20]
    node _T_25 = bits(io.waddr, 25, 25) @[cam.scala 86:31]
    CAMLine_25.io.wi <= _T_25 @[cam.scala 86:20]
    CAMLine_25.io.key <= io.key @[cam.scala 87:21]
    CAMLine_25.io.din <= io.din @[cam.scala 88:21]
    CAMLine_26.io.we <= io.we @[cam.scala 85:20]
    node _T_26 = bits(io.waddr, 26, 26) @[cam.scala 86:31]
    CAMLine_26.io.wi <= _T_26 @[cam.scala 86:20]
    CAMLine_26.io.key <= io.key @[cam.scala 87:21]
    CAMLine_26.io.din <= io.din @[cam.scala 88:21]
    CAMLine_27.io.we <= io.we @[cam.scala 85:20]
    node _T_27 = bits(io.waddr, 27, 27) @[cam.scala 86:31]
    CAMLine_27.io.wi <= _T_27 @[cam.scala 86:20]
    CAMLine_27.io.key <= io.key @[cam.scala 87:21]
    CAMLine_27.io.din <= io.din @[cam.scala 88:21]
    CAMLine_28.io.we <= io.we @[cam.scala 85:20]
    node _T_28 = bits(io.waddr, 28, 28) @[cam.scala 86:31]
    CAMLine_28.io.wi <= _T_28 @[cam.scala 86:20]
    CAMLine_28.io.key <= io.key @[cam.scala 87:21]
    CAMLine_28.io.din <= io.din @[cam.scala 88:21]
    CAMLine_29.io.we <= io.we @[cam.scala 85:20]
    node _T_29 = bits(io.waddr, 29, 29) @[cam.scala 86:31]
    CAMLine_29.io.wi <= _T_29 @[cam.scala 86:20]
    CAMLine_29.io.key <= io.key @[cam.scala 87:21]
    CAMLine_29.io.din <= io.din @[cam.scala 88:21]
    CAMLine_30.io.we <= io.we @[cam.scala 85:20]
    node _T_30 = bits(io.waddr, 30, 30) @[cam.scala 86:31]
    CAMLine_30.io.wi <= _T_30 @[cam.scala 86:20]
    CAMLine_30.io.key <= io.key @[cam.scala 87:21]
    CAMLine_30.io.din <= io.din @[cam.scala 88:21]
    CAMLine_31.io.we <= io.we @[cam.scala 85:20]
    node _T_31 = bits(io.waddr, 31, 31) @[cam.scala 86:31]
    CAMLine_31.io.wi <= _T_31 @[cam.scala 86:20]
    CAMLine_31.io.key <= io.key @[cam.scala 87:21]
    CAMLine_31.io.din <= io.din @[cam.scala 88:21]
    CAMLine_32.io.we <= io.we @[cam.scala 85:20]
    node _T_32 = bits(io.waddr, 32, 32) @[cam.scala 86:31]
    CAMLine_32.io.wi <= _T_32 @[cam.scala 86:20]
    CAMLine_32.io.key <= io.key @[cam.scala 87:21]
    CAMLine_32.io.din <= io.din @[cam.scala 88:21]
    CAMLine_33.io.we <= io.we @[cam.scala 85:20]
    node _T_33 = bits(io.waddr, 33, 33) @[cam.scala 86:31]
    CAMLine_33.io.wi <= _T_33 @[cam.scala 86:20]
    CAMLine_33.io.key <= io.key @[cam.scala 87:21]
    CAMLine_33.io.din <= io.din @[cam.scala 88:21]
    CAMLine_34.io.we <= io.we @[cam.scala 85:20]
    node _T_34 = bits(io.waddr, 34, 34) @[cam.scala 86:31]
    CAMLine_34.io.wi <= _T_34 @[cam.scala 86:20]
    CAMLine_34.io.key <= io.key @[cam.scala 87:21]
    CAMLine_34.io.din <= io.din @[cam.scala 88:21]
    CAMLine_35.io.we <= io.we @[cam.scala 85:20]
    node _T_35 = bits(io.waddr, 35, 35) @[cam.scala 86:31]
    CAMLine_35.io.wi <= _T_35 @[cam.scala 86:20]
    CAMLine_35.io.key <= io.key @[cam.scala 87:21]
    CAMLine_35.io.din <= io.din @[cam.scala 88:21]
    CAMLine_36.io.we <= io.we @[cam.scala 85:20]
    node _T_36 = bits(io.waddr, 36, 36) @[cam.scala 86:31]
    CAMLine_36.io.wi <= _T_36 @[cam.scala 86:20]
    CAMLine_36.io.key <= io.key @[cam.scala 87:21]
    CAMLine_36.io.din <= io.din @[cam.scala 88:21]
    CAMLine_37.io.we <= io.we @[cam.scala 85:20]
    node _T_37 = bits(io.waddr, 37, 37) @[cam.scala 86:31]
    CAMLine_37.io.wi <= _T_37 @[cam.scala 86:20]
    CAMLine_37.io.key <= io.key @[cam.scala 87:21]
    CAMLine_37.io.din <= io.din @[cam.scala 88:21]
    CAMLine_38.io.we <= io.we @[cam.scala 85:20]
    node _T_38 = bits(io.waddr, 38, 38) @[cam.scala 86:31]
    CAMLine_38.io.wi <= _T_38 @[cam.scala 86:20]
    CAMLine_38.io.key <= io.key @[cam.scala 87:21]
    CAMLine_38.io.din <= io.din @[cam.scala 88:21]
    CAMLine_39.io.we <= io.we @[cam.scala 85:20]
    node _T_39 = bits(io.waddr, 39, 39) @[cam.scala 86:31]
    CAMLine_39.io.wi <= _T_39 @[cam.scala 86:20]
    CAMLine_39.io.key <= io.key @[cam.scala 87:21]
    CAMLine_39.io.din <= io.din @[cam.scala 88:21]
    CAMLine_40.io.we <= io.we @[cam.scala 85:20]
    node _T_40 = bits(io.waddr, 40, 40) @[cam.scala 86:31]
    CAMLine_40.io.wi <= _T_40 @[cam.scala 86:20]
    CAMLine_40.io.key <= io.key @[cam.scala 87:21]
    CAMLine_40.io.din <= io.din @[cam.scala 88:21]
    CAMLine_41.io.we <= io.we @[cam.scala 85:20]
    node _T_41 = bits(io.waddr, 41, 41) @[cam.scala 86:31]
    CAMLine_41.io.wi <= _T_41 @[cam.scala 86:20]
    CAMLine_41.io.key <= io.key @[cam.scala 87:21]
    CAMLine_41.io.din <= io.din @[cam.scala 88:21]
    CAMLine_42.io.we <= io.we @[cam.scala 85:20]
    node _T_42 = bits(io.waddr, 42, 42) @[cam.scala 86:31]
    CAMLine_42.io.wi <= _T_42 @[cam.scala 86:20]
    CAMLine_42.io.key <= io.key @[cam.scala 87:21]
    CAMLine_42.io.din <= io.din @[cam.scala 88:21]
    CAMLine_43.io.we <= io.we @[cam.scala 85:20]
    node _T_43 = bits(io.waddr, 43, 43) @[cam.scala 86:31]
    CAMLine_43.io.wi <= _T_43 @[cam.scala 86:20]
    CAMLine_43.io.key <= io.key @[cam.scala 87:21]
    CAMLine_43.io.din <= io.din @[cam.scala 88:21]
    CAMLine_44.io.we <= io.we @[cam.scala 85:20]
    node _T_44 = bits(io.waddr, 44, 44) @[cam.scala 86:31]
    CAMLine_44.io.wi <= _T_44 @[cam.scala 86:20]
    CAMLine_44.io.key <= io.key @[cam.scala 87:21]
    CAMLine_44.io.din <= io.din @[cam.scala 88:21]
    CAMLine_45.io.we <= io.we @[cam.scala 85:20]
    node _T_45 = bits(io.waddr, 45, 45) @[cam.scala 86:31]
    CAMLine_45.io.wi <= _T_45 @[cam.scala 86:20]
    CAMLine_45.io.key <= io.key @[cam.scala 87:21]
    CAMLine_45.io.din <= io.din @[cam.scala 88:21]
    CAMLine_46.io.we <= io.we @[cam.scala 85:20]
    node _T_46 = bits(io.waddr, 46, 46) @[cam.scala 86:31]
    CAMLine_46.io.wi <= _T_46 @[cam.scala 86:20]
    CAMLine_46.io.key <= io.key @[cam.scala 87:21]
    CAMLine_46.io.din <= io.din @[cam.scala 88:21]
    CAMLine_47.io.we <= io.we @[cam.scala 85:20]
    node _T_47 = bits(io.waddr, 47, 47) @[cam.scala 86:31]
    CAMLine_47.io.wi <= _T_47 @[cam.scala 86:20]
    CAMLine_47.io.key <= io.key @[cam.scala 87:21]
    CAMLine_47.io.din <= io.din @[cam.scala 88:21]
    CAMLine_48.io.we <= io.we @[cam.scala 85:20]
    node _T_48 = bits(io.waddr, 48, 48) @[cam.scala 86:31]
    CAMLine_48.io.wi <= _T_48 @[cam.scala 86:20]
    CAMLine_48.io.key <= io.key @[cam.scala 87:21]
    CAMLine_48.io.din <= io.din @[cam.scala 88:21]
    CAMLine_49.io.we <= io.we @[cam.scala 85:20]
    node _T_49 = bits(io.waddr, 49, 49) @[cam.scala 86:31]
    CAMLine_49.io.wi <= _T_49 @[cam.scala 86:20]
    CAMLine_49.io.key <= io.key @[cam.scala 87:21]
    CAMLine_49.io.din <= io.din @[cam.scala 88:21]
    CAMLine_50.io.we <= io.we @[cam.scala 85:20]
    node _T_50 = bits(io.waddr, 50, 50) @[cam.scala 86:31]
    CAMLine_50.io.wi <= _T_50 @[cam.scala 86:20]
    CAMLine_50.io.key <= io.key @[cam.scala 87:21]
    CAMLine_50.io.din <= io.din @[cam.scala 88:21]
    CAMLine_51.io.we <= io.we @[cam.scala 85:20]
    node _T_51 = bits(io.waddr, 51, 51) @[cam.scala 86:31]
    CAMLine_51.io.wi <= _T_51 @[cam.scala 86:20]
    CAMLine_51.io.key <= io.key @[cam.scala 87:21]
    CAMLine_51.io.din <= io.din @[cam.scala 88:21]
    CAMLine_52.io.we <= io.we @[cam.scala 85:20]
    node _T_52 = bits(io.waddr, 52, 52) @[cam.scala 86:31]
    CAMLine_52.io.wi <= _T_52 @[cam.scala 86:20]
    CAMLine_52.io.key <= io.key @[cam.scala 87:21]
    CAMLine_52.io.din <= io.din @[cam.scala 88:21]
    CAMLine_53.io.we <= io.we @[cam.scala 85:20]
    node _T_53 = bits(io.waddr, 53, 53) @[cam.scala 86:31]
    CAMLine_53.io.wi <= _T_53 @[cam.scala 86:20]
    CAMLine_53.io.key <= io.key @[cam.scala 87:21]
    CAMLine_53.io.din <= io.din @[cam.scala 88:21]
    CAMLine_54.io.we <= io.we @[cam.scala 85:20]
    node _T_54 = bits(io.waddr, 54, 54) @[cam.scala 86:31]
    CAMLine_54.io.wi <= _T_54 @[cam.scala 86:20]
    CAMLine_54.io.key <= io.key @[cam.scala 87:21]
    CAMLine_54.io.din <= io.din @[cam.scala 88:21]
    CAMLine_55.io.we <= io.we @[cam.scala 85:20]
    node _T_55 = bits(io.waddr, 55, 55) @[cam.scala 86:31]
    CAMLine_55.io.wi <= _T_55 @[cam.scala 86:20]
    CAMLine_55.io.key <= io.key @[cam.scala 87:21]
    CAMLine_55.io.din <= io.din @[cam.scala 88:21]
    CAMLine_56.io.we <= io.we @[cam.scala 85:20]
    node _T_56 = bits(io.waddr, 56, 56) @[cam.scala 86:31]
    CAMLine_56.io.wi <= _T_56 @[cam.scala 86:20]
    CAMLine_56.io.key <= io.key @[cam.scala 87:21]
    CAMLine_56.io.din <= io.din @[cam.scala 88:21]
    CAMLine_57.io.we <= io.we @[cam.scala 85:20]
    node _T_57 = bits(io.waddr, 57, 57) @[cam.scala 86:31]
    CAMLine_57.io.wi <= _T_57 @[cam.scala 86:20]
    CAMLine_57.io.key <= io.key @[cam.scala 87:21]
    CAMLine_57.io.din <= io.din @[cam.scala 88:21]
    CAMLine_58.io.we <= io.we @[cam.scala 85:20]
    node _T_58 = bits(io.waddr, 58, 58) @[cam.scala 86:31]
    CAMLine_58.io.wi <= _T_58 @[cam.scala 86:20]
    CAMLine_58.io.key <= io.key @[cam.scala 87:21]
    CAMLine_58.io.din <= io.din @[cam.scala 88:21]
    CAMLine_59.io.we <= io.we @[cam.scala 85:20]
    node _T_59 = bits(io.waddr, 59, 59) @[cam.scala 86:31]
    CAMLine_59.io.wi <= _T_59 @[cam.scala 86:20]
    CAMLine_59.io.key <= io.key @[cam.scala 87:21]
    CAMLine_59.io.din <= io.din @[cam.scala 88:21]
    CAMLine_60.io.we <= io.we @[cam.scala 85:20]
    node _T_60 = bits(io.waddr, 60, 60) @[cam.scala 86:31]
    CAMLine_60.io.wi <= _T_60 @[cam.scala 86:20]
    CAMLine_60.io.key <= io.key @[cam.scala 87:21]
    CAMLine_60.io.din <= io.din @[cam.scala 88:21]
    CAMLine_61.io.we <= io.we @[cam.scala 85:20]
    node _T_61 = bits(io.waddr, 61, 61) @[cam.scala 86:31]
    CAMLine_61.io.wi <= _T_61 @[cam.scala 86:20]
    CAMLine_61.io.key <= io.key @[cam.scala 87:21]
    CAMLine_61.io.din <= io.din @[cam.scala 88:21]
    CAMLine_62.io.we <= io.we @[cam.scala 85:20]
    node _T_62 = bits(io.waddr, 62, 62) @[cam.scala 86:31]
    CAMLine_62.io.wi <= _T_62 @[cam.scala 86:20]
    CAMLine_62.io.key <= io.key @[cam.scala 87:21]
    CAMLine_62.io.din <= io.din @[cam.scala 88:21]
    CAMLine_63.io.we <= io.we @[cam.scala 85:20]
    node _T_63 = bits(io.waddr, 63, 63) @[cam.scala 86:31]
    CAMLine_63.io.wi <= _T_63 @[cam.scala 86:20]
    CAMLine_63.io.key <= io.key @[cam.scala 87:21]
    CAMLine_63.io.din <= io.din @[cam.scala 88:21]
    node _io_hit_T = or(CAMLine.io.hit, CAMLine_1.io.hit) @[cam.scala 93:27]
    node _io_hit_T_1 = or(_io_hit_T, CAMLine_2.io.hit) @[cam.scala 93:27]
    node _io_hit_T_2 = or(_io_hit_T_1, CAMLine_3.io.hit) @[cam.scala 93:27]
    node _io_hit_T_3 = or(_io_hit_T_2, CAMLine_4.io.hit) @[cam.scala 93:27]
    node _io_hit_T_4 = or(_io_hit_T_3, CAMLine_5.io.hit) @[cam.scala 93:27]
    node _io_hit_T_5 = or(_io_hit_T_4, CAMLine_6.io.hit) @[cam.scala 93:27]
    node _io_hit_T_6 = or(_io_hit_T_5, CAMLine_7.io.hit) @[cam.scala 93:27]
    node _io_hit_T_7 = or(_io_hit_T_6, CAMLine_8.io.hit) @[cam.scala 93:27]
    node _io_hit_T_8 = or(_io_hit_T_7, CAMLine_9.io.hit) @[cam.scala 93:27]
    node _io_hit_T_9 = or(_io_hit_T_8, CAMLine_10.io.hit) @[cam.scala 93:27]
    node _io_hit_T_10 = or(_io_hit_T_9, CAMLine_11.io.hit) @[cam.scala 93:27]
    node _io_hit_T_11 = or(_io_hit_T_10, CAMLine_12.io.hit) @[cam.scala 93:27]
    node _io_hit_T_12 = or(_io_hit_T_11, CAMLine_13.io.hit) @[cam.scala 93:27]
    node _io_hit_T_13 = or(_io_hit_T_12, CAMLine_14.io.hit) @[cam.scala 93:27]
    node _io_hit_T_14 = or(_io_hit_T_13, CAMLine_15.io.hit) @[cam.scala 93:27]
    node _io_hit_T_15 = or(_io_hit_T_14, CAMLine_16.io.hit) @[cam.scala 93:27]
    node _io_hit_T_16 = or(_io_hit_T_15, CAMLine_17.io.hit) @[cam.scala 93:27]
    node _io_hit_T_17 = or(_io_hit_T_16, CAMLine_18.io.hit) @[cam.scala 93:27]
    node _io_hit_T_18 = or(_io_hit_T_17, CAMLine_19.io.hit) @[cam.scala 93:27]
    node _io_hit_T_19 = or(_io_hit_T_18, CAMLine_20.io.hit) @[cam.scala 93:27]
    node _io_hit_T_20 = or(_io_hit_T_19, CAMLine_21.io.hit) @[cam.scala 93:27]
    node _io_hit_T_21 = or(_io_hit_T_20, CAMLine_22.io.hit) @[cam.scala 93:27]
    node _io_hit_T_22 = or(_io_hit_T_21, CAMLine_23.io.hit) @[cam.scala 93:27]
    node _io_hit_T_23 = or(_io_hit_T_22, CAMLine_24.io.hit) @[cam.scala 93:27]
    node _io_hit_T_24 = or(_io_hit_T_23, CAMLine_25.io.hit) @[cam.scala 93:27]
    node _io_hit_T_25 = or(_io_hit_T_24, CAMLine_26.io.hit) @[cam.scala 93:27]
    node _io_hit_T_26 = or(_io_hit_T_25, CAMLine_27.io.hit) @[cam.scala 93:27]
    node _io_hit_T_27 = or(_io_hit_T_26, CAMLine_28.io.hit) @[cam.scala 93:27]
    node _io_hit_T_28 = or(_io_hit_T_27, CAMLine_29.io.hit) @[cam.scala 93:27]
    node _io_hit_T_29 = or(_io_hit_T_28, CAMLine_30.io.hit) @[cam.scala 93:27]
    node _io_hit_T_30 = or(_io_hit_T_29, CAMLine_31.io.hit) @[cam.scala 93:27]
    node _io_hit_T_31 = or(_io_hit_T_30, CAMLine_32.io.hit) @[cam.scala 93:27]
    node _io_hit_T_32 = or(_io_hit_T_31, CAMLine_33.io.hit) @[cam.scala 93:27]
    node _io_hit_T_33 = or(_io_hit_T_32, CAMLine_34.io.hit) @[cam.scala 93:27]
    node _io_hit_T_34 = or(_io_hit_T_33, CAMLine_35.io.hit) @[cam.scala 93:27]
    node _io_hit_T_35 = or(_io_hit_T_34, CAMLine_36.io.hit) @[cam.scala 93:27]
    node _io_hit_T_36 = or(_io_hit_T_35, CAMLine_37.io.hit) @[cam.scala 93:27]
    node _io_hit_T_37 = or(_io_hit_T_36, CAMLine_38.io.hit) @[cam.scala 93:27]
    node _io_hit_T_38 = or(_io_hit_T_37, CAMLine_39.io.hit) @[cam.scala 93:27]
    node _io_hit_T_39 = or(_io_hit_T_38, CAMLine_40.io.hit) @[cam.scala 93:27]
    node _io_hit_T_40 = or(_io_hit_T_39, CAMLine_41.io.hit) @[cam.scala 93:27]
    node _io_hit_T_41 = or(_io_hit_T_40, CAMLine_42.io.hit) @[cam.scala 93:27]
    node _io_hit_T_42 = or(_io_hit_T_41, CAMLine_43.io.hit) @[cam.scala 93:27]
    node _io_hit_T_43 = or(_io_hit_T_42, CAMLine_44.io.hit) @[cam.scala 93:27]
    node _io_hit_T_44 = or(_io_hit_T_43, CAMLine_45.io.hit) @[cam.scala 93:27]
    node _io_hit_T_45 = or(_io_hit_T_44, CAMLine_46.io.hit) @[cam.scala 93:27]
    node _io_hit_T_46 = or(_io_hit_T_45, CAMLine_47.io.hit) @[cam.scala 93:27]
    node _io_hit_T_47 = or(_io_hit_T_46, CAMLine_48.io.hit) @[cam.scala 93:27]
    node _io_hit_T_48 = or(_io_hit_T_47, CAMLine_49.io.hit) @[cam.scala 93:27]
    node _io_hit_T_49 = or(_io_hit_T_48, CAMLine_50.io.hit) @[cam.scala 93:27]
    node _io_hit_T_50 = or(_io_hit_T_49, CAMLine_51.io.hit) @[cam.scala 93:27]
    node _io_hit_T_51 = or(_io_hit_T_50, CAMLine_52.io.hit) @[cam.scala 93:27]
    node _io_hit_T_52 = or(_io_hit_T_51, CAMLine_53.io.hit) @[cam.scala 93:27]
    node _io_hit_T_53 = or(_io_hit_T_52, CAMLine_54.io.hit) @[cam.scala 93:27]
    node _io_hit_T_54 = or(_io_hit_T_53, CAMLine_55.io.hit) @[cam.scala 93:27]
    node _io_hit_T_55 = or(_io_hit_T_54, CAMLine_56.io.hit) @[cam.scala 93:27]
    node _io_hit_T_56 = or(_io_hit_T_55, CAMLine_57.io.hit) @[cam.scala 93:27]
    node _io_hit_T_57 = or(_io_hit_T_56, CAMLine_58.io.hit) @[cam.scala 93:27]
    node _io_hit_T_58 = or(_io_hit_T_57, CAMLine_59.io.hit) @[cam.scala 93:27]
    node _io_hit_T_59 = or(_io_hit_T_58, CAMLine_60.io.hit) @[cam.scala 93:27]
    node _io_hit_T_60 = or(_io_hit_T_59, CAMLine_61.io.hit) @[cam.scala 93:27]
    node _io_hit_T_61 = or(_io_hit_T_60, CAMLine_62.io.hit) @[cam.scala 93:27]
    node _io_hit_T_62 = or(_io_hit_T_61, CAMLine_63.io.hit) @[cam.scala 93:27]
    io.hit <= _io_hit_T_62 @[cam.scala 93:10]

