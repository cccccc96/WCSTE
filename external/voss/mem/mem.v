module mem(
  input         clock,
  input  [31:0] io_dataIn,
  output [31:0] io_dataOut,
  input  [4:0]  io_addr,
  input         csen_n,
  input         wren_n
);
 reg [31:0] mem [4:0];
 always @(posedge clock) begin
     if(wren_n && !csen_n)
         mem[io_addr] <= io_dataIn;
 end
 always @(posedge clock) begin
     if(!wren_n && !csen_n)
         io_dataOut <= mem[io_addr];
 end
endmodule
