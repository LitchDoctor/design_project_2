module DirectClockInputs(input logic RESET,
								 input logic INCREMENT,
								 input logic [1:0] S,
								
								 output logic RC,
								 output logic IC,
								 
								 output logic RA1,
								 output logic IA1,
								 
								 output logic RA2,
								 output logic IA2,
								 
								 output logic RA3,
								 output logic IA3
								 );
								 
	assign RC = (S==2'b00) ? RESET : 0;
	assign IC = (S==2'b00) ? INCREMENT : 0;
	
	assign RA1 = (S==2'b01) ? RESET : 0;
	assign IA1 = (S==2'b01) ? INCREMENT : 0;
	
	assign RA2 = (S==2'b10) ? RESET : 0;
	assign IA2 = (S==2'b10) ? INCREMENT : 0;
	
	assign RA3 = (S==2'b11) ? RESET : 0;
	assign IA3 = (S==2'b11) ? INCREMENT : 0;
 endmodule
			 