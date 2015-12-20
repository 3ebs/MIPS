module instructionMemory(clk, address, to_ctrl, to_rs, to_rt, to_rd, to_sign_ext);
	input clk;
	input [31:0] address;
	output to_ctrl, to_rs, to_rt, to_rd, to_sign_ext;	
	reg [5:0]to_ctrl;
	reg [4:0]to_rs;
	reg [4:0]to_rt; 
	reg [4:0]to_rd;
	reg [15:0]to_sign_ext;
	reg [31:0] my_memory [1024:0];
	always @ (posedge clk) begin
		to_ctrl = my_memory[address[31:26]];
		to_rs = my_memory[address[25:21]];
		to_rt = my_memory[address[20:16]];
		to_rd = my_memory[address[15:11]];
		to_sign_ext = my_memory[address[15:0]];	
	end
	initial begin
		$readmemb ("memory.list", my_memory);
	end
endmodule