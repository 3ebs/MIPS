module SignExtension (in, arith, out);
	input [15:0]in;
	input arith;
	output [31:0]out;
	reg [31:0]out;	
	always @ (in or arith)
		begin
			if(arith == 1) 
				begin
					if((in & 16'b1000000000000000) == 16'b0000000000000000) begin out = {16'b0000000000000000, in}; end
					else if((in & 16'b1000000000000000) == 16'b1000000000000000) begin out = {16'b1111111111111111, in}; end	
			else if(arith == 0) begin out = {16'b0000000000000000, in}; end
				end
		end		
endmodule
