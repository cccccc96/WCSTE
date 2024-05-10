module ProcElem(
  input         clock,
  input         reset,
  input  [7:0]  io_in_h,
  input  [7:0]  io_in_v,
  output [15:0] io_out_h,
  output [15:0] io_out_v,
  output [15:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  reg [15:0] res; // @[ProcElem.scala 26:21]
  reg [7:0] hreg; // @[ProcElem.scala 27:21]
  reg [7:0] vreg; // @[ProcElem.scala 28:21]
  wire [15:0] _res_T = io_in_h * io_in_v; // @[ProcElem.scala 31:25]
  wire [15:0] _res_T_2 = res + _res_T; // @[ProcElem.scala 31:14]
  assign io_out_h = {{8'd0}, hreg}; // @[ProcElem.scala 37:12]
  assign io_out_v = {{8'd0}, vreg}; // @[ProcElem.scala 38:12]
  assign io_out = res; // @[ProcElem.scala 39:10]
  always @(posedge clock) begin
    if (reset) begin // @[ProcElem.scala 26:21]
      res <= 16'h0; // @[ProcElem.scala 26:21]
    end else begin
      res <= _res_T_2; // @[ProcElem.scala 31:7]
    end
    if (reset) begin // @[ProcElem.scala 27:21]
      hreg <= 8'h0; // @[ProcElem.scala 27:21]
    end else begin
      hreg <= io_in_h; // @[ProcElem.scala 34:8]
    end
    if (reset) begin // @[ProcElem.scala 28:21]
      vreg <= 8'h0; // @[ProcElem.scala 28:21]
    end else begin
      vreg <= io_in_v; // @[ProcElem.scala 35:8]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  res = _RAND_0[15:0];
  _RAND_1 = {1{`RANDOM}};
  hreg = _RAND_1[7:0];
  _RAND_2 = {1{`RANDOM}};
  vreg = _RAND_2[7:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module SMatMul(
  input         clock,
  input         reset,
  input  [7:0]  io_in_a_0,
  input  [7:0]  io_in_a_1,
  input  [7:0]  io_in_b_0,
  input  [7:0]  io_in_b_1,
  output [15:0] io_out_0,
  output [15:0] io_out_1,
  output [15:0] io_out_2,
  output [15:0] io_out_3
);
  wire  ProcElem_clock; // @[MatMul.scala 20:47]
  wire  ProcElem_reset; // @[MatMul.scala 20:47]
  wire [7:0] ProcElem_io_in_h; // @[MatMul.scala 20:47]
  wire [7:0] ProcElem_io_in_v; // @[MatMul.scala 20:47]
  wire [15:0] ProcElem_io_out_h; // @[MatMul.scala 20:47]
  wire [15:0] ProcElem_io_out_v; // @[MatMul.scala 20:47]
  wire [15:0] ProcElem_io_out; // @[MatMul.scala 20:47]
  wire  ProcElem_1_clock; // @[MatMul.scala 20:47]
  wire  ProcElem_1_reset; // @[MatMul.scala 20:47]
  wire [7:0] ProcElem_1_io_in_h; // @[MatMul.scala 20:47]
  wire [7:0] ProcElem_1_io_in_v; // @[MatMul.scala 20:47]
  wire [15:0] ProcElem_1_io_out_h; // @[MatMul.scala 20:47]
  wire [15:0] ProcElem_1_io_out_v; // @[MatMul.scala 20:47]
  wire [15:0] ProcElem_1_io_out; // @[MatMul.scala 20:47]
  wire  ProcElem_2_clock; // @[MatMul.scala 20:47]
  wire  ProcElem_2_reset; // @[MatMul.scala 20:47]
  wire [7:0] ProcElem_2_io_in_h; // @[MatMul.scala 20:47]
  wire [7:0] ProcElem_2_io_in_v; // @[MatMul.scala 20:47]
  wire [15:0] ProcElem_2_io_out_h; // @[MatMul.scala 20:47]
  wire [15:0] ProcElem_2_io_out_v; // @[MatMul.scala 20:47]
  wire [15:0] ProcElem_2_io_out; // @[MatMul.scala 20:47]
  wire  ProcElem_3_clock; // @[MatMul.scala 20:47]
  wire  ProcElem_3_reset; // @[MatMul.scala 20:47]
  wire [7:0] ProcElem_3_io_in_h; // @[MatMul.scala 20:47]
  wire [7:0] ProcElem_3_io_in_v; // @[MatMul.scala 20:47]
  wire [15:0] ProcElem_3_io_out_h; // @[MatMul.scala 20:47]
  wire [15:0] ProcElem_3_io_out_v; // @[MatMul.scala 20:47]
  wire [15:0] ProcElem_3_io_out; // @[MatMul.scala 20:47]
  wire [15:0] p_elems_0_out_h = ProcElem_io_out_h; // @[MatMul.scala 20:{24,24}]
  wire [15:0] p_elems_0_out_v = ProcElem_io_out_v; // @[MatMul.scala 20:{24,24}]
  wire [15:0] p_elems_1_out_v = ProcElem_1_io_out_v; // @[MatMul.scala 20:{24,24}]
  wire [15:0] p_elems_2_out_h = ProcElem_2_io_out_h; // @[MatMul.scala 20:{24,24}]
  ProcElem ProcElem ( // @[MatMul.scala 20:47]
    .clock(ProcElem_clock),
    .reset(ProcElem_reset),
    .io_in_h(ProcElem_io_in_h),
    .io_in_v(ProcElem_io_in_v),
    .io_out_h(ProcElem_io_out_h),
    .io_out_v(ProcElem_io_out_v),
    .io_out(ProcElem_io_out)
  );
  ProcElem ProcElem_1 ( // @[MatMul.scala 20:47]
    .clock(ProcElem_1_clock),
    .reset(ProcElem_1_reset),
    .io_in_h(ProcElem_1_io_in_h),
    .io_in_v(ProcElem_1_io_in_v),
    .io_out_h(ProcElem_1_io_out_h),
    .io_out_v(ProcElem_1_io_out_v),
    .io_out(ProcElem_1_io_out)
  );
  ProcElem ProcElem_2 ( // @[MatMul.scala 20:47]
    .clock(ProcElem_2_clock),
    .reset(ProcElem_2_reset),
    .io_in_h(ProcElem_2_io_in_h),
    .io_in_v(ProcElem_2_io_in_v),
    .io_out_h(ProcElem_2_io_out_h),
    .io_out_v(ProcElem_2_io_out_v),
    .io_out(ProcElem_2_io_out)
  );
  ProcElem ProcElem_3 ( // @[MatMul.scala 20:47]
    .clock(ProcElem_3_clock),
    .reset(ProcElem_3_reset),
    .io_in_h(ProcElem_3_io_in_h),
    .io_in_v(ProcElem_3_io_in_v),
    .io_out_h(ProcElem_3_io_out_h),
    .io_out_v(ProcElem_3_io_out_v),
    .io_out(ProcElem_3_io_out)
  );
  assign io_out_0 = ProcElem_io_out; // @[MatMul.scala 20:{24,24}]
  assign io_out_1 = ProcElem_1_io_out; // @[MatMul.scala 20:{24,24}]
  assign io_out_2 = ProcElem_2_io_out; // @[MatMul.scala 20:{24,24}]
  assign io_out_3 = ProcElem_3_io_out; // @[MatMul.scala 20:{24,24}]
  assign ProcElem_clock = clock;
  assign ProcElem_reset = reset;
  assign ProcElem_io_in_h = io_in_a_0; // @[MatMul.scala 20:24 35:42]
  assign ProcElem_io_in_v = io_in_b_0; // @[MatMul.scala 20:24 40:42]
  assign ProcElem_1_clock = clock;
  assign ProcElem_1_reset = reset;
  assign ProcElem_1_io_in_h = p_elems_0_out_h[7:0]; // @[MatMul.scala 21:21 38:49]
  assign ProcElem_1_io_in_v = io_in_b_1; // @[MatMul.scala 20:24 40:42]
  assign ProcElem_2_clock = clock;
  assign ProcElem_2_reset = reset;
  assign ProcElem_2_io_in_h = io_in_a_1; // @[MatMul.scala 20:24 35:42]
  assign ProcElem_2_io_in_v = p_elems_0_out_v[7:0]; // @[MatMul.scala 22:21 43:49]
  assign ProcElem_3_clock = clock;
  assign ProcElem_3_reset = reset;
  assign ProcElem_3_io_in_h = p_elems_2_out_h[7:0]; // @[MatMul.scala 21:21 38:49]
  assign ProcElem_3_io_in_v = p_elems_1_out_v[7:0]; // @[MatMul.scala 22:21 43:49]
endmodule
