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
// CREATED		"Mon Nov  4 16:37:35 2024"

module SMHClock(
	RESET,
	FCLK,
	Seg0,
	Seg1,
	Seg2,
	Seg3,
	Seg4,
	Seg5
);


input wire	RESET;
input wire	FCLK;
output wire	[6:0] Seg0;
output wire	[6:0] Seg1;
output wire	[6:0] Seg2;
output wire	[6:0] Seg3;
output wire	[6:0] Seg4;
output wire	[6:0] Seg5;

wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;





clock	b2v_inst(
	.CLK(FCLK),
	.RESET(RESET),
	.RST(SYNTHESIZED_WIRE_0),
	.O(Seg0),
	.T(Seg1));


clock	b2v_inst2(
	.CLK(SYNTHESIZED_WIRE_0),
	.RESET(RESET),
	.RST(SYNTHESIZED_WIRE_1),
	.O(Seg2),
	.T(Seg3));


clock	b2v_inst3(
	.CLK(SYNTHESIZED_WIRE_1),
	.RESET(RESET),
	
	.O(Seg4),
	.T(Seg5));


endmodule
