module control_unit(OpCode, RegWrite, RegDst, AluSrc, AluOp, branch, MemWrite, MemRead, MemToReg, jump, arith);
	input [5:0]OpCode;
	output RegWrite, jump, branch, MemRead, MemWrite, AluSrc, arith;
	output [1:0]RegDst;
	output [2:0]AluOp;
	output [1:0]MemToReg;
	reg	RegWrite, jump, branch, MemRead, MemWrite, AluSrc, arith;
	reg [1:0]RegDst;
	reg [2:0]AluOp;
	reg [1:0]MemToReg;
	always @(OpCode)
		case(OpCode)
			6'b000000 : begin//Rtype 
				RegWrite=1;
				RegDst=2'b01;
				AluSrc=0;
				AluOp=3'b100;
				branch=0;
				MemWrite=0;
				MemRead=0;
				MemToReg=2'b00;
				jump=0;
				arith = 1'bx;
			end	
			6'b001000 : begin//addi 
				RegWrite=1;
				RegDst=2'b00;
				AluSrc=1;
				AluOp=3'b000;
				branch=0;
				MemWrite=0;
				MemRead=0;
				MemToReg=2'b00;
				jump=0;
			    	arith = 1;
			end
			6'b001100: begin//andi
				RegWrite=1;
				RegDst=2'b00;
				AluSrc=1;
				AluOp=3'b011;
				branch=0;
				MemWrite=0;
				MemRead=0;
				MemToReg=2'b00;
			    	jump=0;
			    	arith = 0;
			end
			6'b000100 : begin//beq 
				RegWrite=0;
				RegDst=2'bxx;
				AluSrc=0;
				AluOp=3'b001;
				branch=1;
				MemWrite=0;
				MemRead=0;
				MemToReg=2'bxx;
			    jump=0;
			    arith = 1'b0;
			end
			6'b000011 : begin//jal 
				RegWrite=1;
				RegDst=2'b10;
				AluSrc=1'bx;
				AluOp=3'bxxx;
				branch=0;
				MemWrite=0;
				MemRead=0;
				MemToReg=2'b10;
				jump=1;
				arith = 1'bx;
			end	
			6'b100011 : begin//lw 
				RegWrite=1;
				RegDst=2'b00;
				AluSrc=1;
				AluOp=3'b000;
				branch=0;
				MemWrite=0;
				MemRead=1;
				MemToReg=2'b01;
				jump=0;
				arith = 1'b1;
			end	
			6'b101011 : begin//sw 
				RegWrite=0;
				RegDst=2'b00;
				AluSrc=1;
				AluOp=3'b000;
				branch=0;
				MemWrite=1;
				MemRead=0;
				MemToReg=2'bxx;
				jump=0;
				arith = 1'b1;
			end				  
		endcase
	endmodule