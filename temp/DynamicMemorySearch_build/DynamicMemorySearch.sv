module DynamicMemorySearch(
  input        clock,
  input        reset,
  input        io_isWr,
  input  [1:0] io_wrAddr,
  input  [7:0] io_data,
  input        io_en,
  output [1:0] io_target,
  output       io_done
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg [7:0] list [0:3]; // @[DynamicMemorySearch.scala 16:19]
  wire  list_memVal_en; // @[DynamicMemorySearch.scala 16:19]
  wire [1:0] list_memVal_addr; // @[DynamicMemorySearch.scala 16:19]
  wire [7:0] list_memVal_data; // @[DynamicMemorySearch.scala 16:19]
  wire [7:0] list_MPORT_data; // @[DynamicMemorySearch.scala 16:19]
  wire [1:0] list_MPORT_addr; // @[DynamicMemorySearch.scala 16:19]
  wire  list_MPORT_mask; // @[DynamicMemorySearch.scala 16:19]
  wire  list_MPORT_en; // @[DynamicMemorySearch.scala 16:19]
  reg [1:0] index; // @[DynamicMemorySearch.scala 14:23]
  wire  done = ~io_en & (list_memVal_data == io_data | index == 2'h3); // @[DynamicMemorySearch.scala 19:23]
  wire [1:0] _index_T_1 = index + 2'h1; // @[DynamicMemorySearch.scala 26:20]
  assign list_memVal_en = 1'h1;
  assign list_memVal_addr = index;
  assign list_memVal_data = list[list_memVal_addr]; // @[DynamicMemorySearch.scala 16:19]
  assign list_MPORT_data = io_data;
  assign list_MPORT_addr = io_wrAddr;
  assign list_MPORT_mask = 1'h1;
  assign list_MPORT_en = io_isWr;
  assign io_target = index; // @[DynamicMemorySearch.scala 29:13]
  assign io_done = ~io_en & (list_memVal_data == io_data | index == 2'h3); // @[DynamicMemorySearch.scala 19:23]
  always @(posedge clock) begin
    if (list_MPORT_en & list_MPORT_mask) begin
      list[list_MPORT_addr] <= list_MPORT_data; // @[DynamicMemorySearch.scala 16:19]
    end
    if (reset) begin // @[DynamicMemorySearch.scala 14:23]
      index <= 2'h0; // @[DynamicMemorySearch.scala 14:23]
    end else if (!(io_isWr)) begin // @[DynamicMemorySearch.scala 21:18]
      if (io_en) begin // @[DynamicMemorySearch.scala 23:23]
        index <= 2'h0; // @[DynamicMemorySearch.scala 24:11]
      end else if (~done) begin // @[DynamicMemorySearch.scala 25:34]
        index <= _index_T_1; // @[DynamicMemorySearch.scala 26:11]
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
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 4; initvar = initvar+1)
    list[initvar] = _RAND_0[7:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  index = _RAND_1[1:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
