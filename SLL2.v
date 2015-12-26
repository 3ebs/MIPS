module shift_left_2(in, out);
	input [31:0]in;
	output [31:0]out;
	assign out = in << 2;
endmodule

module jumpAddress(in, out, pc4);
  input [25:0] in;
  output reg [31:0] out; 
  input [31:0]pc4;	
  always @(in)
		  begin
			  out = (in << 2) | pc4;  
		  end
endmodule