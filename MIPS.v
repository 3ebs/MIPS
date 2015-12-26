include "ADD.v";
include "addpc4.v";
include "ControlUnit.v";
include "PC.v";
include "SLL2.v";
include "clock.v";
include "MUX.v";
include "DataMemory.v";
include "InstructionMemory.v";
include "SignExtension.v";
include "ALU.v";
include "ALU_control.v";
include "RegisterFile.v";
include "concatenation.v";

module MIPS;
  clock clk(.clk(mips_clock));
  PC pc(.in(jrmux_out),.clk(mips_clock),.out(pc_out));
  ADD_PC_4 pc_4(.in(pc_out), .out(pc_4_out));
  instructionMemory I_memory (.address(pc_out), .to_ctrl (Opcode), .to_rs(im_rs), .to_rt(im_rt), .to_rd(im_rd),.to_shamt(shamt),.to_function(funct), .to_jump(JUMP_26bits), .to_sign_ex(signex_in));
  control_unit con_unit (.Opcode(Opcode), .RegWrite(RegWrite),.RegDst(RegDst), .AluSrc(alusrc), .AluOp(aluop), .branch(branch), .MemWrite(memwrite), .MemRead(memread), .MemToReg(memtoreg), .jump(jump));
  DataMemory D_memory (.addr(result),.data_in(rf_rt), .data_out(data), .rd(memread), .wr(memwrite));
  SLL_2 jump_sll2(.in(JUMP_26bits), .out(sll2_out));
  concatentaion conc (.sll2_out(sll2_out), .pc_4_out(pc_4_out), .JUMP_Address(conc_out));
  RegisterFile RegFile (.RegwrAndJreg(rf_ctrl), .rs(im_rs), .rt(im_rt), .rd(write_register), .WriteData(write_data), .ReadData1(rf_rs) , .ReadData2(rf_rt));
  ALU alu(.opA(rf_rs),.opB(alumux_out),.shamt(shamt),.alu_control_signal(alu_control), .out(result), .carry(carry), .zero(zero));
  alu_control alucontrol(.alu_op(alu_op), .funct(funct), .alu_control(alu_control), .jreg(jreg));
  SignExtension signex(.in(signex_in), .out(signex_out));
  shift_left_2 branch_sll2(.in(signex_out), .out(branch_add_in));
  ADD branch_add (.in1(pc_4_out), .in2(branch_add_in), .out(branch_add_out));
  and branch_and(branchmux_sel,branch,zero);
  and regwrite_and(rf_ctrl,RegWrite,~jreg); 
  MUX2_1 alumux(.a(rf_rt), .b(signex_out), .sel(alusrc), .out(alumux_out));
  MUX2_1 branchmux(.a(pc_4_out), .b(branch_add_out), .sel(branchmux_sel), .out(jalmux_in));
  MUX2_1 jalmux(.a(jalmux_in), .b(conc_out), .sel(jump), .out(jrmux_in));
  MUX2_1 jrmux(.a(jrmux_in), .b(rf_rs), .sel(jreg), .out(jrmux_out));
  MUX4_1 regfilemux(.i0(im_rt), .i1(im_rd), .i2(im_rs), .i3(5'bx), .sel(RegDst), .out(write_register));
  MUX4_1 memorymux(.i0(result),.i1(data),.i2(pc_4_out), .i3(32'bx), .sel(memtoreg), .out(write_data));
  
  
  endmodule
