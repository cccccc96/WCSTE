module FIFO(
  input        clock,
  input        reset,
  input        io_rst,
  input  [1:0] io_dataIn,
  input        io_push,
  input        io_pop,
  output [1:0] io_dataOut,
  output       io_full,
  output       io_empty
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
`endif // RANDOMIZE_REG_INIT
  reg [1:0] memRegs_0; // @[FIFO.scala 15:20]
  reg [1:0] memRegs_1; // @[FIFO.scala 15:20]
  reg  tailReg; // @[FIFO.scala 16:21]
  reg  headReg; // @[FIFO.scala 17:21]
  reg  emptyReg; // @[FIFO.scala 18:21]
  wire  _T_2 = ~emptyReg; // @[FIFO.scala 27:23]
  wire  _tailReg_T_1 = tailReg + 1'h1; // @[FIFO.scala 28:24]
  wire  _GEN_2 = _tailReg_T_1 == headReg | emptyReg; // @[FIFO.scala 29:39 30:16 18:21]
  wire  _GEN_4 = io_pop & ~emptyReg ? _GEN_2 : emptyReg; // @[FIFO.scala 18:21 27:34]
  wire  _GEN_8 = io_push & ~io_full ? 1'h0 : _GEN_4; // @[FIFO.scala 23:34 26:14]
  assign io_dataOut = _tailReg_T_1 ? memRegs_1 : memRegs_0; // @[FIFO.scala 34:{14,14}]
  assign io_full = tailReg == headReg & _T_2; // @[FIFO.scala 35:36]
  assign io_empty = emptyReg; // @[FIFO.scala 33:12]
  always @(posedge clock) begin
    if (!(io_rst)) begin // @[FIFO.scala 19:15]
      if (io_push & ~io_full) begin // @[FIFO.scala 23:34]
        if (~headReg) begin // @[FIFO.scala 24:22]
          memRegs_0 <= io_dataIn; // @[FIFO.scala 24:22]
        end
      end
    end
    if (!(io_rst)) begin // @[FIFO.scala 19:15]
      if (io_push & ~io_full) begin // @[FIFO.scala 23:34]
        if (headReg) begin // @[FIFO.scala 24:22]
          memRegs_1 <= io_dataIn; // @[FIFO.scala 24:22]
        end
      end
    end
    if (io_rst) begin // @[FIFO.scala 19:15]
      tailReg <= 1'h0; // @[FIFO.scala 20:13]
    end else if (!(io_push & ~io_full)) begin // @[FIFO.scala 23:34]
      if (io_pop & ~emptyReg) begin // @[FIFO.scala 27:34]
        tailReg <= tailReg + 1'h1; // @[FIFO.scala 28:13]
      end
    end
    if (io_rst) begin // @[FIFO.scala 19:15]
      headReg <= 1'h0; // @[FIFO.scala 21:13]
    end else if (io_push & ~io_full) begin // @[FIFO.scala 23:34]
      headReg <= headReg + 1'h1; // @[FIFO.scala 25:13]
    end
    emptyReg <= io_rst | _GEN_8; // @[FIFO.scala 19:15 22:14]
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
  memRegs_0 = _RAND_0[1:0];
  _RAND_1 = {1{`RANDOM}};
  memRegs_1 = _RAND_1[1:0];
  _RAND_2 = {1{`RANDOM}};
  tailReg = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  headReg = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  emptyReg = _RAND_4[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
