circuit CAM4to2 :
  module CAMCell :
    input clock : Clock
    input reset : Reset
    output io : { flip write : UInt<1>, flip ki : UInt<1>, flip di : UInt<1>, lhi : UInt<1>, log_oi_cell : UInt<1>}

    wire ti : UInt<1> @[cam.scala 16:16]
    reg oi : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[cam.scala 17:19]
    node _ti_T = and(io.write, io.di) @[cam.scala 20:19]
    node _ti_T_1 = eq(io.write, UInt<1>("h0")) @[cam.scala 20:31]
    node _ti_T_2 = and(_ti_T_1, oi) @[cam.scala 20:41]
    node _ti_T_3 = or(_ti_T, _ti_T_2) @[cam.scala 20:28]
    ti <= _ti_T_3 @[cam.scala 20:6]
    oi <= ti @[cam.scala 21:6]
    node _io_lhi_T = and(oi, io.ki) @[cam.scala 23:17]
    node _io_lhi_T_1 = eq(oi, UInt<1>("h0")) @[cam.scala 23:29]
    node _io_lhi_T_2 = eq(io.ki, UInt<1>("h0")) @[cam.scala 23:35]
    node _io_lhi_T_3 = and(_io_lhi_T_1, _io_lhi_T_2) @[cam.scala 23:33]
    node _io_lhi_T_4 = or(_io_lhi_T, _io_lhi_T_3) @[cam.scala 23:26]
    io.lhi <= _io_lhi_T_4 @[cam.scala 23:10]
    io.log_oi_cell <= oi @[cam.scala 24:18]

  module CAMCell_1 :
    input clock : Clock
    input reset : Reset
    output io : { flip write : UInt<1>, flip ki : UInt<1>, flip di : UInt<1>, lhi : UInt<1>, log_oi_cell : UInt<1>}

    wire ti : UInt<1> @[cam.scala 16:16]
    reg oi : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[cam.scala 17:19]
    node _ti_T = and(io.write, io.di) @[cam.scala 20:19]
    node _ti_T_1 = eq(io.write, UInt<1>("h0")) @[cam.scala 20:31]
    node _ti_T_2 = and(_ti_T_1, oi) @[cam.scala 20:41]
    node _ti_T_3 = or(_ti_T, _ti_T_2) @[cam.scala 20:28]
    ti <= _ti_T_3 @[cam.scala 20:6]
    oi <= ti @[cam.scala 21:6]
    node _io_lhi_T = and(oi, io.ki) @[cam.scala 23:17]
    node _io_lhi_T_1 = eq(oi, UInt<1>("h0")) @[cam.scala 23:29]
    node _io_lhi_T_2 = eq(io.ki, UInt<1>("h0")) @[cam.scala 23:35]
    node _io_lhi_T_3 = and(_io_lhi_T_1, _io_lhi_T_2) @[cam.scala 23:33]
    node _io_lhi_T_4 = or(_io_lhi_T, _io_lhi_T_3) @[cam.scala 23:26]
    io.lhi <= _io_lhi_T_4 @[cam.scala 23:10]
    io.log_oi_cell <= oi @[cam.scala 24:18]

  module CAMLine :
    input clock : Clock
    input reset : Reset
    output io : { flip we : UInt<1>, flip wi : UInt<1>, flip key : UInt<2>, flip din : UInt<2>, hit : UInt<1>, log_camline : UInt<2>}

    wire write : UInt<1> @[cam.scala 38:19]
    wire lhit : UInt<1>[2] @[cam.scala 39:18]
    node _write_T = and(io.we, io.wi) @[cam.scala 40:18]
    write <= _write_T @[cam.scala 40:9]
    inst cc1 of CAMCell @[cam.scala 42:19]
    cc1.clock <= clock
    cc1.reset <= reset
    cc1.io.write <= write @[cam.scala 44:16]
    node _cc1_io_ki_T = bits(io.key, 1, 1) @[cam.scala 45:22]
    cc1.io.ki <= _cc1_io_ki_T @[cam.scala 45:13]
    node _cc1_io_di_T = bits(io.din, 1, 1) @[cam.scala 46:22]
    cc1.io.di <= _cc1_io_di_T @[cam.scala 46:13]
    lhit[1] <= cc1.io.lhi @[cam.scala 47:11]
    inst cc0 of CAMCell_1 @[cam.scala 49:19]
    cc0.clock <= clock
    cc0.reset <= reset
    cc0.io.write <= write @[cam.scala 51:16]
    node _cc0_io_ki_T = bits(io.key, 0, 0) @[cam.scala 52:22]
    cc0.io.ki <= _cc0_io_ki_T @[cam.scala 52:13]
    node _cc0_io_di_T = bits(io.din, 0, 0) @[cam.scala 53:22]
    cc0.io.di <= _cc0_io_di_T @[cam.scala 53:13]
    lhit[0] <= cc0.io.lhi @[cam.scala 54:11]
    node _io_log_camline_T = mul(cc1.io.log_oi_cell, UInt<2>("h2")) @[cam.scala 60:60]
    node _io_log_camline_T_1 = add(cc0.io.log_oi_cell, _io_log_camline_T) @[cam.scala 60:40]
    node _io_log_camline_T_2 = tail(_io_log_camline_T_1, 1) @[cam.scala 60:40]
    io.log_camline <= _io_log_camline_T_2 @[cam.scala 60:18]
    node _io_hit_T = and(lhit[1], lhit[0]) @[cam.scala 62:21]
    io.hit <= _io_hit_T @[cam.scala 62:10]

  module CAMCell_2 :
    input clock : Clock
    input reset : Reset
    output io : { flip write : UInt<1>, flip ki : UInt<1>, flip di : UInt<1>, lhi : UInt<1>, log_oi_cell : UInt<1>}

    wire ti : UInt<1> @[cam.scala 16:16]
    reg oi : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[cam.scala 17:19]
    node _ti_T = and(io.write, io.di) @[cam.scala 20:19]
    node _ti_T_1 = eq(io.write, UInt<1>("h0")) @[cam.scala 20:31]
    node _ti_T_2 = and(_ti_T_1, oi) @[cam.scala 20:41]
    node _ti_T_3 = or(_ti_T, _ti_T_2) @[cam.scala 20:28]
    ti <= _ti_T_3 @[cam.scala 20:6]
    oi <= ti @[cam.scala 21:6]
    node _io_lhi_T = and(oi, io.ki) @[cam.scala 23:17]
    node _io_lhi_T_1 = eq(oi, UInt<1>("h0")) @[cam.scala 23:29]
    node _io_lhi_T_2 = eq(io.ki, UInt<1>("h0")) @[cam.scala 23:35]
    node _io_lhi_T_3 = and(_io_lhi_T_1, _io_lhi_T_2) @[cam.scala 23:33]
    node _io_lhi_T_4 = or(_io_lhi_T, _io_lhi_T_3) @[cam.scala 23:26]
    io.lhi <= _io_lhi_T_4 @[cam.scala 23:10]
    io.log_oi_cell <= oi @[cam.scala 24:18]

  module CAMCell_3 :
    input clock : Clock
    input reset : Reset
    output io : { flip write : UInt<1>, flip ki : UInt<1>, flip di : UInt<1>, lhi : UInt<1>, log_oi_cell : UInt<1>}

    wire ti : UInt<1> @[cam.scala 16:16]
    reg oi : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[cam.scala 17:19]
    node _ti_T = and(io.write, io.di) @[cam.scala 20:19]
    node _ti_T_1 = eq(io.write, UInt<1>("h0")) @[cam.scala 20:31]
    node _ti_T_2 = and(_ti_T_1, oi) @[cam.scala 20:41]
    node _ti_T_3 = or(_ti_T, _ti_T_2) @[cam.scala 20:28]
    ti <= _ti_T_3 @[cam.scala 20:6]
    oi <= ti @[cam.scala 21:6]
    node _io_lhi_T = and(oi, io.ki) @[cam.scala 23:17]
    node _io_lhi_T_1 = eq(oi, UInt<1>("h0")) @[cam.scala 23:29]
    node _io_lhi_T_2 = eq(io.ki, UInt<1>("h0")) @[cam.scala 23:35]
    node _io_lhi_T_3 = and(_io_lhi_T_1, _io_lhi_T_2) @[cam.scala 23:33]
    node _io_lhi_T_4 = or(_io_lhi_T, _io_lhi_T_3) @[cam.scala 23:26]
    io.lhi <= _io_lhi_T_4 @[cam.scala 23:10]
    io.log_oi_cell <= oi @[cam.scala 24:18]

  module CAMLine_1 :
    input clock : Clock
    input reset : Reset
    output io : { flip we : UInt<1>, flip wi : UInt<1>, flip key : UInt<2>, flip din : UInt<2>, hit : UInt<1>, log_camline : UInt<2>}

    wire write : UInt<1> @[cam.scala 38:19]
    wire lhit : UInt<1>[2] @[cam.scala 39:18]
    node _write_T = and(io.we, io.wi) @[cam.scala 40:18]
    write <= _write_T @[cam.scala 40:9]
    inst cc1 of CAMCell_2 @[cam.scala 42:19]
    cc1.clock <= clock
    cc1.reset <= reset
    cc1.io.write <= write @[cam.scala 44:16]
    node _cc1_io_ki_T = bits(io.key, 1, 1) @[cam.scala 45:22]
    cc1.io.ki <= _cc1_io_ki_T @[cam.scala 45:13]
    node _cc1_io_di_T = bits(io.din, 1, 1) @[cam.scala 46:22]
    cc1.io.di <= _cc1_io_di_T @[cam.scala 46:13]
    lhit[1] <= cc1.io.lhi @[cam.scala 47:11]
    inst cc0 of CAMCell_3 @[cam.scala 49:19]
    cc0.clock <= clock
    cc0.reset <= reset
    cc0.io.write <= write @[cam.scala 51:16]
    node _cc0_io_ki_T = bits(io.key, 0, 0) @[cam.scala 52:22]
    cc0.io.ki <= _cc0_io_ki_T @[cam.scala 52:13]
    node _cc0_io_di_T = bits(io.din, 0, 0) @[cam.scala 53:22]
    cc0.io.di <= _cc0_io_di_T @[cam.scala 53:13]
    lhit[0] <= cc0.io.lhi @[cam.scala 54:11]
    node _io_log_camline_T = mul(cc1.io.log_oi_cell, UInt<2>("h2")) @[cam.scala 60:60]
    node _io_log_camline_T_1 = add(cc0.io.log_oi_cell, _io_log_camline_T) @[cam.scala 60:40]
    node _io_log_camline_T_2 = tail(_io_log_camline_T_1, 1) @[cam.scala 60:40]
    io.log_camline <= _io_log_camline_T_2 @[cam.scala 60:18]
    node _io_hit_T = and(lhit[1], lhit[0]) @[cam.scala 62:21]
    io.hit <= _io_hit_T @[cam.scala 62:10]

  module CAMCell_4 :
    input clock : Clock
    input reset : Reset
    output io : { flip write : UInt<1>, flip ki : UInt<1>, flip di : UInt<1>, lhi : UInt<1>, log_oi_cell : UInt<1>}

    wire ti : UInt<1> @[cam.scala 16:16]
    reg oi : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[cam.scala 17:19]
    node _ti_T = and(io.write, io.di) @[cam.scala 20:19]
    node _ti_T_1 = eq(io.write, UInt<1>("h0")) @[cam.scala 20:31]
    node _ti_T_2 = and(_ti_T_1, oi) @[cam.scala 20:41]
    node _ti_T_3 = or(_ti_T, _ti_T_2) @[cam.scala 20:28]
    ti <= _ti_T_3 @[cam.scala 20:6]
    oi <= ti @[cam.scala 21:6]
    node _io_lhi_T = and(oi, io.ki) @[cam.scala 23:17]
    node _io_lhi_T_1 = eq(oi, UInt<1>("h0")) @[cam.scala 23:29]
    node _io_lhi_T_2 = eq(io.ki, UInt<1>("h0")) @[cam.scala 23:35]
    node _io_lhi_T_3 = and(_io_lhi_T_1, _io_lhi_T_2) @[cam.scala 23:33]
    node _io_lhi_T_4 = or(_io_lhi_T, _io_lhi_T_3) @[cam.scala 23:26]
    io.lhi <= _io_lhi_T_4 @[cam.scala 23:10]
    io.log_oi_cell <= oi @[cam.scala 24:18]

  module CAMCell_5 :
    input clock : Clock
    input reset : Reset
    output io : { flip write : UInt<1>, flip ki : UInt<1>, flip di : UInt<1>, lhi : UInt<1>, log_oi_cell : UInt<1>}

    wire ti : UInt<1> @[cam.scala 16:16]
    reg oi : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[cam.scala 17:19]
    node _ti_T = and(io.write, io.di) @[cam.scala 20:19]
    node _ti_T_1 = eq(io.write, UInt<1>("h0")) @[cam.scala 20:31]
    node _ti_T_2 = and(_ti_T_1, oi) @[cam.scala 20:41]
    node _ti_T_3 = or(_ti_T, _ti_T_2) @[cam.scala 20:28]
    ti <= _ti_T_3 @[cam.scala 20:6]
    oi <= ti @[cam.scala 21:6]
    node _io_lhi_T = and(oi, io.ki) @[cam.scala 23:17]
    node _io_lhi_T_1 = eq(oi, UInt<1>("h0")) @[cam.scala 23:29]
    node _io_lhi_T_2 = eq(io.ki, UInt<1>("h0")) @[cam.scala 23:35]
    node _io_lhi_T_3 = and(_io_lhi_T_1, _io_lhi_T_2) @[cam.scala 23:33]
    node _io_lhi_T_4 = or(_io_lhi_T, _io_lhi_T_3) @[cam.scala 23:26]
    io.lhi <= _io_lhi_T_4 @[cam.scala 23:10]
    io.log_oi_cell <= oi @[cam.scala 24:18]

  module CAMLine_2 :
    input clock : Clock
    input reset : Reset
    output io : { flip we : UInt<1>, flip wi : UInt<1>, flip key : UInt<2>, flip din : UInt<2>, hit : UInt<1>, log_camline : UInt<2>}

    wire write : UInt<1> @[cam.scala 38:19]
    wire lhit : UInt<1>[2] @[cam.scala 39:18]
    node _write_T = and(io.we, io.wi) @[cam.scala 40:18]
    write <= _write_T @[cam.scala 40:9]
    inst cc1 of CAMCell_4 @[cam.scala 42:19]
    cc1.clock <= clock
    cc1.reset <= reset
    cc1.io.write <= write @[cam.scala 44:16]
    node _cc1_io_ki_T = bits(io.key, 1, 1) @[cam.scala 45:22]
    cc1.io.ki <= _cc1_io_ki_T @[cam.scala 45:13]
    node _cc1_io_di_T = bits(io.din, 1, 1) @[cam.scala 46:22]
    cc1.io.di <= _cc1_io_di_T @[cam.scala 46:13]
    lhit[1] <= cc1.io.lhi @[cam.scala 47:11]
    inst cc0 of CAMCell_5 @[cam.scala 49:19]
    cc0.clock <= clock
    cc0.reset <= reset
    cc0.io.write <= write @[cam.scala 51:16]
    node _cc0_io_ki_T = bits(io.key, 0, 0) @[cam.scala 52:22]
    cc0.io.ki <= _cc0_io_ki_T @[cam.scala 52:13]
    node _cc0_io_di_T = bits(io.din, 0, 0) @[cam.scala 53:22]
    cc0.io.di <= _cc0_io_di_T @[cam.scala 53:13]
    lhit[0] <= cc0.io.lhi @[cam.scala 54:11]
    node _io_log_camline_T = mul(cc1.io.log_oi_cell, UInt<2>("h2")) @[cam.scala 60:60]
    node _io_log_camline_T_1 = add(cc0.io.log_oi_cell, _io_log_camline_T) @[cam.scala 60:40]
    node _io_log_camline_T_2 = tail(_io_log_camline_T_1, 1) @[cam.scala 60:40]
    io.log_camline <= _io_log_camline_T_2 @[cam.scala 60:18]
    node _io_hit_T = and(lhit[1], lhit[0]) @[cam.scala 62:21]
    io.hit <= _io_hit_T @[cam.scala 62:10]

  module CAMCell_6 :
    input clock : Clock
    input reset : Reset
    output io : { flip write : UInt<1>, flip ki : UInt<1>, flip di : UInt<1>, lhi : UInt<1>, log_oi_cell : UInt<1>}

    wire ti : UInt<1> @[cam.scala 16:16]
    reg oi : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[cam.scala 17:19]
    node _ti_T = and(io.write, io.di) @[cam.scala 20:19]
    node _ti_T_1 = eq(io.write, UInt<1>("h0")) @[cam.scala 20:31]
    node _ti_T_2 = and(_ti_T_1, oi) @[cam.scala 20:41]
    node _ti_T_3 = or(_ti_T, _ti_T_2) @[cam.scala 20:28]
    ti <= _ti_T_3 @[cam.scala 20:6]
    oi <= ti @[cam.scala 21:6]
    node _io_lhi_T = and(oi, io.ki) @[cam.scala 23:17]
    node _io_lhi_T_1 = eq(oi, UInt<1>("h0")) @[cam.scala 23:29]
    node _io_lhi_T_2 = eq(io.ki, UInt<1>("h0")) @[cam.scala 23:35]
    node _io_lhi_T_3 = and(_io_lhi_T_1, _io_lhi_T_2) @[cam.scala 23:33]
    node _io_lhi_T_4 = or(_io_lhi_T, _io_lhi_T_3) @[cam.scala 23:26]
    io.lhi <= _io_lhi_T_4 @[cam.scala 23:10]
    io.log_oi_cell <= oi @[cam.scala 24:18]

  module CAMCell_7 :
    input clock : Clock
    input reset : Reset
    output io : { flip write : UInt<1>, flip ki : UInt<1>, flip di : UInt<1>, lhi : UInt<1>, log_oi_cell : UInt<1>}

    wire ti : UInt<1> @[cam.scala 16:16]
    reg oi : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[cam.scala 17:19]
    node _ti_T = and(io.write, io.di) @[cam.scala 20:19]
    node _ti_T_1 = eq(io.write, UInt<1>("h0")) @[cam.scala 20:31]
    node _ti_T_2 = and(_ti_T_1, oi) @[cam.scala 20:41]
    node _ti_T_3 = or(_ti_T, _ti_T_2) @[cam.scala 20:28]
    ti <= _ti_T_3 @[cam.scala 20:6]
    oi <= ti @[cam.scala 21:6]
    node _io_lhi_T = and(oi, io.ki) @[cam.scala 23:17]
    node _io_lhi_T_1 = eq(oi, UInt<1>("h0")) @[cam.scala 23:29]
    node _io_lhi_T_2 = eq(io.ki, UInt<1>("h0")) @[cam.scala 23:35]
    node _io_lhi_T_3 = and(_io_lhi_T_1, _io_lhi_T_2) @[cam.scala 23:33]
    node _io_lhi_T_4 = or(_io_lhi_T, _io_lhi_T_3) @[cam.scala 23:26]
    io.lhi <= _io_lhi_T_4 @[cam.scala 23:10]
    io.log_oi_cell <= oi @[cam.scala 24:18]

  module CAMLine_3 :
    input clock : Clock
    input reset : Reset
    output io : { flip we : UInt<1>, flip wi : UInt<1>, flip key : UInt<2>, flip din : UInt<2>, hit : UInt<1>, log_camline : UInt<2>}

    wire write : UInt<1> @[cam.scala 38:19]
    wire lhit : UInt<1>[2] @[cam.scala 39:18]
    node _write_T = and(io.we, io.wi) @[cam.scala 40:18]
    write <= _write_T @[cam.scala 40:9]
    inst cc1 of CAMCell_6 @[cam.scala 42:19]
    cc1.clock <= clock
    cc1.reset <= reset
    cc1.io.write <= write @[cam.scala 44:16]
    node _cc1_io_ki_T = bits(io.key, 1, 1) @[cam.scala 45:22]
    cc1.io.ki <= _cc1_io_ki_T @[cam.scala 45:13]
    node _cc1_io_di_T = bits(io.din, 1, 1) @[cam.scala 46:22]
    cc1.io.di <= _cc1_io_di_T @[cam.scala 46:13]
    lhit[1] <= cc1.io.lhi @[cam.scala 47:11]
    inst cc0 of CAMCell_7 @[cam.scala 49:19]
    cc0.clock <= clock
    cc0.reset <= reset
    cc0.io.write <= write @[cam.scala 51:16]
    node _cc0_io_ki_T = bits(io.key, 0, 0) @[cam.scala 52:22]
    cc0.io.ki <= _cc0_io_ki_T @[cam.scala 52:13]
    node _cc0_io_di_T = bits(io.din, 0, 0) @[cam.scala 53:22]
    cc0.io.di <= _cc0_io_di_T @[cam.scala 53:13]
    lhit[0] <= cc0.io.lhi @[cam.scala 54:11]
    node _io_log_camline_T = mul(cc1.io.log_oi_cell, UInt<2>("h2")) @[cam.scala 60:60]
    node _io_log_camline_T_1 = add(cc0.io.log_oi_cell, _io_log_camline_T) @[cam.scala 60:40]
    node _io_log_camline_T_2 = tail(_io_log_camline_T_1, 1) @[cam.scala 60:40]
    io.log_camline <= _io_log_camline_T_2 @[cam.scala 60:18]
    node _io_hit_T = and(lhit[1], lhit[0]) @[cam.scala 62:21]
    io.hit <= _io_hit_T @[cam.scala 62:10]

  module CAM4to2 :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip we : UInt<1>, flip key : UInt<2>, flip din : UInt<2>, flip waddr : UInt<4>, hit : UInt<1>, log : UInt<2>[4]}

    wire hits : UInt<1>[4] @[cam.scala 77:18]
    inst cl0 of CAMLine @[cam.scala 79:19]
    cl0.clock <= clock
    cl0.reset <= reset
    cl0.io.we <= io.we @[cam.scala 81:13]
    node _cl0_io_wi_T = bits(io.waddr, 0, 0) @[cam.scala 82:24]
    cl0.io.wi <= _cl0_io_wi_T @[cam.scala 82:13]
    cl0.io.key <= io.key @[cam.scala 83:14]
    cl0.io.din <= io.din @[cam.scala 84:14]
    hits[0] <= cl0.io.hit @[cam.scala 85:11]
    inst cl1 of CAMLine_1 @[cam.scala 87:19]
    cl1.clock <= clock
    cl1.reset <= reset
    cl1.io.we <= io.we @[cam.scala 89:13]
    node _cl1_io_wi_T = bits(io.waddr, 1, 1) @[cam.scala 90:24]
    cl1.io.wi <= _cl1_io_wi_T @[cam.scala 90:13]
    cl1.io.key <= io.key @[cam.scala 91:14]
    cl1.io.din <= io.din @[cam.scala 92:14]
    hits[1] <= cl1.io.hit @[cam.scala 93:11]
    inst cl2 of CAMLine_2 @[cam.scala 95:19]
    cl2.clock <= clock
    cl2.reset <= reset
    cl2.io.we <= io.we @[cam.scala 97:13]
    node _cl2_io_wi_T = bits(io.waddr, 2, 2) @[cam.scala 98:24]
    cl2.io.wi <= _cl2_io_wi_T @[cam.scala 98:13]
    cl2.io.key <= io.key @[cam.scala 99:14]
    cl2.io.din <= io.din @[cam.scala 100:14]
    hits[2] <= cl2.io.hit @[cam.scala 101:11]
    inst cl3 of CAMLine_3 @[cam.scala 103:19]
    cl3.clock <= clock
    cl3.reset <= reset
    cl3.io.we <= io.we @[cam.scala 105:13]
    node _cl3_io_wi_T = bits(io.waddr, 3, 3) @[cam.scala 106:24]
    cl3.io.wi <= _cl3_io_wi_T @[cam.scala 106:13]
    cl3.io.key <= io.key @[cam.scala 107:14]
    cl3.io.din <= io.din @[cam.scala 108:14]
    hits[3] <= cl3.io.hit @[cam.scala 109:11]
    node _io_hit_T = or(hits[0], hits[1]) @[cam.scala 111:21]
    node _io_hit_T_1 = or(_io_hit_T, hits[2]) @[cam.scala 111:32]
    node _io_hit_T_2 = or(_io_hit_T_1, hits[3]) @[cam.scala 111:43]
    io.hit <= _io_hit_T_2 @[cam.scala 111:10]
    io.log[0] <= cl0.io.log_camline @[cam.scala 112:13]
    io.log[1] <= cl1.io.log_camline @[cam.scala 113:13]
    io.log[2] <= cl2.io.log_camline @[cam.scala 114:13]
    io.log[3] <= cl3.io.log_camline @[cam.scala 115:13]

