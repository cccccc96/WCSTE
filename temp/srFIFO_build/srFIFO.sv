module srFIFO(
  input        clock,
  input        reset,
  input        io_rst,
  input  [3:0] io_dataIn,
  input        io_push,
  input        io_pop,
  output [3:0] io_dataOut,
  output       io_full,
  output       io_empty
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
`endif // RANDOMIZE_REG_INIT
  reg [3:0] memRegs_0; // @[FIFO.scala 19:20]
  reg [3:0] memRegs_1; // @[FIFO.scala 19:20]
  reg [3:0] memRegs_2; // @[FIFO.scala 19:20]
  reg [3:0] memRegs_3; // @[FIFO.scala 19:20]
  reg [1:0] tailReg; // @[FIFO.scala 21:21]
  reg [1:0] headReg; // @[FIFO.scala 22:21]
  reg  emptyReg; // @[FIFO.scala 23:21]
  wire [1:0] _headReg_T_1 = headReg + 2'h1; // @[FIFO.scala 30:24]
  wire  _T_2 = ~emptyReg; // @[FIFO.scala 32:23]
  wire [1:0] _tailReg_T_1 = tailReg + 2'h1; // @[FIFO.scala 33:24]
  wire  _GEN_4 = _tailReg_T_1 == headReg | emptyReg; // @[FIFO.scala 34:39 35:16 23:21]
  wire  _GEN_6 = io_pop & ~emptyReg ? _GEN_4 : emptyReg; // @[FIFO.scala 23:21 32:34]
  wire  _GEN_12 = io_push & ~io_full ? 1'h0 : _GEN_6; // @[FIFO.scala 28:34 31:14]
  wire [3:0] _GEN_22 = 2'h1 == tailReg ? memRegs_1 : memRegs_0; // @[FIFO.scala 40:{14,14}]
  wire [3:0] _GEN_23 = 2'h2 == tailReg ? memRegs_2 : _GEN_22; // @[FIFO.scala 40:{14,14}]
  assign io_dataOut = 2'h3 == tailReg ? memRegs_3 : _GEN_23; // @[FIFO.scala 40:{14,14}]
  assign io_full = tailReg == headReg & _T_2; // @[FIFO.scala 41:36]
  assign io_empty = emptyReg; // @[FIFO.scala 39:12]
  always @(posedge clock) begin
    if (!(io_rst)) begin // @[FIFO.scala 24:15]
      if (io_push & ~io_full) begin // @[FIFO.scala 28:34]
        if (2'h0 == headReg) begin // @[FIFO.scala 29:22]
          memRegs_0 <= io_dataIn; // @[FIFO.scala 29:22]
        end
      end
    end
    if (!(io_rst)) begin // @[FIFO.scala 24:15]
      if (io_push & ~io_full) begin // @[FIFO.scala 28:34]
        if (2'h1 == headReg) begin // @[FIFO.scala 29:22]
          memRegs_1 <= io_dataIn; // @[FIFO.scala 29:22]
        end
      end
    end
    if (!(io_rst)) begin // @[FIFO.scala 24:15]
      if (io_push & ~io_full) begin // @[FIFO.scala 28:34]
        if (2'h2 == headReg) begin // @[FIFO.scala 29:22]
          memRegs_2 <= io_dataIn; // @[FIFO.scala 29:22]
        end
      end
    end
    if (!(io_rst)) begin // @[FIFO.scala 24:15]
      if (io_push & ~io_full) begin // @[FIFO.scala 28:34]
        if (2'h3 == headReg) begin // @[FIFO.scala 29:22]
          memRegs_3 <= io_dataIn; // @[FIFO.scala 29:22]
        end
      end
    end
    if (io_rst) begin // @[FIFO.scala 24:15]
      tailReg <= 2'h0; // @[FIFO.scala 25:13]
    end else if (!(io_push & ~io_full)) begin // @[FIFO.scala 28:34]
      if (io_pop & ~emptyReg) begin // @[FIFO.scala 32:34]
        tailReg <= _tailReg_T_1; // @[FIFO.scala 33:13]
      end
    end
    if (io_rst) begin // @[FIFO.scala 24:15]
      headReg <= 2'h0; // @[FIFO.scala 26:13]
    end else if (io_push & ~io_full) begin // @[FIFO.scala 28:34]
      headReg <= _headReg_T_1; // @[FIFO.scala 30:13]
    end
    emptyReg <= io_rst | _GEN_12; // @[FIFO.scala 24:15 27:14]
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
  memRegs_0 = _RAND_0[3:0];
  _RAND_1 = {1{`RANDOM}};
  memRegs_1 = _RAND_1[3:0];
  _RAND_2 = {1{`RANDOM}};
  memRegs_2 = _RAND_2[3:0];
  _RAND_3 = {1{`RANDOM}};
  memRegs_3 = _RAND_3[3:0];
  _RAND_4 = {1{`RANDOM}};
  tailReg = _RAND_4[1:0];
  _RAND_5 = {1{`RANDOM}};
  headReg = _RAND_5[1:0];
  _RAND_6 = {1{`RANDOM}};
  emptyReg = _RAND_6[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
