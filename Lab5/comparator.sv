module comparator #(parameter N=8, parameter B=60)
						(input logic [N-1:0] a,
						output logic eq, neq, lt, lte, gt, gte
);

	assign eq = (a == B);
	assign neq = (a != B);
	assign lt = (a < B);
	assign lte = (a <= B);
	assign gt = (a > B);
	assign gte = (a >= B);
endmodule