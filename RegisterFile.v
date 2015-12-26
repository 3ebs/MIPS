module RegisterFile (RegwrAndJreg, rs, rt, rd, WriteData, ReadData1, ReadData2);
	input RegwrAndJreg;
	input [4:0]rs;
	input [4:0]rt;
	input [4:0]rd;
	input [31:0] WriteData;
	output reg [31:0] ReadData1;
	output reg [31:0] ReadData2;
	reg [31:0] RegArray [0:31];
	always @ (RegwrAndJreg or rs or rt or rd or WriteData) begin
		if (RegwrAndJreg == 1)begin
		  
			RegArray[rd] = WriteData;
		end	
						  					
		ReadData1 = RegArray[rs];
		ReadData2 = RegArray[rt];
		RegArray[0] = 0;
	end	 	  
	initial begin  
		RegArray[0] = 0;
		RegArray[1] = 1;
		RegArray[2] = 2;
		RegArray[3] = 3;
		RegArray[4] = 4;
		RegArray[5] = 5;
		RegArray[6] = 6;
		RegArray[7] = 7;
		RegArray[8] = 8;
		RegArray[9] = 9;
		RegArray[10] = 10;
		RegArray[11] = 11;
		RegArray[12] = 12;
		RegArray[13] = 13;
		RegArray[14] = 14;
		RegArray[15] = 15;
		RegArray[16] = 16;  
		RegArray[17] = 17;
		RegArray[18] = 18;
		RegArray[19] = 19;
		RegArray[20] = 20;
		RegArray[21] = 21;
		RegArray[22] = 22;
		RegArray[23] = 23;  	
		RegArray[24] = 24;   
		RegArray[25] = 25;
		RegArray[26] = 26;
		RegArray[27] = 27;
		RegArray[28] = 28;
		RegArray[29] = 29;
		RegArray[30] = 30;
		RegArray[31] = 30; 	 
	end
endmodule