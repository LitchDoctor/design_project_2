module DirectClockInputs(
    input logic CLK,              // Clock signal
    input logic RESET,            // Reset signal
    input logic INCREMENT,        // Increment signal
    input logic [1:0] S,   	 // Selector

    output logic RC,
    output logic IC,
    output logic RA1,
    output logic IA1,
    output logic RA2,
    output logic IA2,
    output logic RA3,
    output logic IA3
);

    always_ff @(posedge CLK) begin
        // Default all outputs to 0
        RC <= 1;
        IC <= 0;
        RA1 <= 1;
        IA1 <= 0;
        RA2 <= 1;
        IA2 <= 0;
        RA3 <= 1;
        IA3 <= 0;

        // Conditional logic based on S
        case (S)
            2'b00: begin
                RC <= RESET;
                IC <= !INCREMENT;	
            end
            2'b01: begin
                RA1 <= RESET;
                IA1 <= !INCREMENT;
            end
            2'b10: begin
                RA2 <= RESET;
                IA2 <= !INCREMENT;
            end
            2'b11: begin
                RA3 <= RESET;
                IA3 <= !INCREMENT;
            end
        endcase
    end

endmodule
