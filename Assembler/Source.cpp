#include <iostream>
#include <string>
#include <fstream>

using namespace std;

string instruction[4];

string int_to_bin(string intg, int flag)
{
	string imCode = "";
	int interg = atoi(intg.c_str());
	int immediate[16];
	int shamt[5];
	int jump[26];
	int flag1 = 0;
	if (flag == 0)
	{
		for (int i = 15; i >= 0; i--)
		{
			if (interg % 2 == 0) { immediate[i] = 0; interg /= 2; }
			else { immediate[i] = 1; interg /= 2; }
		}
		for (int i = 0; i < 16; i++)
		{
			imCode += to_string(immediate[i]);
		}
		if (atoi(intg.c_str()) < 0)
		{
			for (int i = 15; i >= 0; i--){
				if (imCode[i] == '1') flag1 = i;
			}
			for (int i = flag1-1; i >= 0; i--){
					if (imCode[i] == '0') imCode[i] = '1';
					else imCode[i] = '0';
				}
		}
	}
	else if (flag == 1)
	{
		for (int i = 4; i >= 0; i--)
		{
			if (interg % 2 == 0) { shamt[i] = 0; interg /= 2; }
			else { shamt[i] = 1; interg /= 2; }
		}
		for (int i = 0; i < 5; i++)
		{
			imCode += to_string(shamt[i]);
		}
	}
	else if (flag == 2)
	{
		for (int i = 25; i >= 0; i--)
		{
			if (interg % 2 == 0) { jump[i] = 0; interg /= 2; }
			else { jump[i] = 1; interg /= 2; }
		}
		for (int i = 0; i < 26; i++)
		{
			imCode += to_string(jump[i]);
		}
	}
	return imCode;
}

string register_name(string reg)
{
	if (reg == "$zero" || reg == "($zero)") return "00000";
	else if (reg == "$at" || reg == "($at)") return "00001";
	else if (reg == "$v0" || reg == "($v0)") return "00010";
	else if (reg == "$v1" || reg == "($v1)") return "00011";
	else if (reg == "$a0" || reg == "($a0)") return "00100";
	else if (reg == "$a1" || reg == "($a1)") return "00101";
	else if (reg == "$a2" || reg == "($a2)") return "00110";
	else if (reg == "$a3" || reg == "($a3)") return "00111";
	else if (reg == "$t0" || reg == "($t0)") return "01000";
	else if (reg == "$t1" || reg == "($t1)") return "01001";
	else if (reg == "$t2" || reg == "($t2)") return "01010";
	else if (reg == "$t3" || reg == "($t3)") return "01011";
	else if (reg == "$t4" || reg == "($t4)") return "01100";
	else if (reg == "$t5" || reg == "($t5)") return "01101";
	else if (reg == "$t6" || reg == "($t6)") return "01110";
	else if (reg == "$t7" || reg == "($t7)") return "01111";
	else if (reg == "$s0" || reg == "($s0)") return "10000";
	else if (reg == "$s1" || reg == "($s1)") return "10001";
	else if (reg == "$s2" || reg == "($s2)") return "10010";
	else if (reg == "$s3" || reg == "($s3)") return "10011";
	else if (reg == "$s4" || reg == "($s4)") return "10100";
	else if (reg == "$s5" || reg == "($s5)") return "10101";
	else if (reg == "$s6" || reg == "($s6)") return "10110";
	else if (reg == "$s7" || reg == "($s7)") return "10111";
	else if (reg == "$t8" || reg == "($t8)") return "11000";
	else if (reg == "$t9" || reg == "($t9)") return "11001";
	else if (reg == "$k0" || reg == "($k0)") return "11010";
	else if (reg == "$k1" || reg == "($k1)") return "11011";
	else if (reg == "$gp" || reg == "($gp)") return "11100";
	else if (reg == "$sp" || reg == "($sp)") return "11101";
	else if (reg == "$fp" || reg == "($fp)") return "11110";
	else if (reg == "$ra" || reg == "($ra)") return "11111";
}


string R_type(int flag)
{
	string instr_set_R_type = "000000";
	if (flag == 1) instr_set_R_type += register_name(instruction[1]) + register_name(instruction[2]) + register_name(instruction[0]) + "00000" + "100000";
	else if (flag == 2) instr_set_R_type += register_name(instruction[1]) + register_name(instruction[2]) + register_name(instruction[0]) + "00000" + "100100";
	else if (flag == 3) instr_set_R_type += "00000" + register_name(instruction[1]) + register_name(instruction[0]) + int_to_bin(instruction[2], 1) + "000000";
	else if (flag == 4) instr_set_R_type += register_name(instruction[1]) + register_name(instruction[2]) + register_name(instruction[0]) + "00000" + "101010";
	else if (flag == 5) instr_set_R_type += register_name(instruction[1]) + register_name(instruction[2]) + register_name(instruction[0]) + "00000" + "100111";
	else if (flag == 6) instr_set_R_type += register_name(instruction[0]) + "000000000000000" + "001000";
	return instr_set_R_type;
}

string I_type(int flag)
{
	string instr_set_I_type = "";
	if (flag == 1) instr_set_I_type += "001000" + register_name(instruction[1]) + register_name(instruction[0]) + int_to_bin(instruction[2], 0);
	else if (flag == 2) instr_set_I_type += "001100" + register_name(instruction[1]) + register_name(instruction[0]) + int_to_bin(instruction[2], 0);
	else if (flag == 3) instr_set_I_type += "000100" + register_name(instruction[1]) + register_name(instruction[0]) + int_to_bin(instruction[2], 0);
	return instr_set_I_type;
}


string mem_type(int flag)
{
	string instr_set_mem_type = "";
	if (flag == 1) instr_set_mem_type += "100011" + register_name(instruction[2]) + register_name(instruction[0]) + int_to_bin(instruction[1], 0);
	else if (flag == 2) instr_set_mem_type += "101011" + register_name(instruction[2]) + register_name(instruction[0]) + int_to_bin(instruction[1], 0);///
	return instr_set_mem_type;
}

string jal()
{
	return "000011" + int_to_bin(instruction[0], 2);
}


int main()
{
	ofstream myfile;
	myfile.open("assembler_output.txt");
	while (1){
		string y;
		int len;
		cin >> y;
		if (y == "jal" || y == "jr") len = 1;
		else len = 3;
		for (int i = 0; i < len; i++)
		{
			string x;
			cin >> x;
			instruction[i] = x;
		}
		if (y == "add") myfile << R_type(1);
		else if (y == "and") myfile << R_type(2);
		else if (y == "sll") myfile << R_type(3);
		else if (y == "slt") myfile << R_type(4);
		else if (y == "nor") myfile << R_type(5);
		else if (y == "addi") myfile << I_type(1);
		else if (y == "andi") myfile << I_type(2);
		else if (y == "beq") myfile << I_type(3);
		else if (y == "lw") myfile << mem_type(1);
		else if (y == "sw") myfile << mem_type(2);
		else if (y == "jal") myfile << jal();
		else if (y == "jr") myfile << R_type(6);
		myfile << endl;
	}
	myfile.close();
}

