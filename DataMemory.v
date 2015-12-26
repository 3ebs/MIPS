module DataMemory (addr, data_in, data_out, rd, wr);
	input rd, wr;
	input [31:0] addr;
	input [31:0] data_in;
	output reg [31:0] data_out;
	reg [31:0] my_memory [0:1024]; 
	always @ (addr or data_in or wr or rd) begin
		if (wr &!rd) 
			my_memory[addr] <= data_in;
		else if  (!wr & rd) 
			data_out = my_memory[addr];
			
			$writememb ("memory.list", my_memory);
	end
endmodule