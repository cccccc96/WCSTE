module MyManyDynamicElementVecFir(
  input        clock,
  input        reset,
  input  [7:0] io_in,
  input  [7:0] io_consts_0,
  input  [7:0] io_consts_1,
  input        io_valid,
  output [7:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [7:0] taps_1; // @[DynamicFir.scala 15:66]
  wire [15:0] _io_out_T = io_in * io_consts_0; // @[DynamicFir.scala 18:56]
  wire [15:0] _io_out_T_1 = taps_1 * io_consts_1; // @[DynamicFir.scala 18:56]
  wire [15:0] _io_out_T_3 = _io_out_T + _io_out_T_1; // @[DynamicFir.scala 18:71]
  assign io_out = _io_out_T_3[7:0]; // @[DynamicFir.scala 18:10]
  always @(posedge clock) begin
    if (reset) begin // @[DynamicFir.scala 15:66]
      taps_1 <= 8'h0; // @[DynamicFir.scala 15:66]
    end else if (io_valid) begin // @[DynamicFir.scala 16:64]
      taps_1 <= io_in; // @[DynamicFir.scala 16:68]
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
  taps_1 = _RAND_0[7:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
