module RWSmem(
  input        clock,
  input        reset,
  input        io_enable,
  input        io_write,
  input  [1:0] io_addr,
  input  [1:0] io_dataIn,
  output [1:0] io_dataOut
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  reg [1:0] mem_0; // @[Ram.scala 19:16]
  reg [1:0] mem_1; // @[Ram.scala 19:16]
  reg [1:0] mem_2; // @[Ram.scala 19:16]
  reg [1:0] mem_3; // @[Ram.scala 19:16]
  wire [1:0] _GEN_5 = 2'h1 == io_addr ? mem_1 : mem_0; // @[Ram.scala 25:{31,31}]
  wire [1:0] _GEN_6 = 2'h2 == io_addr ? mem_2 : _GEN_5; // @[Ram.scala 25:{31,31}]
  wire [1:0] _GEN_7 = 2'h3 == io_addr ? mem_3 : _GEN_6; // @[Ram.scala 25:{31,31}]
  wire [1:0] _GEN_12 = io_write ? 2'h0 : _GEN_7; // @[Ram.scala 21:14 24:20 25:31]
  assign io_dataOut = io_enable ? _GEN_12 : 2'h0; // @[Ram.scala 21:14 23:19]
  always @(posedge clock) begin
    if (io_enable) begin // @[Ram.scala 23:19]
      if (io_write) begin // @[Ram.scala 24:20]
        if (2'h0 == io_addr) begin // @[Ram.scala 24:35]
          mem_0 <= io_dataIn; // @[Ram.scala 24:35]
        end
      end
    end
    if (io_enable) begin // @[Ram.scala 23:19]
      if (io_write) begin // @[Ram.scala 24:20]
        if (2'h1 == io_addr) begin // @[Ram.scala 24:35]
          mem_1 <= io_dataIn; // @[Ram.scala 24:35]
        end
      end
    end
    if (io_enable) begin // @[Ram.scala 23:19]
      if (io_write) begin // @[Ram.scala 24:20]
        if (2'h2 == io_addr) begin // @[Ram.scala 24:35]
          mem_2 <= io_dataIn; // @[Ram.scala 24:35]
        end
      end
    end
    if (io_enable) begin // @[Ram.scala 23:19]
      if (io_write) begin // @[Ram.scala 24:20]
        if (2'h3 == io_addr) begin // @[Ram.scala 24:35]
          mem_3 <= io_dataIn; // @[Ram.scala 24:35]
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
  mem_0 = _RAND_0[1:0];
  _RAND_1 = {1{`RANDOM}};
  mem_1 = _RAND_1[1:0];
  _RAND_2 = {1{`RANDOM}};
  mem_2 = _RAND_2[1:0];
  _RAND_3 = {1{`RANDOM}};
  mem_3 = _RAND_3[1:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
