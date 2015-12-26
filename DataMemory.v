module DataMemory (addr, data_in, data_out, rd, wr);
	input rd, wr;
	input [31:0] addr;
	input [31:0] data_in;
	output reg [31:0] data_out;
	reg [31:0] my_memory [0:1024]; 		 
	reg [31:0] tempaddr;
	always @ (*) begin
		tempaddr = addr;
		tempaddr /= 4;
		if (wr &!rd) 
			my_memory[tempaddr] <=  data_in;
		else if  (!wr & rd) 
			data_out =  my_memory[tempaddr];
			$writememb ("D_memory.list", my_memory);
	end	 
	initial begin
		my_memory[0] = 32'b0;
		my_memory[1] = 32'b1;
		my_memory[2] = 32'b10;
	end
endmodule
