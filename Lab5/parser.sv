module parser(
    input wire [7:0] I,      // 8-bit binary input
    output wire [3:0] O,     // ones
    output wire [3:0] T      // tens
);

    wire [7:0] binary_tens;  // Temporary wire to hold the tens calculation

    // Calculate the tens and ones digits for a binary-to-decimal conversion
    assign binary_tens = I / 10;   // Get the tens place
    assign T = binary_tens[3:0];   // Assign the lower 4 bits to T (BCD tens)
    assign O = I % 10;             // Assign the remainder to O (BCD ones)

endmodule