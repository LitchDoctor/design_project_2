// Copyright (C) 2023  Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions 
// and other software and tools, and any partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License 
// Subscription Agreement, the Intel Quartus Prime License Agreement,
// the Intel FPGA IP License Agreement, or other applicable license
// agreement, including, without limitation, that your use is for
// the sole purpose of programming logic devices manufactured by
// Intel and sold by Intel or its authorized distributors.  Please
// refer to the applicable agreement for further details, at
// https://fpgasoftware.intel.com/eula.

// PROGRAM		"Quartus Prime"
// VERSION		"Version 22.1std.1 Build 917 02/14/2023 SC Lite Edition"
// CREATED		"Mon Nov  4 16:49:35 2024"

module clock(
	CLK,
	RESET,
	RST,
	O,
	T
);


input wire	CLK;
input wire	RESET;
output wire	RST;
output wire	[6:0] O;
output wire	[6:0] T;

wire	SYNTHESIZED_WIRE_0;
wire	[7:0] SYNTHESIZED_WIRE_8;
wire	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_4;
wire	SYNTHESIZED_WIRE_5;
wire	[3:0] SYNTHESIZED_WIRE_6;
wire	[3:0] SYNTHESIZED_WIRE_7;

assign	RST = SYNTHESIZED_WIRE_4;




counter	b2v_inst(
	.clk(CLK),
	.reset(SYNTHESIZED_WIRE_0),
	.q(SYNTHESIZED_WIRE_8));
	defparam	b2v_inst.N = 8;


parser	b2v_inst2(
	.I(SYNTHESIZED_WIRE_8),
	.O(SYNTHESIZED_WIRE_6),
	.T(SYNTHESIZED_WIRE_7));


sync	b2v_inst3(
	.clk(CLK),
	.d(SYNTHESIZED_WIRE_2),
	.q(SYNTHESIZED_WIRE_4));


comparator	b2v_inst4(
	.a(SYNTHESIZED_WIRE_8),
	
	
	
	
	
	.gte(SYNTHESIZED_WIRE_2));
	defparam	b2v_inst4.B = 60;
	defparam	b2v_inst4.N = 8;

assign	SYNTHESIZED_WIRE_0 = SYNTHESIZED_WIRE_4 | SYNTHESIZED_WIRE_5;


SevSegDriver	b2v_inst6(
	.hex(SYNTHESIZED_WIRE_6),
	.O(O));


SevSegDriver	b2v_inst7(
	.hex(SYNTHESIZED_WIRE_7),
	.O(T));

assign	SYNTHESIZED_WIRE_5 =  ~RESET;


endmodule
