module single_port_syn_ram#(
	parameter ADDR_WIDTH = 4,
	parameter DATA_WIDTH = 16,
	parameter DEPTH = 2**ADDR_WIDTH
	)(
	input  clock,
	input [ADDR_WIDTH - 1 : 0] addr,
	inout [DATA_WIDTH - 1 : 0] data,
	input cs,
	input wr,
	input oe

    );

    reg [DATA_WIDTH - 1 : 0] mem[0 : DEPTH - 1];
    reg [DATA_WIDTH - 1 : 0] mid_data;

	// write part
	always@(posedge clock) begin
		if(cs&wr) begin
			mem[addr] <= data;
		end
	end

	// read part
	always@(posedge clock) begin
		if(cs & !wr) begin
			mid_data <= mem[addr];
		end
	end

	assign data = (cs & oe & !wr)? mid_data: 'hz;

endmodule
