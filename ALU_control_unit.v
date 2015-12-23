

module alu_control (alu_op,funct ,alu_control);
input [5:0]funct;
input [2:0]alu_op ;
output reg alu_control ;
parameter ADD 	= 3'b000;
parameter SUB 	= 3'b001;
parameter SLL 	= 3'b010;
parameter NOR  	= 3'b011;
parameter AND  	= 3'b100;
parameter SLT  	= 3'b101;
 always @ (*) 
 begin 
	case (alu_op)
				
			3'b100 : begin//Rtype
						if (funct == 6'b100000)
						begin 
								alu_control= ADD;
						end 
						else if (funct == 6'b100010)
							begin
								alu_control = SUB;
							end
						else if (funct == 6'b00000)
							begin 
								alu_control = SLL ;
							end
						else if(funct ==6'b100111) 
						 begin
							alu_control = NOR ;
						 end
						 else if (funct == 6'b100100 )
						 begin 
								alu_control = AND; 
						 end
						 else if (funct == 6'b101010) 
						 begin
						  alu_control = SLT; 
						 end
					end	 		
			3'b000 : begin 
						
						alu_control = ADD;
	
				end			 
			3'b011 : begin 
						alu_control = AND; 
			
			end 
			
			3'b001: begin 
						alu_control = SUB;
					end
					
					
	endcase
 
 
 end


endmodule
