module ALU (opA , opB ,shamt,alu_control_signal , out ,carry,zero );
input [31:0] opA;
input [31:0] opB;
input [4:0] shamt;
input [2:0] alu_control_signal;
output reg [31:0] out;
output reg carry ,zero;

parameter ADD 	= 3'b000;
parameter SUB 	= 3'b001;
parameter SLL 	= 3'b010;
parameter NOR  	= 3'b011;
parameter AND  	= 3'b100;
parameter SLT  	= 3'b101;
parameter dontcare = 3'bxxx;
always @(*)
begin

case(alu_control_signal)
	ADD: begin 
			{carry,out}<= opA + opB ;
			zero<= ( out == 0 ) ? 1 : 0;
		end
	SUB: begin 
			out <= opA - opB;
			zero<= ( out == 0 ) ? 1 : 0;
		end	
	SLL : begin 
			out<= opA<<shamt;
			zero<= ( out == 0 ) ? 1 : 0;
		 end
	NOR  :
		begin
			out <= !(opA | opB ) ;
			zero<= ( out == 0 ) ? 1 : 0;

		end
	AND :begin 
			out <= opA & opB ;
			zero<= ( out == 0 ) ? 1 : 0;
		end
		
	SLT :
			begin 			
				out <= (opA<opB)? 1 : 0 ;
				zero <= ( out == 0 ) ? 1 : 0;
			end
	dontcare : 
				begin
				 out <= 0 ;
					zero <= 0 ;
				end
	endcase


end



endmodule