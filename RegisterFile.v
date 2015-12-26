module RegisterFile (RegwrAndJreg, //control signal
					rs, rt, rd, WriteData, ReadData1, ReadData2);
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
	
	/*
	initial begin  
		RegArray[0] = 0;
		RegArray[1] = 0;
		RegArray[2] = 0;
		RegArray[3] = 0;
		RegArray[4] = 0;
		RegArray[5] = 0;
		RegArray[6] = 0;
		RegArray[7] = 0;
		RegArray[8] = 0;
		RegArray[9] = 0;
		RegArray[10] = 0;
		RegArray[11] = 0;
		RegArray[12] = 0;
		RegArray[13] = 0;
		RegArray[14] = 0;
		RegArray[15] = 0;
		RegArray[16] = 0;
		RegArray[17] = 0;
		RegArray[18] = 0;
		RegArray[19] = 0;
		RegArray[20] = 0;
		RegArray[21] = 0;
		RegArray[22] = 0;
		RegArray[23] = 0;
		RegArray[24] = 0:
		RegArray[25] = 0;
		RegArray[26] = 0;
		RegArray[27] = 0;
		RegArray[28] = 0;
		RegArray[29] = 0;
		RegArray[30] = 0;
		RegArray[31] = 0;
	end
	*/	   
	
endmodule