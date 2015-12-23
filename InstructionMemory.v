module InstructionMemory(address, to_ctrl, to_rs, to_rt, to_rd, to_shamt, to_function, to_jump, to_sign_ext);
	input [31:0] address;
	output to_ctrl, to_rs, to_rt, to_rd,to_shamt,to_function, to_jump, to_sign_ext;	
	reg [5:0]to_ctrl;
	reg [4:0]to_rs;
	reg [4:0]to_rt; 
	reg [4:0]to_rd;
	reg [4:0]to_shamt;
	reg [5:0]to_function; 
	reg [25:0]to_jump;
	reg [15:0]to_sign_ext;
	reg [31:0] my_memory [0:1024];
	reg [31:0] tempreg;
	always @ (address) begin
		tempreg = my_memory[address];
		to_ctrl = tempreg[31:26];
		to_rs = tempreg[25:21];
		to_rt = tempreg[20:16];
		to_rd = tempreg[15:11];
		to_shamt = tempreg[10:6]; 
		to_function = tempreg[5:0];
		to_jump = tempreg[25:0];
		to_sign_ext = tempreg[15:0];
	end
	initial begin
		$readmemh ("memory.list", my_memory);;
	end
endmodule