module Stack(
  input         clock,
  input         reset,
  input         io_push,
  input         io_pop,
  input         io_en,
  input  [31:0] io_dataIn,
  output [31:0] io_dataOut
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] stack_mem_0; // @[Stack.scala 17:26]
  reg [31:0] stack_mem_1; // @[Stack.scala 17:26]
  reg [31:0] stack_mem_2; // @[Stack.scala 17:26]
  reg [31:0] stack_mem_3; // @[Stack.scala 17:26]
  reg [31:0] stack_mem_4; // @[Stack.scala 17:26]
  reg [31:0] stack_mem_5; // @[Stack.scala 17:26]
  reg [31:0] stack_mem_6; // @[Stack.scala 17:26]
  reg [31:0] stack_mem_7; // @[Stack.scala 17:26]
  reg [31:0] stack_mem_8; // @[Stack.scala 17:26]
  reg [31:0] stack_mem_9; // @[Stack.scala 17:26]
  reg [3:0] sp; // @[Stack.scala 18:26]
  reg [31:0] out; // @[Stack.scala 19:26]
  wire [3:0] _sp_T_1 = sp + 4'h1; // @[Stack.scala 24:16]
  wire  _T_2 = sp > 4'h0; // @[Stack.scala 25:31]
  wire [3:0] _sp_T_3 = sp - 4'h1; // @[Stack.scala 26:16]
  wire [31:0] _GEN_23 = 4'h1 == _sp_T_3 ? stack_mem_1 : stack_mem_0; // @[Stack.scala 29:{11,11}]
  wire [31:0] _GEN_24 = 4'h2 == _sp_T_3 ? stack_mem_2 : _GEN_23; // @[Stack.scala 29:{11,11}]
  wire [31:0] _GEN_25 = 4'h3 == _sp_T_3 ? stack_mem_3 : _GEN_24; // @[Stack.scala 29:{11,11}]
  wire [31:0] _GEN_26 = 4'h4 == _sp_T_3 ? stack_mem_4 : _GEN_25; // @[Stack.scala 29:{11,11}]
  wire [31:0] _GEN_27 = 4'h5 == _sp_T_3 ? stack_mem_5 : _GEN_26; // @[Stack.scala 29:{11,11}]
  wire [31:0] _GEN_28 = 4'h6 == _sp_T_3 ? stack_mem_6 : _GEN_27; // @[Stack.scala 29:{11,11}]
  wire [31:0] _GEN_29 = 4'h7 == _sp_T_3 ? stack_mem_7 : _GEN_28; // @[Stack.scala 29:{11,11}]
  wire [31:0] _GEN_30 = 4'h8 == _sp_T_3 ? stack_mem_8 : _GEN_29; // @[Stack.scala 29:{11,11}]
  assign io_dataOut = out; // @[Stack.scala 33:14]
  always @(posedge clock) begin
    if (reset) begin // @[Stack.scala 17:26]
      stack_mem_0 <= 32'h0; // @[Stack.scala 17:26]
    end else if (io_en) begin // @[Stack.scala 21:16]
      if (io_push & sp < 4'ha) begin // @[Stack.scala 22:42]
        if (4'h0 == sp) begin // @[Stack.scala 23:21]
          stack_mem_0 <= io_dataIn; // @[Stack.scala 23:21]
        end
      end
    end
    if (reset) begin // @[Stack.scala 17:26]
      stack_mem_1 <= 32'h0; // @[Stack.scala 17:26]
    end else if (io_en) begin // @[Stack.scala 21:16]
      if (io_push & sp < 4'ha) begin // @[Stack.scala 22:42]
        if (4'h1 == sp) begin // @[Stack.scala 23:21]
          stack_mem_1 <= io_dataIn; // @[Stack.scala 23:21]
        end
      end
    end
    if (reset) begin // @[Stack.scala 17:26]
      stack_mem_2 <= 32'h0; // @[Stack.scala 17:26]
    end else if (io_en) begin // @[Stack.scala 21:16]
      if (io_push & sp < 4'ha) begin // @[Stack.scala 22:42]
        if (4'h2 == sp) begin // @[Stack.scala 23:21]
          stack_mem_2 <= io_dataIn; // @[Stack.scala 23:21]
        end
      end
    end
    if (reset) begin // @[Stack.scala 17:26]
      stack_mem_3 <= 32'h0; // @[Stack.scala 17:26]
    end else if (io_en) begin // @[Stack.scala 21:16]
      if (io_push & sp < 4'ha) begin // @[Stack.scala 22:42]
        if (4'h3 == sp) begin // @[Stack.scala 23:21]
          stack_mem_3 <= io_dataIn; // @[Stack.scala 23:21]
        end
      end
    end
    if (reset) begin // @[Stack.scala 17:26]
      stack_mem_4 <= 32'h0; // @[Stack.scala 17:26]
    end else if (io_en) begin // @[Stack.scala 21:16]
      if (io_push & sp < 4'ha) begin // @[Stack.scala 22:42]
        if (4'h4 == sp) begin // @[Stack.scala 23:21]
          stack_mem_4 <= io_dataIn; // @[Stack.scala 23:21]
        end
      end
    end
    if (reset) begin // @[Stack.scala 17:26]
      stack_mem_5 <= 32'h0; // @[Stack.scala 17:26]
    end else if (io_en) begin // @[Stack.scala 21:16]
      if (io_push & sp < 4'ha) begin // @[Stack.scala 22:42]
        if (4'h5 == sp) begin // @[Stack.scala 23:21]
          stack_mem_5 <= io_dataIn; // @[Stack.scala 23:21]
        end
      end
    end
    if (reset) begin // @[Stack.scala 17:26]
      stack_mem_6 <= 32'h0; // @[Stack.scala 17:26]
    end else if (io_en) begin // @[Stack.scala 21:16]
      if (io_push & sp < 4'ha) begin // @[Stack.scala 22:42]
        if (4'h6 == sp) begin // @[Stack.scala 23:21]
          stack_mem_6 <= io_dataIn; // @[Stack.scala 23:21]
        end
      end
    end
    if (reset) begin // @[Stack.scala 17:26]
      stack_mem_7 <= 32'h0; // @[Stack.scala 17:26]
    end else if (io_en) begin // @[Stack.scala 21:16]
      if (io_push & sp < 4'ha) begin // @[Stack.scala 22:42]
        if (4'h7 == sp) begin // @[Stack.scala 23:21]
          stack_mem_7 <= io_dataIn; // @[Stack.scala 23:21]
        end
      end
    end
    if (reset) begin // @[Stack.scala 17:26]
      stack_mem_8 <= 32'h0; // @[Stack.scala 17:26]
    end else if (io_en) begin // @[Stack.scala 21:16]
      if (io_push & sp < 4'ha) begin // @[Stack.scala 22:42]
        if (4'h8 == sp) begin // @[Stack.scala 23:21]
          stack_mem_8 <= io_dataIn; // @[Stack.scala 23:21]
        end
      end
    end
    if (reset) begin // @[Stack.scala 17:26]
      stack_mem_9 <= 32'h0; // @[Stack.scala 17:26]
    end else if (io_en) begin // @[Stack.scala 21:16]
      if (io_push & sp < 4'ha) begin // @[Stack.scala 22:42]
        if (4'h9 == sp) begin // @[Stack.scala 23:21]
          stack_mem_9 <= io_dataIn; // @[Stack.scala 23:21]
        end
      end
    end
    if (reset) begin // @[Stack.scala 18:26]
      sp <= 4'h0; // @[Stack.scala 18:26]
    end else if (io_en) begin // @[Stack.scala 21:16]
      if (io_push & sp < 4'ha) begin // @[Stack.scala 22:42]
        sp <= _sp_T_1; // @[Stack.scala 24:10]
      end else if (io_pop & sp > 4'h0) begin // @[Stack.scala 25:39]
        sp <= _sp_T_3; // @[Stack.scala 26:10]
      end
    end
    if (reset) begin // @[Stack.scala 19:26]
      out <= 32'h0; // @[Stack.scala 19:26]
    end else if (io_en) begin // @[Stack.scala 21:16]
      if (_T_2) begin // @[Stack.scala 28:21]
        if (4'h9 == _sp_T_3) begin // @[Stack.scala 29:11]
          out <= stack_mem_9; // @[Stack.scala 29:11]
        end else begin
          out <= _GEN_30;
        end
      end
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
  stack_mem_0 = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  stack_mem_1 = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  stack_mem_2 = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  stack_mem_3 = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  stack_mem_4 = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  stack_mem_5 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  stack_mem_6 = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  stack_mem_7 = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  stack_mem_8 = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  stack_mem_9 = _RAND_9[31:0];
  _RAND_10 = {1{`RANDOM}};
  sp = _RAND_10[3:0];
  _RAND_11 = {1{`RANDOM}};
  out = _RAND_11[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
