
module SignExtension (in, out);
	input [15:0]in;
	output [31:0]out;
	assign out = in | 8'h00000000;
endmodule
