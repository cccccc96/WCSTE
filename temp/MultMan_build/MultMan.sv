module MultCell(
  input         clock,
  input         reset,
  input         io_rstn,
  input         io_en,
  input  [23:0] io_mult1,
  input  [11:0] io_mult2,
  input  [23:0] io_mult1_acci,
  output [23:0] io_mult1_o,
  output [11:0] io_mult2_shift,
  output [23:0] io_mult1_acco,
  output        io_rdy
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  reg [11:0] mult2_shift_reg; // @[mult.scala 20:32]
  reg [23:0] mult1_o_reg; // @[mult.scala 21:28]
  reg [23:0] mult1_acc_reg; // @[mult.scala 22:30]
  reg  rdy_reg; // @[mult.scala 23:24]
  wire [11:0] _mult2_shift_reg_T = {{1'd0}, io_mult2[11:1]}; // @[mult.scala 32:33]
  wire [24:0] _mult1_o_reg_T = {io_mult1, 1'h0}; // @[mult.scala 33:29]
  wire [23:0] _mult1_acc_reg_T_1 = io_mult1_acci + io_mult1; // @[mult.scala 35:38]
  wire [24:0] _GEN_3 = io_en ? _mult1_o_reg_T : 25'h0; // @[mult.scala 30:21 33:17 42:17]
  wire [24:0] _GEN_6 = ~io_rstn ? 25'h0 : _GEN_3; // @[mult.scala 25:18 27:17]
  wire [24:0] _GEN_10 = reset ? 25'h0 : _GEN_6; // @[mult.scala 21:{28,28}]
  assign io_mult1_o = mult1_o_reg; // @[mult.scala 46:14]
  assign io_mult2_shift = mult2_shift_reg; // @[mult.scala 47:18]
  assign io_mult1_acco = mult1_acc_reg; // @[mult.scala 48:17]
  assign io_rdy = rdy_reg; // @[mult.scala 49:10]
  always @(posedge clock) begin
    if (reset) begin // @[mult.scala 20:32]
      mult2_shift_reg <= 12'h0; // @[mult.scala 20:32]
    end else if (~io_rstn) begin // @[mult.scala 25:18]
      mult2_shift_reg <= 12'h0; // @[mult.scala 26:21]
    end else if (io_en) begin // @[mult.scala 30:21]
      mult2_shift_reg <= _mult2_shift_reg_T; // @[mult.scala 32:21]
    end else begin
      mult2_shift_reg <= 12'h0; // @[mult.scala 41:21]
    end
    mult1_o_reg <= _GEN_10[23:0]; // @[mult.scala 21:{28,28}]
    if (reset) begin // @[mult.scala 22:30]
      mult1_acc_reg <= 24'h0; // @[mult.scala 22:30]
    end else if (~io_rstn) begin // @[mult.scala 25:18]
      mult1_acc_reg <= 24'h0; // @[mult.scala 28:19]
    end else if (io_en) begin // @[mult.scala 30:21]
      if (io_mult2[0]) begin // @[mult.scala 34:23]
        mult1_acc_reg <= _mult1_acc_reg_T_1; // @[mult.scala 35:21]
      end else begin
        mult1_acc_reg <= io_mult1_acci; // @[mult.scala 37:21]
      end
    end else begin
      mult1_acc_reg <= 24'h0; // @[mult.scala 43:19]
    end
    if (reset) begin // @[mult.scala 23:24]
      rdy_reg <= 1'h0; // @[mult.scala 23:24]
    end else if (~io_rstn) begin // @[mult.scala 25:18]
      rdy_reg <= 1'h0; // @[mult.scala 29:13]
    end else begin
      rdy_reg <= io_en;
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
  mult2_shift_reg = _RAND_0[11:0];
  _RAND_1 = {1{`RANDOM}};
  mult1_o_reg = _RAND_1[23:0];
  _RAND_2 = {1{`RANDOM}};
  mult1_acc_reg = _RAND_2[23:0];
  _RAND_3 = {1{`RANDOM}};
  rdy_reg = _RAND_3[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module MultMan(
  input         clock,
  input         reset,
  input         io_rstn,
  input         io_data_rdy,
  input  [11:0] io_mult1,
  input  [11:0] io_mult2,
  output        io_res_rdy,
  output [23:0] io_res
);
  wire  u_mult_step0_clock; // @[mult.scala 70:28]
  wire  u_mult_step0_reset; // @[mult.scala 70:28]
  wire  u_mult_step0_io_rstn; // @[mult.scala 70:28]
  wire  u_mult_step0_io_en; // @[mult.scala 70:28]
  wire [23:0] u_mult_step0_io_mult1; // @[mult.scala 70:28]
  wire [11:0] u_mult_step0_io_mult2; // @[mult.scala 70:28]
  wire [23:0] u_mult_step0_io_mult1_acci; // @[mult.scala 70:28]
  wire [23:0] u_mult_step0_io_mult1_o; // @[mult.scala 70:28]
  wire [11:0] u_mult_step0_io_mult2_shift; // @[mult.scala 70:28]
  wire [23:0] u_mult_step0_io_mult1_acco; // @[mult.scala 70:28]
  wire  u_mult_step0_io_rdy; // @[mult.scala 70:28]
  wire  u_mult_step_clock; // @[mult.scala 82:29]
  wire  u_mult_step_reset; // @[mult.scala 82:29]
  wire  u_mult_step_io_rstn; // @[mult.scala 82:29]
  wire  u_mult_step_io_en; // @[mult.scala 82:29]
  wire [23:0] u_mult_step_io_mult1; // @[mult.scala 82:29]
  wire [11:0] u_mult_step_io_mult2; // @[mult.scala 82:29]
  wire [23:0] u_mult_step_io_mult1_acci; // @[mult.scala 82:29]
  wire [23:0] u_mult_step_io_mult1_o; // @[mult.scala 82:29]
  wire [11:0] u_mult_step_io_mult2_shift; // @[mult.scala 82:29]
  wire [23:0] u_mult_step_io_mult1_acco; // @[mult.scala 82:29]
  wire  u_mult_step_io_rdy; // @[mult.scala 82:29]
  wire  u_mult_step_1_clock; // @[mult.scala 82:29]
  wire  u_mult_step_1_reset; // @[mult.scala 82:29]
  wire  u_mult_step_1_io_rstn; // @[mult.scala 82:29]
  wire  u_mult_step_1_io_en; // @[mult.scala 82:29]
  wire [23:0] u_mult_step_1_io_mult1; // @[mult.scala 82:29]
  wire [11:0] u_mult_step_1_io_mult2; // @[mult.scala 82:29]
  wire [23:0] u_mult_step_1_io_mult1_acci; // @[mult.scala 82:29]
  wire [23:0] u_mult_step_1_io_mult1_o; // @[mult.scala 82:29]
  wire [11:0] u_mult_step_1_io_mult2_shift; // @[mult.scala 82:29]
  wire [23:0] u_mult_step_1_io_mult1_acco; // @[mult.scala 82:29]
  wire  u_mult_step_1_io_rdy; // @[mult.scala 82:29]
  wire  u_mult_step_2_clock; // @[mult.scala 82:29]
  wire  u_mult_step_2_reset; // @[mult.scala 82:29]
  wire  u_mult_step_2_io_rstn; // @[mult.scala 82:29]
  wire  u_mult_step_2_io_en; // @[mult.scala 82:29]
  wire [23:0] u_mult_step_2_io_mult1; // @[mult.scala 82:29]
  wire [11:0] u_mult_step_2_io_mult2; // @[mult.scala 82:29]
  wire [23:0] u_mult_step_2_io_mult1_acci; // @[mult.scala 82:29]
  wire [23:0] u_mult_step_2_io_mult1_o; // @[mult.scala 82:29]
  wire [11:0] u_mult_step_2_io_mult2_shift; // @[mult.scala 82:29]
  wire [23:0] u_mult_step_2_io_mult1_acco; // @[mult.scala 82:29]
  wire  u_mult_step_2_io_rdy; // @[mult.scala 82:29]
  wire  u_mult_step_3_clock; // @[mult.scala 82:29]
  wire  u_mult_step_3_reset; // @[mult.scala 82:29]
  wire  u_mult_step_3_io_rstn; // @[mult.scala 82:29]
  wire  u_mult_step_3_io_en; // @[mult.scala 82:29]
  wire [23:0] u_mult_step_3_io_mult1; // @[mult.scala 82:29]
  wire [11:0] u_mult_step_3_io_mult2; // @[mult.scala 82:29]
  wire [23:0] u_mult_step_3_io_mult1_acci; // @[mult.scala 82:29]
  wire [23:0] u_mult_step_3_io_mult1_o; // @[mult.scala 82:29]
  wire [11:0] u_mult_step_3_io_mult2_shift; // @[mult.scala 82:29]
  wire [23:0] u_mult_step_3_io_mult1_acco; // @[mult.scala 82:29]
  wire  u_mult_step_3_io_rdy; // @[mult.scala 82:29]
  wire  u_mult_step_4_clock; // @[mult.scala 82:29]
  wire  u_mult_step_4_reset; // @[mult.scala 82:29]
  wire  u_mult_step_4_io_rstn; // @[mult.scala 82:29]
  wire  u_mult_step_4_io_en; // @[mult.scala 82:29]
  wire [23:0] u_mult_step_4_io_mult1; // @[mult.scala 82:29]
  wire [11:0] u_mult_step_4_io_mult2; // @[mult.scala 82:29]
  wire [23:0] u_mult_step_4_io_mult1_acci; // @[mult.scala 82:29]
  wire [23:0] u_mult_step_4_io_mult1_o; // @[mult.scala 82:29]
  wire [11:0] u_mult_step_4_io_mult2_shift; // @[mult.scala 82:29]
  wire [23:0] u_mult_step_4_io_mult1_acco; // @[mult.scala 82:29]
  wire  u_mult_step_4_io_rdy; // @[mult.scala 82:29]
  wire  u_mult_step_5_clock; // @[mult.scala 82:29]
  wire  u_mult_step_5_reset; // @[mult.scala 82:29]
  wire  u_mult_step_5_io_rstn; // @[mult.scala 82:29]
  wire  u_mult_step_5_io_en; // @[mult.scala 82:29]
  wire [23:0] u_mult_step_5_io_mult1; // @[mult.scala 82:29]
  wire [11:0] u_mult_step_5_io_mult2; // @[mult.scala 82:29]
  wire [23:0] u_mult_step_5_io_mult1_acci; // @[mult.scala 82:29]
  wire [23:0] u_mult_step_5_io_mult1_o; // @[mult.scala 82:29]
  wire [11:0] u_mult_step_5_io_mult2_shift; // @[mult.scala 82:29]
  wire [23:0] u_mult_step_5_io_mult1_acco; // @[mult.scala 82:29]
  wire  u_mult_step_5_io_rdy; // @[mult.scala 82:29]
  wire  u_mult_step_6_clock; // @[mult.scala 82:29]
  wire  u_mult_step_6_reset; // @[mult.scala 82:29]
  wire  u_mult_step_6_io_rstn; // @[mult.scala 82:29]
  wire  u_mult_step_6_io_en; // @[mult.scala 82:29]
  wire [23:0] u_mult_step_6_io_mult1; // @[mult.scala 82:29]
  wire [11:0] u_mult_step_6_io_mult2; // @[mult.scala 82:29]
  wire [23:0] u_mult_step_6_io_mult1_acci; // @[mult.scala 82:29]
  wire [23:0] u_mult_step_6_io_mult1_o; // @[mult.scala 82:29]
  wire [11:0] u_mult_step_6_io_mult2_shift; // @[mult.scala 82:29]
  wire [23:0] u_mult_step_6_io_mult1_acco; // @[mult.scala 82:29]
  wire  u_mult_step_6_io_rdy; // @[mult.scala 82:29]
  wire  u_mult_step_7_clock; // @[mult.scala 82:29]
  wire  u_mult_step_7_reset; // @[mult.scala 82:29]
  wire  u_mult_step_7_io_rstn; // @[mult.scala 82:29]
  wire  u_mult_step_7_io_en; // @[mult.scala 82:29]
  wire [23:0] u_mult_step_7_io_mult1; // @[mult.scala 82:29]
  wire [11:0] u_mult_step_7_io_mult2; // @[mult.scala 82:29]
  wire [23:0] u_mult_step_7_io_mult1_acci; // @[mult.scala 82:29]
  wire [23:0] u_mult_step_7_io_mult1_o; // @[mult.scala 82:29]
  wire [11:0] u_mult_step_7_io_mult2_shift; // @[mult.scala 82:29]
  wire [23:0] u_mult_step_7_io_mult1_acco; // @[mult.scala 82:29]
  wire  u_mult_step_7_io_rdy; // @[mult.scala 82:29]
  wire  u_mult_step_8_clock; // @[mult.scala 82:29]
  wire  u_mult_step_8_reset; // @[mult.scala 82:29]
  wire  u_mult_step_8_io_rstn; // @[mult.scala 82:29]
  wire  u_mult_step_8_io_en; // @[mult.scala 82:29]
  wire [23:0] u_mult_step_8_io_mult1; // @[mult.scala 82:29]
  wire [11:0] u_mult_step_8_io_mult2; // @[mult.scala 82:29]
  wire [23:0] u_mult_step_8_io_mult1_acci; // @[mult.scala 82:29]
  wire [23:0] u_mult_step_8_io_mult1_o; // @[mult.scala 82:29]
  wire [11:0] u_mult_step_8_io_mult2_shift; // @[mult.scala 82:29]
  wire [23:0] u_mult_step_8_io_mult1_acco; // @[mult.scala 82:29]
  wire  u_mult_step_8_io_rdy; // @[mult.scala 82:29]
  wire  u_mult_step_9_clock; // @[mult.scala 82:29]
  wire  u_mult_step_9_reset; // @[mult.scala 82:29]
  wire  u_mult_step_9_io_rstn; // @[mult.scala 82:29]
  wire  u_mult_step_9_io_en; // @[mult.scala 82:29]
  wire [23:0] u_mult_step_9_io_mult1; // @[mult.scala 82:29]
  wire [11:0] u_mult_step_9_io_mult2; // @[mult.scala 82:29]
  wire [23:0] u_mult_step_9_io_mult1_acci; // @[mult.scala 82:29]
  wire [23:0] u_mult_step_9_io_mult1_o; // @[mult.scala 82:29]
  wire [11:0] u_mult_step_9_io_mult2_shift; // @[mult.scala 82:29]
  wire [23:0] u_mult_step_9_io_mult1_acco; // @[mult.scala 82:29]
  wire  u_mult_step_9_io_rdy; // @[mult.scala 82:29]
  wire  u_mult_step_10_clock; // @[mult.scala 82:29]
  wire  u_mult_step_10_reset; // @[mult.scala 82:29]
  wire  u_mult_step_10_io_rstn; // @[mult.scala 82:29]
  wire  u_mult_step_10_io_en; // @[mult.scala 82:29]
  wire [23:0] u_mult_step_10_io_mult1; // @[mult.scala 82:29]
  wire [11:0] u_mult_step_10_io_mult2; // @[mult.scala 82:29]
  wire [23:0] u_mult_step_10_io_mult1_acci; // @[mult.scala 82:29]
  wire [23:0] u_mult_step_10_io_mult1_o; // @[mult.scala 82:29]
  wire [11:0] u_mult_step_10_io_mult2_shift; // @[mult.scala 82:29]
  wire [23:0] u_mult_step_10_io_mult1_acco; // @[mult.scala 82:29]
  wire  u_mult_step_10_io_rdy; // @[mult.scala 82:29]
  MultCell u_mult_step0 ( // @[mult.scala 70:28]
    .clock(u_mult_step0_clock),
    .reset(u_mult_step0_reset),
    .io_rstn(u_mult_step0_io_rstn),
    .io_en(u_mult_step0_io_en),
    .io_mult1(u_mult_step0_io_mult1),
    .io_mult2(u_mult_step0_io_mult2),
    .io_mult1_acci(u_mult_step0_io_mult1_acci),
    .io_mult1_o(u_mult_step0_io_mult1_o),
    .io_mult2_shift(u_mult_step0_io_mult2_shift),
    .io_mult1_acco(u_mult_step0_io_mult1_acco),
    .io_rdy(u_mult_step0_io_rdy)
  );
  MultCell u_mult_step ( // @[mult.scala 82:29]
    .clock(u_mult_step_clock),
    .reset(u_mult_step_reset),
    .io_rstn(u_mult_step_io_rstn),
    .io_en(u_mult_step_io_en),
    .io_mult1(u_mult_step_io_mult1),
    .io_mult2(u_mult_step_io_mult2),
    .io_mult1_acci(u_mult_step_io_mult1_acci),
    .io_mult1_o(u_mult_step_io_mult1_o),
    .io_mult2_shift(u_mult_step_io_mult2_shift),
    .io_mult1_acco(u_mult_step_io_mult1_acco),
    .io_rdy(u_mult_step_io_rdy)
  );
  MultCell u_mult_step_1 ( // @[mult.scala 82:29]
    .clock(u_mult_step_1_clock),
    .reset(u_mult_step_1_reset),
    .io_rstn(u_mult_step_1_io_rstn),
    .io_en(u_mult_step_1_io_en),
    .io_mult1(u_mult_step_1_io_mult1),
    .io_mult2(u_mult_step_1_io_mult2),
    .io_mult1_acci(u_mult_step_1_io_mult1_acci),
    .io_mult1_o(u_mult_step_1_io_mult1_o),
    .io_mult2_shift(u_mult_step_1_io_mult2_shift),
    .io_mult1_acco(u_mult_step_1_io_mult1_acco),
    .io_rdy(u_mult_step_1_io_rdy)
  );
  MultCell u_mult_step_2 ( // @[mult.scala 82:29]
    .clock(u_mult_step_2_clock),
    .reset(u_mult_step_2_reset),
    .io_rstn(u_mult_step_2_io_rstn),
    .io_en(u_mult_step_2_io_en),
    .io_mult1(u_mult_step_2_io_mult1),
    .io_mult2(u_mult_step_2_io_mult2),
    .io_mult1_acci(u_mult_step_2_io_mult1_acci),
    .io_mult1_o(u_mult_step_2_io_mult1_o),
    .io_mult2_shift(u_mult_step_2_io_mult2_shift),
    .io_mult1_acco(u_mult_step_2_io_mult1_acco),
    .io_rdy(u_mult_step_2_io_rdy)
  );
  MultCell u_mult_step_3 ( // @[mult.scala 82:29]
    .clock(u_mult_step_3_clock),
    .reset(u_mult_step_3_reset),
    .io_rstn(u_mult_step_3_io_rstn),
    .io_en(u_mult_step_3_io_en),
    .io_mult1(u_mult_step_3_io_mult1),
    .io_mult2(u_mult_step_3_io_mult2),
    .io_mult1_acci(u_mult_step_3_io_mult1_acci),
    .io_mult1_o(u_mult_step_3_io_mult1_o),
    .io_mult2_shift(u_mult_step_3_io_mult2_shift),
    .io_mult1_acco(u_mult_step_3_io_mult1_acco),
    .io_rdy(u_mult_step_3_io_rdy)
  );
  MultCell u_mult_step_4 ( // @[mult.scala 82:29]
    .clock(u_mult_step_4_clock),
    .reset(u_mult_step_4_reset),
    .io_rstn(u_mult_step_4_io_rstn),
    .io_en(u_mult_step_4_io_en),
    .io_mult1(u_mult_step_4_io_mult1),
    .io_mult2(u_mult_step_4_io_mult2),
    .io_mult1_acci(u_mult_step_4_io_mult1_acci),
    .io_mult1_o(u_mult_step_4_io_mult1_o),
    .io_mult2_shift(u_mult_step_4_io_mult2_shift),
    .io_mult1_acco(u_mult_step_4_io_mult1_acco),
    .io_rdy(u_mult_step_4_io_rdy)
  );
  MultCell u_mult_step_5 ( // @[mult.scala 82:29]
    .clock(u_mult_step_5_clock),
    .reset(u_mult_step_5_reset),
    .io_rstn(u_mult_step_5_io_rstn),
    .io_en(u_mult_step_5_io_en),
    .io_mult1(u_mult_step_5_io_mult1),
    .io_mult2(u_mult_step_5_io_mult2),
    .io_mult1_acci(u_mult_step_5_io_mult1_acci),
    .io_mult1_o(u_mult_step_5_io_mult1_o),
    .io_mult2_shift(u_mult_step_5_io_mult2_shift),
    .io_mult1_acco(u_mult_step_5_io_mult1_acco),
    .io_rdy(u_mult_step_5_io_rdy)
  );
  MultCell u_mult_step_6 ( // @[mult.scala 82:29]
    .clock(u_mult_step_6_clock),
    .reset(u_mult_step_6_reset),
    .io_rstn(u_mult_step_6_io_rstn),
    .io_en(u_mult_step_6_io_en),
    .io_mult1(u_mult_step_6_io_mult1),
    .io_mult2(u_mult_step_6_io_mult2),
    .io_mult1_acci(u_mult_step_6_io_mult1_acci),
    .io_mult1_o(u_mult_step_6_io_mult1_o),
    .io_mult2_shift(u_mult_step_6_io_mult2_shift),
    .io_mult1_acco(u_mult_step_6_io_mult1_acco),
    .io_rdy(u_mult_step_6_io_rdy)
  );
  MultCell u_mult_step_7 ( // @[mult.scala 82:29]
    .clock(u_mult_step_7_clock),
    .reset(u_mult_step_7_reset),
    .io_rstn(u_mult_step_7_io_rstn),
    .io_en(u_mult_step_7_io_en),
    .io_mult1(u_mult_step_7_io_mult1),
    .io_mult2(u_mult_step_7_io_mult2),
    .io_mult1_acci(u_mult_step_7_io_mult1_acci),
    .io_mult1_o(u_mult_step_7_io_mult1_o),
    .io_mult2_shift(u_mult_step_7_io_mult2_shift),
    .io_mult1_acco(u_mult_step_7_io_mult1_acco),
    .io_rdy(u_mult_step_7_io_rdy)
  );
  MultCell u_mult_step_8 ( // @[mult.scala 82:29]
    .clock(u_mult_step_8_clock),
    .reset(u_mult_step_8_reset),
    .io_rstn(u_mult_step_8_io_rstn),
    .io_en(u_mult_step_8_io_en),
    .io_mult1(u_mult_step_8_io_mult1),
    .io_mult2(u_mult_step_8_io_mult2),
    .io_mult1_acci(u_mult_step_8_io_mult1_acci),
    .io_mult1_o(u_mult_step_8_io_mult1_o),
    .io_mult2_shift(u_mult_step_8_io_mult2_shift),
    .io_mult1_acco(u_mult_step_8_io_mult1_acco),
    .io_rdy(u_mult_step_8_io_rdy)
  );
  MultCell u_mult_step_9 ( // @[mult.scala 82:29]
    .clock(u_mult_step_9_clock),
    .reset(u_mult_step_9_reset),
    .io_rstn(u_mult_step_9_io_rstn),
    .io_en(u_mult_step_9_io_en),
    .io_mult1(u_mult_step_9_io_mult1),
    .io_mult2(u_mult_step_9_io_mult2),
    .io_mult1_acci(u_mult_step_9_io_mult1_acci),
    .io_mult1_o(u_mult_step_9_io_mult1_o),
    .io_mult2_shift(u_mult_step_9_io_mult2_shift),
    .io_mult1_acco(u_mult_step_9_io_mult1_acco),
    .io_rdy(u_mult_step_9_io_rdy)
  );
  MultCell u_mult_step_10 ( // @[mult.scala 82:29]
    .clock(u_mult_step_10_clock),
    .reset(u_mult_step_10_reset),
    .io_rstn(u_mult_step_10_io_rstn),
    .io_en(u_mult_step_10_io_en),
    .io_mult1(u_mult_step_10_io_mult1),
    .io_mult2(u_mult_step_10_io_mult2),
    .io_mult1_acci(u_mult_step_10_io_mult1_acci),
    .io_mult1_o(u_mult_step_10_io_mult1_o),
    .io_mult2_shift(u_mult_step_10_io_mult2_shift),
    .io_mult1_acco(u_mult_step_10_io_mult1_acco),
    .io_rdy(u_mult_step_10_io_rdy)
  );
  assign io_res_rdy = u_mult_step_10_io_rdy; // @[mult.scala 68:31 91:14]
  assign io_res = u_mult_step_10_io_mult1_acco; // @[mult.scala 67:37 90:20]
  assign u_mult_step0_clock = clock;
  assign u_mult_step0_reset = reset;
  assign u_mult_step0_io_rstn = io_rstn; // @[mult.scala 71:24]
  assign u_mult_step0_io_en = io_data_rdy; // @[mult.scala 72:22]
  assign u_mult_step0_io_mult1 = {12'h0,io_mult1}; // @[Cat.scala 33:92]
  assign u_mult_step0_io_mult2 = io_mult2; // @[mult.scala 74:25]
  assign u_mult_step0_io_mult1_acci = 24'h0; // @[mult.scala 75:30]
  assign u_mult_step_clock = clock;
  assign u_mult_step_reset = reset;
  assign u_mult_step_io_rstn = io_rstn; // @[mult.scala 83:25]
  assign u_mult_step_io_en = u_mult_step0_io_rdy; // @[mult.scala 68:31 79:12]
  assign u_mult_step_io_mult1 = u_mult_step0_io_mult1_o; // @[mult.scala 65:33 76:14]
  assign u_mult_step_io_mult2 = u_mult_step0_io_mult2_shift; // @[mult.scala 66:33 77:14]
  assign u_mult_step_io_mult1_acci = u_mult_step0_io_mult1_acco; // @[mult.scala 67:37 78:18]
  assign u_mult_step_1_clock = clock;
  assign u_mult_step_1_reset = reset;
  assign u_mult_step_1_io_rstn = io_rstn; // @[mult.scala 83:25]
  assign u_mult_step_1_io_en = u_mult_step_io_rdy; // @[mult.scala 68:31 91:14]
  assign u_mult_step_1_io_mult1 = u_mult_step_io_mult1_o; // @[mult.scala 65:33 88:16]
  assign u_mult_step_1_io_mult2 = u_mult_step_io_mult2_shift; // @[mult.scala 66:33 89:16]
  assign u_mult_step_1_io_mult1_acci = u_mult_step_io_mult1_acco; // @[mult.scala 67:37 90:20]
  assign u_mult_step_2_clock = clock;
  assign u_mult_step_2_reset = reset;
  assign u_mult_step_2_io_rstn = io_rstn; // @[mult.scala 83:25]
  assign u_mult_step_2_io_en = u_mult_step_1_io_rdy; // @[mult.scala 68:31 91:14]
  assign u_mult_step_2_io_mult1 = u_mult_step_1_io_mult1_o; // @[mult.scala 65:33 88:16]
  assign u_mult_step_2_io_mult2 = u_mult_step_1_io_mult2_shift; // @[mult.scala 66:33 89:16]
  assign u_mult_step_2_io_mult1_acci = u_mult_step_1_io_mult1_acco; // @[mult.scala 67:37 90:20]
  assign u_mult_step_3_clock = clock;
  assign u_mult_step_3_reset = reset;
  assign u_mult_step_3_io_rstn = io_rstn; // @[mult.scala 83:25]
  assign u_mult_step_3_io_en = u_mult_step_2_io_rdy; // @[mult.scala 68:31 91:14]
  assign u_mult_step_3_io_mult1 = u_mult_step_2_io_mult1_o; // @[mult.scala 65:33 88:16]
  assign u_mult_step_3_io_mult2 = u_mult_step_2_io_mult2_shift; // @[mult.scala 66:33 89:16]
  assign u_mult_step_3_io_mult1_acci = u_mult_step_2_io_mult1_acco; // @[mult.scala 67:37 90:20]
  assign u_mult_step_4_clock = clock;
  assign u_mult_step_4_reset = reset;
  assign u_mult_step_4_io_rstn = io_rstn; // @[mult.scala 83:25]
  assign u_mult_step_4_io_en = u_mult_step_3_io_rdy; // @[mult.scala 68:31 91:14]
  assign u_mult_step_4_io_mult1 = u_mult_step_3_io_mult1_o; // @[mult.scala 65:33 88:16]
  assign u_mult_step_4_io_mult2 = u_mult_step_3_io_mult2_shift; // @[mult.scala 66:33 89:16]
  assign u_mult_step_4_io_mult1_acci = u_mult_step_3_io_mult1_acco; // @[mult.scala 67:37 90:20]
  assign u_mult_step_5_clock = clock;
  assign u_mult_step_5_reset = reset;
  assign u_mult_step_5_io_rstn = io_rstn; // @[mult.scala 83:25]
  assign u_mult_step_5_io_en = u_mult_step_4_io_rdy; // @[mult.scala 68:31 91:14]
  assign u_mult_step_5_io_mult1 = u_mult_step_4_io_mult1_o; // @[mult.scala 65:33 88:16]
  assign u_mult_step_5_io_mult2 = u_mult_step_4_io_mult2_shift; // @[mult.scala 66:33 89:16]
  assign u_mult_step_5_io_mult1_acci = u_mult_step_4_io_mult1_acco; // @[mult.scala 67:37 90:20]
  assign u_mult_step_6_clock = clock;
  assign u_mult_step_6_reset = reset;
  assign u_mult_step_6_io_rstn = io_rstn; // @[mult.scala 83:25]
  assign u_mult_step_6_io_en = u_mult_step_5_io_rdy; // @[mult.scala 68:31 91:14]
  assign u_mult_step_6_io_mult1 = u_mult_step_5_io_mult1_o; // @[mult.scala 65:33 88:16]
  assign u_mult_step_6_io_mult2 = u_mult_step_5_io_mult2_shift; // @[mult.scala 66:33 89:16]
  assign u_mult_step_6_io_mult1_acci = u_mult_step_5_io_mult1_acco; // @[mult.scala 67:37 90:20]
  assign u_mult_step_7_clock = clock;
  assign u_mult_step_7_reset = reset;
  assign u_mult_step_7_io_rstn = io_rstn; // @[mult.scala 83:25]
  assign u_mult_step_7_io_en = u_mult_step_6_io_rdy; // @[mult.scala 68:31 91:14]
  assign u_mult_step_7_io_mult1 = u_mult_step_6_io_mult1_o; // @[mult.scala 65:33 88:16]
  assign u_mult_step_7_io_mult2 = u_mult_step_6_io_mult2_shift; // @[mult.scala 66:33 89:16]
  assign u_mult_step_7_io_mult1_acci = u_mult_step_6_io_mult1_acco; // @[mult.scala 67:37 90:20]
  assign u_mult_step_8_clock = clock;
  assign u_mult_step_8_reset = reset;
  assign u_mult_step_8_io_rstn = io_rstn; // @[mult.scala 83:25]
  assign u_mult_step_8_io_en = u_mult_step_7_io_rdy; // @[mult.scala 68:31 91:14]
  assign u_mult_step_8_io_mult1 = u_mult_step_7_io_mult1_o; // @[mult.scala 65:33 88:16]
  assign u_mult_step_8_io_mult2 = u_mult_step_7_io_mult2_shift; // @[mult.scala 66:33 89:16]
  assign u_mult_step_8_io_mult1_acci = u_mult_step_7_io_mult1_acco; // @[mult.scala 67:37 90:20]
  assign u_mult_step_9_clock = clock;
  assign u_mult_step_9_reset = reset;
  assign u_mult_step_9_io_rstn = io_rstn; // @[mult.scala 83:25]
  assign u_mult_step_9_io_en = u_mult_step_8_io_rdy; // @[mult.scala 68:31 91:14]
  assign u_mult_step_9_io_mult1 = u_mult_step_8_io_mult1_o; // @[mult.scala 65:33 88:16]
  assign u_mult_step_9_io_mult2 = u_mult_step_8_io_mult2_shift; // @[mult.scala 66:33 89:16]
  assign u_mult_step_9_io_mult1_acci = u_mult_step_8_io_mult1_acco; // @[mult.scala 67:37 90:20]
  assign u_mult_step_10_clock = clock;
  assign u_mult_step_10_reset = reset;
  assign u_mult_step_10_io_rstn = io_rstn; // @[mult.scala 83:25]
  assign u_mult_step_10_io_en = u_mult_step_9_io_rdy; // @[mult.scala 68:31 91:14]
  assign u_mult_step_10_io_mult1 = u_mult_step_9_io_mult1_o; // @[mult.scala 65:33 88:16]
  assign u_mult_step_10_io_mult2 = u_mult_step_9_io_mult2_shift; // @[mult.scala 66:33 89:16]
  assign u_mult_step_10_io_mult1_acci = u_mult_step_9_io_mult1_acco; // @[mult.scala 67:37 90:20]
endmodule
