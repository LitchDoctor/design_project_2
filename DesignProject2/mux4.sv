module mux4(input logic [7:0] c0, c1, c2, c3,
				input logic [1:0] s,
				
				output logic [7:0]o
);

	assign o = s[1] ? (s[0] ? c3 : c2) : (s[0] ? c1 : c0);
	
	
endmodule