module ringer (
    input logic clk,      
    input logic on,       
    output logic sound
);

    parameter TARGET_FREQ = 5; //Target
	 
    localparam CLK_FREQ = 5; // CLK inpu frequenct
	 
    localparam TOGGLE_COUNT = CLK_FREQ / (2 * TARGET_FREQ); //

    logic [$clog2(TOGGLE_COUNT):0] counter;

    always_ff @(posedge clk) begin
        if (on) begin //if on emit sound
            if (counter == TOGGLE_COUNT - 1) begin
                counter <= 0;
                sound <= ~sound;
            end else begin
                counter <= counter + 1;
            end
        end else begin //if not on dont emit sound
            counter <= 0;
            sound <= 0;
        end
    end

endmodule
