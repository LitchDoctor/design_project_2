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
// CREATED		"Fri Nov 29 12:58:01 2024"

module DesignProject2(
	CLK,
	RST,
	SELECTTYPE,
	INCREMENENT,
	ORDER,
	SELECTALARM,
	HOS,
	HTS,
	MOS,
	MTS,
	SOS,
	STS
);


input wire	CLK;
input wire	RST;
input wire	SELECTTYPE;
input wire	INCREMENENT;
input wire	[1:0] ORDER;
input wire	[1:0] SELECTALARM;
output wire	[6:0] HOS;
output wire	[6:0] HTS;
output wire	[6:0] MOS;
output wire	[6:0] MTS;
output wire	[6:0] SOS;
output wire	[6:0] STS;

wire	[7:0] hours;
wire	[7:0] minutes;
wire	[7:0] seconds;
wire	[3:0] SYNTHESIZED_WIRE_0;
wire	[3:0] SYNTHESIZED_WIRE_1;
wire	[3:0] SYNTHESIZED_WIRE_2;
wire	[3:0] SYNTHESIZED_WIRE_3;
wire	[3:0] SYNTHESIZED_WIRE_4;
wire	[3:0] SYNTHESIZED_WIRE_5;





AlarmTime	b2v_inst(
	.INCREMENT(INCREMENENT),
	.RESET(RST),
	.ORDER(ORDER),
	.hours(hours),
	.minutes(minutes),
	.seconds(seconds));


SevenSegmentDriver	b2v_inst10(
	.hex(SYNTHESIZED_WIRE_0),
	.O(SOS));


parser	b2v_inst2(
	.I(seconds),
	.O(SYNTHESIZED_WIRE_0),
	.T(SYNTHESIZED_WIRE_5));


parser	b2v_inst3(
	.I(minutes),
	.O(SYNTHESIZED_WIRE_4),
	.T(SYNTHESIZED_WIRE_3));


parser	b2v_inst4(
	.I(hours),
	.O(SYNTHESIZED_WIRE_2),
	.T(SYNTHESIZED_WIRE_1));


SevenSegmentDriver	b2v_inst5(
	.hex(SYNTHESIZED_WIRE_1),
	.O(HTS));


SevenSegmentDriver	b2v_inst6(
	.hex(SYNTHESIZED_WIRE_2),
	.O(HOS));


SevenSegmentDriver	b2v_inst7(
	.hex(SYNTHESIZED_WIRE_3),
	.O(MTS));


SevenSegmentDriver	b2v_inst8(
	.hex(SYNTHESIZED_WIRE_4),
	.O(MOS));


SevenSegmentDriver	b2v_inst9(
	.hex(SYNTHESIZED_WIRE_5),
	.O(STS));


endmodule
