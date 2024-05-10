circuit SMatMul :
  module ProcElem :
    input clock : Clock
    input reset : Reset
    output io : { flip in_h : UInt<8>, flip in_v : UInt<8>, out_h : UInt<16>, out_v : UInt<16>, out : UInt<16>}

    reg res : UInt<16>, clock with :
      reset => (reset, UInt<16>("h0")) @[ProcElem.scala 26:21]
    reg hreg : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[ProcElem.scala 27:21]
    reg vreg : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[ProcElem.scala 28:21]
    node _res_T = mul(io.in_h, io.in_v) @[ProcElem.scala 31:25]
    node _res_T_1 = add(res, _res_T) @[ProcElem.scala 31:14]
    node _res_T_2 = tail(_res_T_1, 1) @[ProcElem.scala 31:14]
    res <= _res_T_2 @[ProcElem.scala 31:7]
    hreg <= io.in_h @[ProcElem.scala 34:8]
    vreg <= io.in_v @[ProcElem.scala 35:8]
    io.out_h <= hreg @[ProcElem.scala 37:12]
    io.out_v <= vreg @[ProcElem.scala 38:12]
    io.out <= res @[ProcElem.scala 39:10]

  module ProcElem_1 :
    input clock : Clock
    input reset : Reset
    output io : { flip in_h : UInt<8>, flip in_v : UInt<8>, out_h : UInt<16>, out_v : UInt<16>, out : UInt<16>}

    reg res : UInt<16>, clock with :
      reset => (reset, UInt<16>("h0")) @[ProcElem.scala 26:21]
    reg hreg : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[ProcElem.scala 27:21]
    reg vreg : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[ProcElem.scala 28:21]
    node _res_T = mul(io.in_h, io.in_v) @[ProcElem.scala 31:25]
    node _res_T_1 = add(res, _res_T) @[ProcElem.scala 31:14]
    node _res_T_2 = tail(_res_T_1, 1) @[ProcElem.scala 31:14]
    res <= _res_T_2 @[ProcElem.scala 31:7]
    hreg <= io.in_h @[ProcElem.scala 34:8]
    vreg <= io.in_v @[ProcElem.scala 35:8]
    io.out_h <= hreg @[ProcElem.scala 37:12]
    io.out_v <= vreg @[ProcElem.scala 38:12]
    io.out <= res @[ProcElem.scala 39:10]

  module ProcElem_2 :
    input clock : Clock
    input reset : Reset
    output io : { flip in_h : UInt<8>, flip in_v : UInt<8>, out_h : UInt<16>, out_v : UInt<16>, out : UInt<16>}

    reg res : UInt<16>, clock with :
      reset => (reset, UInt<16>("h0")) @[ProcElem.scala 26:21]
    reg hreg : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[ProcElem.scala 27:21]
    reg vreg : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[ProcElem.scala 28:21]
    node _res_T = mul(io.in_h, io.in_v) @[ProcElem.scala 31:25]
    node _res_T_1 = add(res, _res_T) @[ProcElem.scala 31:14]
    node _res_T_2 = tail(_res_T_1, 1) @[ProcElem.scala 31:14]
    res <= _res_T_2 @[ProcElem.scala 31:7]
    hreg <= io.in_h @[ProcElem.scala 34:8]
    vreg <= io.in_v @[ProcElem.scala 35:8]
    io.out_h <= hreg @[ProcElem.scala 37:12]
    io.out_v <= vreg @[ProcElem.scala 38:12]
    io.out <= res @[ProcElem.scala 39:10]

  module ProcElem_3 :
    input clock : Clock
    input reset : Reset
    output io : { flip in_h : UInt<8>, flip in_v : UInt<8>, out_h : UInt<16>, out_v : UInt<16>, out : UInt<16>}

    reg res : UInt<16>, clock with :
      reset => (reset, UInt<16>("h0")) @[ProcElem.scala 26:21]
    reg hreg : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[ProcElem.scala 27:21]
    reg vreg : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[ProcElem.scala 28:21]
    node _res_T = mul(io.in_h, io.in_v) @[ProcElem.scala 31:25]
    node _res_T_1 = add(res, _res_T) @[ProcElem.scala 31:14]
    node _res_T_2 = tail(_res_T_1, 1) @[ProcElem.scala 31:14]
    res <= _res_T_2 @[ProcElem.scala 31:7]
    hreg <= io.in_h @[ProcElem.scala 34:8]
    vreg <= io.in_v @[ProcElem.scala 35:8]
    io.out_h <= hreg @[ProcElem.scala 37:12]
    io.out_v <= vreg @[ProcElem.scala 38:12]
    io.out <= res @[ProcElem.scala 39:10]

  module SMatMul :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip in_a : UInt<8>[2], flip in_b : UInt<8>[2], out : UInt<16>[4]}

    inst ProcElem of ProcElem @[MatMul.scala 20:47]
    ProcElem.clock <= clock
    ProcElem.reset <= reset
    inst ProcElem_1 of ProcElem_1 @[MatMul.scala 20:47]
    ProcElem_1.clock <= clock
    ProcElem_1.reset <= reset
    inst ProcElem_2 of ProcElem_2 @[MatMul.scala 20:47]
    ProcElem_2.clock <= clock
    ProcElem_2.reset <= reset
    inst ProcElem_3 of ProcElem_3 @[MatMul.scala 20:47]
    ProcElem_3.clock <= clock
    ProcElem_3.reset <= reset
    wire p_elems : { flip in_h : UInt<8>, flip in_v : UInt<8>, out_h : UInt<16>, out_v : UInt<16>, out : UInt<16>}[4] @[MatMul.scala 20:24]
    p_elems[0].out <= ProcElem.io.out @[MatMul.scala 20:24]
    p_elems[0].out_v <= ProcElem.io.out_v @[MatMul.scala 20:24]
    p_elems[0].out_h <= ProcElem.io.out_h @[MatMul.scala 20:24]
    ProcElem.io.in_v <= p_elems[0].in_v @[MatMul.scala 20:24]
    ProcElem.io.in_h <= p_elems[0].in_h @[MatMul.scala 20:24]
    p_elems[1].out <= ProcElem_1.io.out @[MatMul.scala 20:24]
    p_elems[1].out_v <= ProcElem_1.io.out_v @[MatMul.scala 20:24]
    p_elems[1].out_h <= ProcElem_1.io.out_h @[MatMul.scala 20:24]
    ProcElem_1.io.in_v <= p_elems[1].in_v @[MatMul.scala 20:24]
    ProcElem_1.io.in_h <= p_elems[1].in_h @[MatMul.scala 20:24]
    p_elems[2].out <= ProcElem_2.io.out @[MatMul.scala 20:24]
    p_elems[2].out_v <= ProcElem_2.io.out_v @[MatMul.scala 20:24]
    p_elems[2].out_h <= ProcElem_2.io.out_h @[MatMul.scala 20:24]
    ProcElem_2.io.in_v <= p_elems[2].in_v @[MatMul.scala 20:24]
    ProcElem_2.io.in_h <= p_elems[2].in_h @[MatMul.scala 20:24]
    p_elems[3].out <= ProcElem_3.io.out @[MatMul.scala 20:24]
    p_elems[3].out_v <= ProcElem_3.io.out_v @[MatMul.scala 20:24]
    p_elems[3].out_h <= ProcElem_3.io.out_h @[MatMul.scala 20:24]
    ProcElem_3.io.in_v <= p_elems[3].in_v @[MatMul.scala 20:24]
    ProcElem_3.io.in_h <= p_elems[3].in_h @[MatMul.scala 20:24]
    wire h_wires : UInt<8>[2] @[MatMul.scala 21:21]
    wire v_wires : UInt<8>[2] @[MatMul.scala 22:21]
    io.out[0] <= p_elems[0].out @[MatMul.scala 31:20]
    p_elems[0].in_h <= io.in_a[0] @[MatMul.scala 35:42]
    h_wires[0] <= p_elems[0].out_h @[MatMul.scala 38:49]
    p_elems[0].in_v <= io.in_b[0] @[MatMul.scala 40:42]
    v_wires[0] <= p_elems[0].out_v @[MatMul.scala 43:49]
    io.out[2] <= p_elems[2].out @[MatMul.scala 31:20]
    p_elems[2].in_h <= io.in_a[1] @[MatMul.scala 35:42]
    h_wires[1] <= p_elems[2].out_h @[MatMul.scala 38:49]
    p_elems[2].in_v <= v_wires[0] @[MatMul.scala 41:42]
    io.out[1] <= p_elems[1].out @[MatMul.scala 31:20]
    p_elems[1].in_h <= h_wires[0] @[MatMul.scala 36:42]
    p_elems[1].in_v <= io.in_b[1] @[MatMul.scala 40:42]
    v_wires[1] <= p_elems[1].out_v @[MatMul.scala 43:49]
    io.out[3] <= p_elems[3].out @[MatMul.scala 31:20]
    p_elems[3].in_h <= h_wires[1] @[MatMul.scala 36:42]
    p_elems[3].in_v <= v_wires[1] @[MatMul.scala 41:42]

