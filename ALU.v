module ALU (opA , opB ,alu_control_signal , out ,carry,zero );
input [31:0] opA;
input [31:0] opB;
input [2:0] alu_control_signal;
output reg [31:0] out;
output reg carry ,zero;

parameter ADD 	= 3'b000;
parameter SUB 	= 3'b001;
parameter SLL 	= 3'b010;
parameter NOR  	= 3'b011;
parameter AND  	= 3'b100;
parameter SLT  	= 3'b101;

always @(*)
begin

case(alu_control_signal)
	ADD: begin 
			{carry,out}<= opA + opB ;
			zero<= !(opA-opB);
		end
	SUB: begin 
			out <= opA - opB;
			zero<= !(opA-opB);
		end	
	SLL : begin 
			out<= opA<<opB;
			zero<= !(opA-opB);
		 end
	NOR  :
		begin
			out <= !(opA | opB ) ;
			zero<= !(opA-opB);

		end
	AND :begin 
			out <= opA & opB ;
			zero<= !(opA-opB);
		end
		
	SLT :
			begin 			
				out <= (opA<opB)? 1 : 0 ;
				zero<= !(opA-opB);
			end
	endcase


end



endmodule