
module ADD_PC_4(in, out);
	input [31:0]in;
	output [31:0] out;
	ADD add1(in, 4, out);
endmodule

