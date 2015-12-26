module DataMemory (addr, data_in, data_out, rd, wr);
	input rd, wr;
	input [31:0] addr;
	input [31:0] data_in;
	output reg [31:0] data_out;
	reg [31:0] my_memory [0:1024]; 
	always @ (*) begin
		if (wr &!rd) 
			my_memory[addr] <=  data_in;
		else if  (!wr & rd) 
			data_out =  my_memory[addr];
			$writememb ("D_memory.list", my_memory);
	end	 
	initial begin
		my_memory[0] = 32'b0;
		my_memory[1] = 32'b1;
		my_memory[2] = 32'b10;
	end
endmodule
