module SevenSegmentDriver(
    input wire [3:0] hex,        // Most Significant Bit (MSB)
    output reg [6:0] O           //
);

    always @(*) begin
        case (hex)
            4'h0: O = ~7'b0111111; // 0
            4'h1: O = ~7'b0000110; // 1
            4'h2: O = ~7'b1011011; // 2
            4'h3: O = ~7'b1001111; // 3
            4'h4: O = ~7'b1100110; // 4
            4'h5: O = ~7'b1101101; // 5
            4'h6: O = ~7'b1111101; // 6
            4'h7: O = ~7'b0000111; // 7
            4'h8: O = ~7'b1111111; // 8
            4'h9: O = ~7'b1101111; // 9
            4'hA: O = ~7'b1110111; // A
            4'hB: O = ~7'b1111100; // b
            4'hC: O = ~7'b0111001; // C
            4'hD: O = ~7'b1011110; // d
            4'hE: O = ~7'b1111001; // E
            4'hF: O = ~7'b1110001; // F
            default: O = ~7'b0000000; // All segments off
        endcase
    end

endmodule