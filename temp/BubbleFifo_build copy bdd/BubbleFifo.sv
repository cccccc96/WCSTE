module Buffer(
  input         clock,
  input         reset,
  output        io_enq_ready,
  input         io_enq_valid,
  input  [15:0] io_enq_bits,
  input         io_deq_ready,
  output        io_deq_valid,
  output [15:0] io_deq_bits
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg  fullReg; // @[BubbleFifo.scala 15:26]
  reg [15:0] dataReg; // @[BubbleFifo.scala 16:22]
  wire  _GEN_1 = io_enq_valid | fullReg; // @[BubbleFifo.scala 23:27 24:17 15:26]
  assign io_enq_ready = ~fullReg; // @[BubbleFifo.scala 29:21]
  assign io_deq_valid = fullReg; // @[BubbleFifo.scala 30:18]
  assign io_deq_bits = dataReg; // @[BubbleFifo.scala 31:17]
  always @(posedge clock) begin
    if (reset) begin // @[BubbleFifo.scala 15:26]
      fullReg <= 1'h0; // @[BubbleFifo.scala 15:26]
    end else if (fullReg) begin // @[BubbleFifo.scala 18:20]
      if (io_deq_ready) begin // @[BubbleFifo.scala 19:27]
        fullReg <= 1'h0; // @[BubbleFifo.scala 20:17]
      end
    end else begin
      fullReg <= _GEN_1;
    end
    if (!(fullReg)) begin // @[BubbleFifo.scala 18:20]
      if (io_enq_valid) begin // @[BubbleFifo.scala 23:27]
        dataReg <= io_enq_bits; // @[BubbleFifo.scala 25:17]
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
  fullReg = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  dataReg = _RAND_1[15:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module BubbleFifo(
  input         clock,
  input         reset,
  output        io_enq_ready,
  input         io_enq_valid,
  input  [15:0] io_enq_bits,
  input         io_deq_ready,
  output        io_deq_valid,
  output [15:0] io_deq_bits
);
  wire  Buffer_clock; // @[BubbleFifo.scala 34:51]
  wire  Buffer_reset; // @[BubbleFifo.scala 34:51]
  wire  Buffer_io_enq_ready; // @[BubbleFifo.scala 34:51]
  wire  Buffer_io_enq_valid; // @[BubbleFifo.scala 34:51]
  wire [15:0] Buffer_io_enq_bits; // @[BubbleFifo.scala 34:51]
  wire  Buffer_io_deq_ready; // @[BubbleFifo.scala 34:51]
  wire  Buffer_io_deq_valid; // @[BubbleFifo.scala 34:51]
  wire [15:0] Buffer_io_deq_bits; // @[BubbleFifo.scala 34:51]
  wire  Buffer_1_clock; // @[BubbleFifo.scala 34:51]
  wire  Buffer_1_reset; // @[BubbleFifo.scala 34:51]
  wire  Buffer_1_io_enq_ready; // @[BubbleFifo.scala 34:51]
  wire  Buffer_1_io_enq_valid; // @[BubbleFifo.scala 34:51]
  wire [15:0] Buffer_1_io_enq_bits; // @[BubbleFifo.scala 34:51]
  wire  Buffer_1_io_deq_ready; // @[BubbleFifo.scala 34:51]
  wire  Buffer_1_io_deq_valid; // @[BubbleFifo.scala 34:51]
  wire [15:0] Buffer_1_io_deq_bits; // @[BubbleFifo.scala 34:51]
  wire  Buffer_2_clock; // @[BubbleFifo.scala 34:51]
  wire  Buffer_2_reset; // @[BubbleFifo.scala 34:51]
  wire  Buffer_2_io_enq_ready; // @[BubbleFifo.scala 34:51]
  wire  Buffer_2_io_enq_valid; // @[BubbleFifo.scala 34:51]
  wire [15:0] Buffer_2_io_enq_bits; // @[BubbleFifo.scala 34:51]
  wire  Buffer_2_io_deq_ready; // @[BubbleFifo.scala 34:51]
  wire  Buffer_2_io_deq_valid; // @[BubbleFifo.scala 34:51]
  wire [15:0] Buffer_2_io_deq_bits; // @[BubbleFifo.scala 34:51]
  wire  Buffer_3_clock; // @[BubbleFifo.scala 34:51]
  wire  Buffer_3_reset; // @[BubbleFifo.scala 34:51]
  wire  Buffer_3_io_enq_ready; // @[BubbleFifo.scala 34:51]
  wire  Buffer_3_io_enq_valid; // @[BubbleFifo.scala 34:51]
  wire [15:0] Buffer_3_io_enq_bits; // @[BubbleFifo.scala 34:51]
  wire  Buffer_3_io_deq_ready; // @[BubbleFifo.scala 34:51]
  wire  Buffer_3_io_deq_valid; // @[BubbleFifo.scala 34:51]
  wire [15:0] Buffer_3_io_deq_bits; // @[BubbleFifo.scala 34:51]
  Buffer Buffer ( // @[BubbleFifo.scala 34:51]
    .clock(Buffer_clock),
    .reset(Buffer_reset),
    .io_enq_ready(Buffer_io_enq_ready),
    .io_enq_valid(Buffer_io_enq_valid),
    .io_enq_bits(Buffer_io_enq_bits),
    .io_deq_ready(Buffer_io_deq_ready),
    .io_deq_valid(Buffer_io_deq_valid),
    .io_deq_bits(Buffer_io_deq_bits)
  );
  Buffer Buffer_1 ( // @[BubbleFifo.scala 34:51]
    .clock(Buffer_1_clock),
    .reset(Buffer_1_reset),
    .io_enq_ready(Buffer_1_io_enq_ready),
    .io_enq_valid(Buffer_1_io_enq_valid),
    .io_enq_bits(Buffer_1_io_enq_bits),
    .io_deq_ready(Buffer_1_io_deq_ready),
    .io_deq_valid(Buffer_1_io_deq_valid),
    .io_deq_bits(Buffer_1_io_deq_bits)
  );
  Buffer Buffer_2 ( // @[BubbleFifo.scala 34:51]
    .clock(Buffer_2_clock),
    .reset(Buffer_2_reset),
    .io_enq_ready(Buffer_2_io_enq_ready),
    .io_enq_valid(Buffer_2_io_enq_valid),
    .io_enq_bits(Buffer_2_io_enq_bits),
    .io_deq_ready(Buffer_2_io_deq_ready),
    .io_deq_valid(Buffer_2_io_deq_valid),
    .io_deq_bits(Buffer_2_io_deq_bits)
  );
  Buffer Buffer_3 ( // @[BubbleFifo.scala 34:51]
    .clock(Buffer_3_clock),
    .reset(Buffer_3_reset),
    .io_enq_ready(Buffer_3_io_enq_ready),
    .io_enq_valid(Buffer_3_io_enq_valid),
    .io_enq_bits(Buffer_3_io_enq_bits),
    .io_deq_ready(Buffer_3_io_deq_ready),
    .io_deq_valid(Buffer_3_io_deq_valid),
    .io_deq_bits(Buffer_3_io_deq_bits)
  );
  assign io_enq_ready = Buffer_io_enq_ready; // @[BubbleFifo.scala 39:10]
  assign io_deq_valid = Buffer_3_io_deq_valid; // @[BubbleFifo.scala 40:10]
  assign io_deq_bits = Buffer_3_io_deq_bits; // @[BubbleFifo.scala 40:10]
  assign Buffer_clock = clock;
  assign Buffer_reset = reset;
  assign Buffer_io_enq_valid = io_enq_valid; // @[BubbleFifo.scala 39:10]
  assign Buffer_io_enq_bits = io_enq_bits; // @[BubbleFifo.scala 39:10]
  assign Buffer_io_deq_ready = Buffer_1_io_enq_ready; // @[BubbleFifo.scala 36:27]
  assign Buffer_1_clock = clock;
  assign Buffer_1_reset = reset;
  assign Buffer_1_io_enq_valid = Buffer_io_deq_valid; // @[BubbleFifo.scala 36:27]
  assign Buffer_1_io_enq_bits = Buffer_io_deq_bits; // @[BubbleFifo.scala 36:27]
  assign Buffer_1_io_deq_ready = Buffer_2_io_enq_ready; // @[BubbleFifo.scala 36:27]
  assign Buffer_2_clock = clock;
  assign Buffer_2_reset = reset;
  assign Buffer_2_io_enq_valid = Buffer_1_io_deq_valid; // @[BubbleFifo.scala 36:27]
  assign Buffer_2_io_enq_bits = Buffer_1_io_deq_bits; // @[BubbleFifo.scala 36:27]
  assign Buffer_2_io_deq_ready = Buffer_3_io_enq_ready; // @[BubbleFifo.scala 36:27]
  assign Buffer_3_clock = clock;
  assign Buffer_3_reset = reset;
  assign Buffer_3_io_enq_valid = Buffer_2_io_deq_valid; // @[BubbleFifo.scala 36:27]
  assign Buffer_3_io_enq_bits = Buffer_2_io_deq_bits; // @[BubbleFifo.scala 36:27]
  assign Buffer_3_io_deq_ready = io_deq_ready; // @[BubbleFifo.scala 40:10]
endmodule
