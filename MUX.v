module MUX2_1 (a, b, sel, out);	 
	input [31:0] a;
	input [31:0] b;
	input sel;
	output [31:0] out;
	assign  out = (sel == 0)? a : b;
endmodule			

module MUX4x1_5(i0,i1,i2,sel,out);
input [4:0]i0;
input [4:0]i1;
input [4:0]i2;  
input [1:0] sel;
output reg [4:0] out;
always @(*) begin
  if(sel == 2'b00) out = i0;
  else if(sel == 2'b01) out = i1;
  else if(sel == 2'b10) out = i2;
	  end
endmodule		

module MUX4x1_32(i0,i1,i2,sel,out);
	input [31:0]i0;
	input [31:0]i1;
	input [31:0]i2;  
	input [1:0] sel;
	output reg [31:0] out; 
	always @(*) begin
	  if(sel == 2'b00) out = i0;
		  else if(sel == 2'b01) out = i1;
		  else if(sel == 2'b10) out = i2;
		  end
endmodule