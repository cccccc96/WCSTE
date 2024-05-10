module CAMCell(
  input   clock,
  input   reset,
  input   io_write,
  input   io_ki,
  input   io_di,
  output  io_lhi
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg  oi; // @[cam.scala 14:19]
  wire  ti = io_write & io_di | ~io_write & oi; // @[cam.scala 16:29]
  assign io_lhi = oi & io_ki | ~oi & ~io_ki; // @[cam.scala 19:27]
  always @(posedge clock) begin
    if (reset) begin // @[cam.scala 14:19]
      oi <= 1'h0; // @[cam.scala 14:19]
    end else begin
      oi <= ti; // @[cam.scala 17:6]
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
module CAMLine_m(
  input        clock,
  input        reset,
  input        io_we,
  input        io_wi,
  input  [3:0] io_key,
  input  [3:0] io_din,
  output       io_hit
);
  wire  CAMCell_clock; // @[cam.scala 113:44]
  wire  CAMCell_reset; // @[cam.scala 113:44]
  wire  CAMCell_io_write; // @[cam.scala 113:44]
  wire  CAMCell_io_ki; // @[cam.scala 113:44]
  wire  CAMCell_io_di; // @[cam.scala 113:44]
  wire  CAMCell_io_lhi; // @[cam.scala 113:44]
  wire  CAMCell_1_clock; // @[cam.scala 113:44]
  wire  CAMCell_1_reset; // @[cam.scala 113:44]
  wire  CAMCell_1_io_write; // @[cam.scala 113:44]
  wire  CAMCell_1_io_ki; // @[cam.scala 113:44]
  wire  CAMCell_1_io_di; // @[cam.scala 113:44]
  wire  CAMCell_1_io_lhi; // @[cam.scala 113:44]
  wire  CAMCell_2_clock; // @[cam.scala 113:44]
  wire  CAMCell_2_reset; // @[cam.scala 113:44]
  wire  CAMCell_2_io_write; // @[cam.scala 113:44]
  wire  CAMCell_2_io_ki; // @[cam.scala 113:44]
  wire  CAMCell_2_io_di; // @[cam.scala 113:44]
  wire  CAMCell_2_io_lhi; // @[cam.scala 113:44]
  wire  CAMCell_3_clock; // @[cam.scala 113:44]
  wire  CAMCell_3_reset; // @[cam.scala 113:44]
  wire  CAMCell_3_io_write; // @[cam.scala 113:44]
  wire  CAMCell_3_io_ki; // @[cam.scala 113:44]
  wire  CAMCell_3_io_di; // @[cam.scala 113:44]
  wire  CAMCell_3_io_lhi; // @[cam.scala 113:44]
  wire  camCells_0_lhi = CAMCell_io_lhi; // @[cam.scala 113:{25,25}]
  wire  camCells_1_lhi = CAMCell_1_io_lhi; // @[cam.scala 113:{25,25}]
  wire  camCells_2_lhi = CAMCell_2_io_lhi; // @[cam.scala 113:{25,25}]
  wire  camCells_3_lhi = CAMCell_3_io_lhi; // @[cam.scala 113:{25,25}]
  CAMCell CAMCell ( // @[cam.scala 113:44]
    .clock(CAMCell_clock),
    .reset(CAMCell_reset),
    .io_write(CAMCell_io_write),
    .io_ki(CAMCell_io_ki),
    .io_di(CAMCell_io_di),
    .io_lhi(CAMCell_io_lhi)
  );
  CAMCell CAMCell_1 ( // @[cam.scala 113:44]
    .clock(CAMCell_1_clock),
    .reset(CAMCell_1_reset),
    .io_write(CAMCell_1_io_write),
    .io_ki(CAMCell_1_io_ki),
    .io_di(CAMCell_1_io_di),
    .io_lhi(CAMCell_1_io_lhi)
  );
  CAMCell CAMCell_2 ( // @[cam.scala 113:44]
    .clock(CAMCell_2_clock),
    .reset(CAMCell_2_reset),
    .io_write(CAMCell_2_io_write),
    .io_ki(CAMCell_2_io_ki),
    .io_di(CAMCell_2_io_di),
    .io_lhi(CAMCell_2_io_lhi)
  );
  CAMCell CAMCell_3 ( // @[cam.scala 113:44]
    .clock(CAMCell_3_clock),
    .reset(CAMCell_3_reset),
    .io_write(CAMCell_3_io_write),
    .io_ki(CAMCell_3_io_ki),
    .io_di(CAMCell_3_io_di),
    .io_lhi(CAMCell_3_io_lhi)
  );
  assign io_hit = camCells_0_lhi & camCells_1_lhi & camCells_2_lhi & camCells_3_lhi; // @[cam.scala 122:27]
  assign CAMCell_clock = clock;
  assign CAMCell_reset = reset;
  assign CAMCell_io_write = io_we & io_wi; // @[cam.scala 120:18]
  assign CAMCell_io_ki = io_key[0]; // @[cam.scala 117:29]
  assign CAMCell_io_di = io_din[0]; // @[cam.scala 118:29]
  assign CAMCell_1_clock = clock;
  assign CAMCell_1_reset = reset;
  assign CAMCell_1_io_write = io_we & io_wi; // @[cam.scala 120:18]
  assign CAMCell_1_io_ki = io_key[1]; // @[cam.scala 117:29]
  assign CAMCell_1_io_di = io_din[1]; // @[cam.scala 118:29]
  assign CAMCell_2_clock = clock;
  assign CAMCell_2_reset = reset;
  assign CAMCell_2_io_write = io_we & io_wi; // @[cam.scala 120:18]
  assign CAMCell_2_io_ki = io_key[2]; // @[cam.scala 117:29]
  assign CAMCell_2_io_di = io_din[2]; // @[cam.scala 118:29]
  assign CAMCell_3_clock = clock;
  assign CAMCell_3_reset = reset;
  assign CAMCell_3_io_write = io_we & io_wi; // @[cam.scala 120:18]
  assign CAMCell_3_io_ki = io_key[3]; // @[cam.scala 117:29]
  assign CAMCell_3_io_di = io_din[3]; // @[cam.scala 118:29]
endmodule
module CAM_m_n(
  input        clock,
  input        reset,
  input        io_we,
  input  [3:0] io_key,
  input  [3:0] io_din,
  input  [1:0] io_waddr,
  output       io_hit
);
  wire  CAMLine_m_clock; // @[cam.scala 137:36]
  wire  CAMLine_m_reset; // @[cam.scala 137:36]
  wire  CAMLine_m_io_we; // @[cam.scala 137:36]
  wire  CAMLine_m_io_wi; // @[cam.scala 137:36]
  wire [3:0] CAMLine_m_io_key; // @[cam.scala 137:36]
  wire [3:0] CAMLine_m_io_din; // @[cam.scala 137:36]
  wire  CAMLine_m_io_hit; // @[cam.scala 137:36]
  wire  CAMLine_m_1_clock; // @[cam.scala 137:36]
  wire  CAMLine_m_1_reset; // @[cam.scala 137:36]
  wire  CAMLine_m_1_io_we; // @[cam.scala 137:36]
  wire  CAMLine_m_1_io_wi; // @[cam.scala 137:36]
  wire [3:0] CAMLine_m_1_io_key; // @[cam.scala 137:36]
  wire [3:0] CAMLine_m_1_io_din; // @[cam.scala 137:36]
  wire  CAMLine_m_1_io_hit; // @[cam.scala 137:36]
  CAMLine_m CAMLine_m ( // @[cam.scala 137:36]
    .clock(CAMLine_m_clock),
    .reset(CAMLine_m_reset),
    .io_we(CAMLine_m_io_we),
    .io_wi(CAMLine_m_io_wi),
    .io_key(CAMLine_m_io_key),
    .io_din(CAMLine_m_io_din),
    .io_hit(CAMLine_m_io_hit)
  );
  CAMLine_m CAMLine_m_1 ( // @[cam.scala 137:36]
    .clock(CAMLine_m_1_clock),
    .reset(CAMLine_m_1_reset),
    .io_we(CAMLine_m_1_io_we),
    .io_wi(CAMLine_m_1_io_wi),
    .io_key(CAMLine_m_1_io_key),
    .io_din(CAMLine_m_1_io_din),
    .io_hit(CAMLine_m_1_io_hit)
  );
  assign io_hit = CAMLine_m_io_hit | CAMLine_m_1_io_hit; // @[cam.scala 148:27]
  assign CAMLine_m_clock = clock;
  assign CAMLine_m_reset = reset;
  assign CAMLine_m_io_we = io_we; // @[cam.scala 141:20]
  assign CAMLine_m_io_wi = io_waddr[0]; // @[cam.scala 142:31]
  assign CAMLine_m_io_key = io_key; // @[cam.scala 143:21]
  assign CAMLine_m_io_din = io_din; // @[cam.scala 144:21]
  assign CAMLine_m_1_clock = clock;
  assign CAMLine_m_1_reset = reset;
  assign CAMLine_m_1_io_we = io_we; // @[cam.scala 141:20]
  assign CAMLine_m_1_io_wi = io_waddr[1]; // @[cam.scala 142:31]
  assign CAMLine_m_1_io_key = io_key; // @[cam.scala 143:21]
  assign CAMLine_m_1_io_din = io_din; // @[cam.scala 144:21]
endmodule
