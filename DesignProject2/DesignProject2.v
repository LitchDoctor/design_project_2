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
// CREATED		"Mon Dec  2 14:51:47 2024"

module DesignProject2(
	CLK,
	RST,
	INCREMENENT,
	EnableA1,
	EnableA2,
	EnableA3,
	ORDER,
	SELECTALARM,
	ring,
	Seg0,
	Seg1,
	Seg2,
	Seg3,
	Seg4,
	Seg5
);


input wire	CLK;
input wire	RST;
input wire	INCREMENENT;
input wire	EnableA1;
input wire	EnableA2;
input wire	EnableA3;
input wire	[1:0] ORDER;
input wire	[1:0] SELECTALARM;
output wire	ring;
output wire	[6:0] Seg0;
output wire	[6:0] Seg1;
output wire	[6:0] Seg2;
output wire	[6:0] Seg3;
output wire	[6:0] Seg4;
output wire	[6:0] Seg5;

wire	[7:0] HA1;
wire	[7:0] HA2;
wire	[7:0] HA3;
wire	[7:0] HC;
wire	IA1;
wire	IA2;
wire	IA3;
wire	IC;
wire	[7:0] MA1;
wire	[7:0] MA2;
wire	[7:0] MA3;
wire	[7:0] MC;
wire	[7:0] minutes;
wire	RA1;
wire	RA2;
wire	RA3;
wire	RC;
wire	[7:0] SA1;
wire	[7:0] SA2;
wire	[7:0] SA3;
wire	[7:0] SC;
wire	[7:0] seconds;
wire	[3:0] SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_3;
wire	SYNTHESIZED_WIRE_4;
wire	SYNTHESIZED_WIRE_5;
wire	SYNTHESIZED_WIRE_6;
wire	SYNTHESIZED_WIRE_7;
wire	[7:0] SYNTHESIZED_WIRE_8;
wire	[3:0] SYNTHESIZED_WIRE_9;
wire	[3:0] SYNTHESIZED_WIRE_10;
wire	[3:0] SYNTHESIZED_WIRE_11;
wire	[3:0] SYNTHESIZED_WIRE_12;
wire	[3:0] SYNTHESIZED_WIRE_13;





AlarmTime	b2v_inst(
	.INCREMENT(IA1),
	.RESET(RA1),
	.ORDER(ORDER),
	.hours(HA1),
	.minutes(MA1),
	.seconds(SA1));


mux4	b2v_inst1(
	.c0(SC),
	.c1(SA1),
	.c2(SA2),
	.c3(SA3),
	.s(SELECTALARM),
	.o(seconds));


SevenSegmentDriver	b2v_inst10(
	.hex(SYNTHESIZED_WIRE_0),
	.O(Seg0));


mux4	b2v_inst11(
	.c0(MC),
	.c1(MA1),
	.c2(MA2),
	.c3(MA3),
	.s(SELECTALARM),
	.o(minutes));


mux4	b2v_inst12(
	.c0(HC),
	.c1(HA1),
	.c2(HA2),
	.c3(HA3),
	.s(SELECTALARM),
	.o(SYNTHESIZED_WIRE_8));

assign	SYNTHESIZED_WIRE_2 = EnableA1 & SYNTHESIZED_WIRE_1;


ClockTime	b2v_inst14(
	.CLK(CLK),
	.RST(RC),
	.INCREMENT(IC),
	.ORDER(ORDER),
	.hours(HC),
	.minutes(MC),
	.seconds(SC));
	defparam	b2v_inst14.CLOCK_FREQ = 10;


DirectClockInputs	b2v_inst15(
	.CLK(CLK),
	.RESET(RST),
	.INCREMENT(INCREMENENT),
	.S(SELECTALARM),
	.RC(RC),
	.IC(IC),
	.RA1(RA1),
	.IA1(IA1),
	.RA2(RA2),
	.IA2(IA2),
	.RA3(RA3),
	.IA3(IA3));


AlarmTime	b2v_inst16(
	.INCREMENT(IA2),
	.RESET(RA2),
	.ORDER(ORDER),
	.hours(HA2),
	.minutes(MA2),
	.seconds(SA2));


AlarmTime	b2v_inst17(
	.INCREMENT(IA3),
	.RESET(RA3),
	.ORDER(ORDER),
	.hours(HA3),
	.minutes(MA3),
	.seconds(SA3));


AlarmCheck	b2v_inst18(
	.AlarmHours(HA1),
	.AlarmMinutes(MA1),
	.AlarmSeconds(SA1),
	.ClockHours(HC),
	.ClockMinutes(MC),
	.ClockSeconds(SC),
	.Alarm(SYNTHESIZED_WIRE_6));


AlarmCheck	b2v_inst19(
	.AlarmHours(HA2),
	.AlarmMinutes(MA2),
	.AlarmSeconds(SA2),
	.ClockHours(HC),
	.ClockMinutes(MC),
	.ClockSeconds(SC),
	.Alarm(SYNTHESIZED_WIRE_1));


parser	b2v_inst2(
	.I(seconds),
	.O(SYNTHESIZED_WIRE_0),
	.T(SYNTHESIZED_WIRE_13));


AlarmCheck	b2v_inst20(
	.AlarmHours(HA3),
	.AlarmMinutes(MA3),
	.AlarmSeconds(SA3),
	.ClockHours(HC),
	.ClockMinutes(MC),
	.ClockSeconds(SC),
	.Alarm(SYNTHESIZED_WIRE_5));

assign	SYNTHESIZED_WIRE_7 = SYNTHESIZED_WIRE_2 | SYNTHESIZED_WIRE_3 | SYNTHESIZED_WIRE_4;

assign	SYNTHESIZED_WIRE_3 = EnableA3 & SYNTHESIZED_WIRE_5;

assign	SYNTHESIZED_WIRE_4 = EnableA2 & SYNTHESIZED_WIRE_6;


ringer	b2v_inst24(
	.clk(CLK),
	.on(SYNTHESIZED_WIRE_7),
	.sound(ring));
	defparam	b2v_inst24.TARGET_FREQ = 10;


parser	b2v_inst3(
	.I(minutes),
	.O(SYNTHESIZED_WIRE_12),
	.T(SYNTHESIZED_WIRE_11));


parser	b2v_inst4(
	.I(SYNTHESIZED_WIRE_8),
	.O(SYNTHESIZED_WIRE_10),
	.T(SYNTHESIZED_WIRE_9));


SevenSegmentDriver	b2v_inst5(
	.hex(SYNTHESIZED_WIRE_9),
	.O(Seg5));


SevenSegmentDriver	b2v_inst6(
	.hex(SYNTHESIZED_WIRE_10),
	.O(Seg4));


SevenSegmentDriver	b2v_inst7(
	.hex(SYNTHESIZED_WIRE_11),
	.O(Seg3));


SevenSegmentDriver	b2v_inst8(
	.hex(SYNTHESIZED_WIRE_12),
	.O(Seg2));


SevenSegmentDriver	b2v_inst9(
	.hex(SYNTHESIZED_WIRE_13),
	.O(Seg1));


endmodule
