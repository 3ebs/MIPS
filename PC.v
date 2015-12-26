
module PC (in, clk, out);
	input clk;
	input [31:0] in;
	output [31:0] out;
	reg	[31:0] out;
	always @ (posedge clk)
		begin
			out = in;
		end
endmodule
