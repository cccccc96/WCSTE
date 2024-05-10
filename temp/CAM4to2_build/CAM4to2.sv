module CAMCell(
  input   clock,
  input   reset,
  input   io_write,
  input   io_ki,
  input   io_di,
  output  io_lhi,
  output  io_log_oi_cell
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg  oi; // @[cam.scala 17:19]
  wire  ti = io_write & io_di | ~io_write & oi; // @[cam.scala 20:28]
  assign io_lhi = oi & io_ki | ~oi & ~io_ki; // @[cam.scala 23:26]
  assign io_log_oi_cell = oi; // @[cam.scala 24:18]
  always @(posedge clock) begin
    if (reset) begin // @[cam.scala 17:19]
      oi <= 1'h0; // @[cam.scala 17:19]
    end else begin
      oi <= ti; // @[cam.scala 21:6]
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
  oi = _RAND_0[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module CAMLine(
  input        clock,
  input        reset,
  input        io_we,
  input        io_wi,
  input  [1:0] io_key,
  input  [1:0] io_din,
  output       io_hit,
  output [1:0] io_log_camline
);
  wire  cc1_clock; // @[cam.scala 42:19]
  wire  cc1_reset; // @[cam.scala 42:19]
  wire  cc1_io_write; // @[cam.scala 42:19]
  wire  cc1_io_ki; // @[cam.scala 42:19]
  wire  cc1_io_di; // @[cam.scala 42:19]
  wire  cc1_io_lhi; // @[cam.scala 42:19]
  wire  cc1_io_log_oi_cell; // @[cam.scala 42:19]
  wire  cc0_clock; // @[cam.scala 49:19]
  wire  cc0_reset; // @[cam.scala 49:19]
  wire  cc0_io_write; // @[cam.scala 49:19]
  wire  cc0_io_ki; // @[cam.scala 49:19]
  wire  cc0_io_di; // @[cam.scala 49:19]
  wire  cc0_io_lhi; // @[cam.scala 49:19]
  wire  cc0_io_log_oi_cell; // @[cam.scala 49:19]
  wire [2:0] _io_log_camline_T = cc1_io_log_oi_cell * 2'h2; // @[cam.scala 60:60]
  wire [2:0] _GEN_0 = {{2'd0}, cc0_io_log_oi_cell}; // @[cam.scala 60:40]
  wire [2:0] _io_log_camline_T_2 = _GEN_0 + _io_log_camline_T; // @[cam.scala 60:40]
  wire  lhit_1 = cc1_io_lhi; // @[cam.scala 39:18 47:11]
  wire  lhit_0 = cc0_io_lhi; // @[cam.scala 39:18 54:11]
  CAMCell cc1 ( // @[cam.scala 42:19]
    .clock(cc1_clock),
    .reset(cc1_reset),
    .io_write(cc1_io_write),
    .io_ki(cc1_io_ki),
    .io_di(cc1_io_di),
    .io_lhi(cc1_io_lhi),
    .io_log_oi_cell(cc1_io_log_oi_cell)
  );
  CAMCell cc0 ( // @[cam.scala 49:19]
    .clock(cc0_clock),
    .reset(cc0_reset),
    .io_write(cc0_io_write),
    .io_ki(cc0_io_ki),
    .io_di(cc0_io_di),
    .io_lhi(cc0_io_lhi),
    .io_log_oi_cell(cc0_io_log_oi_cell)
  );
  assign io_hit = lhit_1 & lhit_0; // @[cam.scala 62:21]
  assign io_log_camline = _io_log_camline_T_2[1:0]; // @[cam.scala 60:18]
  assign cc1_clock = clock;
  assign cc1_reset = reset;
  assign cc1_io_write = io_we & io_wi; // @[cam.scala 40:18]
  assign cc1_io_ki = io_key[1]; // @[cam.scala 45:22]
  assign cc1_io_di = io_din[1]; // @[cam.scala 46:22]
  assign cc0_clock = clock;
  assign cc0_reset = reset;
  assign cc0_io_write = io_we & io_wi; // @[cam.scala 40:18]
  assign cc0_io_ki = io_key[0]; // @[cam.scala 52:22]
  assign cc0_io_di = io_din[0]; // @[cam.scala 53:22]
endmodule
module CAM4to2(
  input        clock,
  input        reset,
  input        io_we,
  input  [1:0] io_key,
  input  [1:0] io_din,
  input  [3:0] io_waddr,
  output       io_hit,
  output [1:0] io_log_0,
  output [1:0] io_log_1,
  output [1:0] io_log_2,
  output [1:0] io_log_3
);
  wire  cl0_clock; // @[cam.scala 79:19]
  wire  cl0_reset; // @[cam.scala 79:19]
  wire  cl0_io_we; // @[cam.scala 79:19]
  wire  cl0_io_wi; // @[cam.scala 79:19]
  wire [1:0] cl0_io_key; // @[cam.scala 79:19]
  wire [1:0] cl0_io_din; // @[cam.scala 79:19]
  wire  cl0_io_hit; // @[cam.scala 79:19]
  wire [1:0] cl0_io_log_camline; // @[cam.scala 79:19]
  wire  cl1_clock; // @[cam.scala 87:19]
  wire  cl1_reset; // @[cam.scala 87:19]
  wire  cl1_io_we; // @[cam.scala 87:19]
  wire  cl1_io_wi; // @[cam.scala 87:19]
  wire [1:0] cl1_io_key; // @[cam.scala 87:19]
  wire [1:0] cl1_io_din; // @[cam.scala 87:19]
  wire  cl1_io_hit; // @[cam.scala 87:19]
  wire [1:0] cl1_io_log_camline; // @[cam.scala 87:19]
  wire  cl2_clock; // @[cam.scala 95:19]
  wire  cl2_reset; // @[cam.scala 95:19]
  wire  cl2_io_we; // @[cam.scala 95:19]
  wire  cl2_io_wi; // @[cam.scala 95:19]
  wire [1:0] cl2_io_key; // @[cam.scala 95:19]
  wire [1:0] cl2_io_din; // @[cam.scala 95:19]
  wire  cl2_io_hit; // @[cam.scala 95:19]
  wire [1:0] cl2_io_log_camline; // @[cam.scala 95:19]
  wire  cl3_clock; // @[cam.scala 103:19]
  wire  cl3_reset; // @[cam.scala 103:19]
  wire  cl3_io_we; // @[cam.scala 103:19]
  wire  cl3_io_wi; // @[cam.scala 103:19]
  wire [1:0] cl3_io_key; // @[cam.scala 103:19]
  wire [1:0] cl3_io_din; // @[cam.scala 103:19]
  wire  cl3_io_hit; // @[cam.scala 103:19]
  wire [1:0] cl3_io_log_camline; // @[cam.scala 103:19]
  wire  hits_0 = cl0_io_hit; // @[cam.scala 77:18 85:11]
  wire  hits_1 = cl1_io_hit; // @[cam.scala 77:18 93:11]
  wire  hits_2 = cl2_io_hit; // @[cam.scala 101:11 77:18]
  wire  hits_3 = cl3_io_hit; // @[cam.scala 109:11 77:18]
  CAMLine cl0 ( // @[cam.scala 79:19]
    .clock(cl0_clock),
    .reset(cl0_reset),
    .io_we(cl0_io_we),
    .io_wi(cl0_io_wi),
    .io_key(cl0_io_key),
    .io_din(cl0_io_din),
    .io_hit(cl0_io_hit),
    .io_log_camline(cl0_io_log_camline)
  );
  CAMLine cl1 ( // @[cam.scala 87:19]
    .clock(cl1_clock),
    .reset(cl1_reset),
    .io_we(cl1_io_we),
    .io_wi(cl1_io_wi),
    .io_key(cl1_io_key),
    .io_din(cl1_io_din),
    .io_hit(cl1_io_hit),
    .io_log_camline(cl1_io_log_camline)
  );
  CAMLine cl2 ( // @[cam.scala 95:19]
    .clock(cl2_clock),
    .reset(cl2_reset),
    .io_we(cl2_io_we),
    .io_wi(cl2_io_wi),
    .io_key(cl2_io_key),
    .io_din(cl2_io_din),
    .io_hit(cl2_io_hit),
    .io_log_camline(cl2_io_log_camline)
  );
  CAMLine cl3 ( // @[cam.scala 103:19]
    .clock(cl3_clock),
    .reset(cl3_reset),
    .io_we(cl3_io_we),
    .io_wi(cl3_io_wi),
    .io_key(cl3_io_key),
    .io_din(cl3_io_din),
    .io_hit(cl3_io_hit),
    .io_log_camline(cl3_io_log_camline)
  );
  assign io_hit = hits_0 | hits_1 | hits_2 | hits_3; // @[cam.scala 111:43]
  assign io_log_0 = cl0_io_log_camline; // @[cam.scala 112:13]
  assign io_log_1 = cl1_io_log_camline; // @[cam.scala 113:13]
  assign io_log_2 = cl2_io_log_camline; // @[cam.scala 114:13]
  assign io_log_3 = cl3_io_log_camline; // @[cam.scala 115:13]
  assign cl0_clock = clock;
  assign cl0_reset = reset;
  assign cl0_io_we = io_we; // @[cam.scala 81:13]
  assign cl0_io_wi = io_waddr[0]; // @[cam.scala 82:24]
  assign cl0_io_key = io_key; // @[cam.scala 83:14]
  assign cl0_io_din = io_din; // @[cam.scala 84:14]
  assign cl1_clock = clock;
  assign cl1_reset = reset;
  assign cl1_io_we = io_we; // @[cam.scala 89:13]
  assign cl1_io_wi = io_waddr[1]; // @[cam.scala 90:24]
  assign cl1_io_key = io_key; // @[cam.scala 91:14]
  assign cl1_io_din = io_din; // @[cam.scala 92:14]
  assign cl2_clock = clock;
  assign cl2_reset = reset;
  assign cl2_io_we = io_we; // @[cam.scala 97:13]
  assign cl2_io_wi = io_waddr[2]; // @[cam.scala 98:24]
  assign cl2_io_key = io_key; // @[cam.scala 99:14]
  assign cl2_io_din = io_din; // @[cam.scala 100:14]
  assign cl3_clock = clock;
  assign cl3_reset = reset;
  assign cl3_io_we = io_we; // @[cam.scala 105:13]
  assign cl3_io_wi = io_waddr[3]; // @[cam.scala 106:24]
  assign cl3_io_key = io_key; // @[cam.scala 107:14]
  assign cl3_io_din = io_din; // @[cam.scala 108:14]
endmodule
