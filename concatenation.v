module concatenation(sll2_out,pc_4_out,JUMP_Address);
  input [27:0]sll2_out;
  input [31:0] pc_4_out;
  output [31:0]JUMP_Address;
  wire [3:0] most_sign ;
  assign most_sign = pc_4_out[31:28];
  assign JUMP_Address[31:28]= most_sign;
  assign JUMP_Address[27:0]= sll2_out;
endmodule