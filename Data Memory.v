module DataMemory (clk, addr, data_in, data_out, rd, wr);
	input clk, rd, wr;
	input [31:0] addr;
	input [31:0] data_in;
	output reg [31:0] data_out;
	
	reg [31:0] my_memory [0:4294967295]; 
	always @ (posedge clk) begin
		if (wr &!rd) 
			my_memory[addr] <= data_in;
		else if  (!wr & rd) 
			data_out = my_memory[addr];
			
			$writememh ("memory.list", my_memory);
	end
endmodule