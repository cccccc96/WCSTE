module Memory(
  input        clock,
  input        reset,
  input        io_wrEna,
  input  [1:0] io_wrData,
  input  [1:0] io_wrAddr,
  input  [1:0] io_rdAddr,
  output [1:0] io_rdData
);
  reg [1:0] mem [0:3]; // @[Memory.scala 12:16]
  wire  mem_io_rdData_MPORT_en; // @[Memory.scala 12:16]
  wire [1:0] mem_io_rdData_MPORT_addr; // @[Memory.scala 12:16]
  wire [1:0] mem_io_rdData_MPORT_data; // @[Memory.scala 12:16]
  wire [1:0] mem_MPORT_data; // @[Memory.scala 12:16]
  wire [1:0] mem_MPORT_addr; // @[Memory.scala 12:16]
  wire  mem_MPORT_mask; // @[Memory.scala 12:16]
  wire  mem_MPORT_en; // @[Memory.scala 12:16]
  assign mem_io_rdData_MPORT_en = 1'h1;
  assign mem_io_rdData_MPORT_addr = io_rdAddr;
  assign mem_io_rdData_MPORT_data = mem[mem_io_rdData_MPORT_addr]; // @[Memory.scala 12:16]
  assign mem_MPORT_data = io_wrData;
  assign mem_MPORT_addr = io_wrAddr;
  assign mem_MPORT_mask = 1'h1;
  assign mem_MPORT_en = io_wrEna;
  assign io_rdData = mem_io_rdData_MPORT_data; // @[Memory.scala 17:13]
  always @(posedge clock) begin
    if (mem_MPORT_en & mem_MPORT_mask) begin
      mem[mem_MPORT_addr] <= mem_MPORT_data; // @[Memory.scala 12:16]
    end
  end
endmodule
