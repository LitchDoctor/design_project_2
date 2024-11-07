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
// CREATED		"Mon Nov  4 13:54:13 2024"

module SecondCLK(
	RESET,
	FCLK,
	SCLK
);


input wire	RESET;
input wire	FCLK;
output wire	SCLK;

wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	[25:0] SYNTHESIZED_WIRE_3;

assign	SCLK = SYNTHESIZED_WIRE_2;




counter	b2v_inst4(
	.clk(FCLK),
	.reset(SYNTHESIZED_WIRE_0),
	.q(SYNTHESIZED_WIRE_3));
	defparam	b2v_inst4.N = 26;


sync	b2v_inst5(
	.clk(FCLK),
	.d(SYNTHESIZED_WIRE_1),
	.q(SYNTHESIZED_WIRE_2));

assign	SYNTHESIZED_WIRE_0 = SYNTHESIZED_WIRE_2 | RESET;


comparator	b2v_inst7(
	.a(SYNTHESIZED_WIRE_3),
	
	
	
	
	
	.gte(SYNTHESIZED_WIRE_1));
	defparam	b2v_inst7.B = 50000000;
	defparam	b2v_inst7.N = 26;


endmodule
