module ringer (
    input logic clk,      // System clock
    input logic on,       // Control signal to start/stop the alarm
    output logic sound    // Output sound signal
);

    parameter TARGET_FREQ_A = 2;       // Frequency 1 in Hz
    parameter TARGET_FREQ_B = 4;       // Frequency 2 in Hz
    parameter TARGET_FREQ_C = 8;       // Frequency 3 in Hz
    parameter SECONDS = 5;             // Duration in seconds
    parameter CLK_FREQ = 50000000;     // Clock frequency in Hz

    localparam DURATION = SECONDS * CLK_FREQ;    // Total clock cycles for the alarm
    localparam START_B = DURATION / 3;           // Transition point to frequency B
    localparam START_C = 2 * DURATION / 3;       // Transition point to frequency C

    // Calculate toggle counts for each frequency
    localparam TOGGLE_COUNT_A = CLK_FREQ / (2 * TARGET_FREQ_A);
    localparam TOGGLE_COUNT_B = CLK_FREQ / (2 * TARGET_FREQ_B);
    localparam TOGGLE_COUNT_C = CLK_FREQ / (2 * TARGET_FREQ_C);

    logic [$clog2(DURATION):0] counter;    // Main counter for timing
    logic [$clog2(TOGGLE_COUNT_A):0] toggle_counter;  // Counter for toggling the sound
    logic [$clog2(TOGGLE_COUNT_A):0] current_toggle_count;  // Current toggle threshold

    always_ff @(posedge clk) begin
        if (on && counter >= DURATION) begin
            // Reset logic when the alarm is triggered
				counter <= 0;
				 sound <= 0;
				 toggle_counter <= 0;
			end
				
            if (counter < DURATION) begin
                // Determine the current toggle count based on the counter range
                if (counter < START_B)
                    current_toggle_count <= TOGGLE_COUNT_A;
                else if (counter < START_C)
                    current_toggle_count <= TOGGLE_COUNT_B;
                else
                    current_toggle_count <= TOGGLE_COUNT_C;

                // Increment the toggle counter and toggle sound if threshold is reached
                toggle_counter <= toggle_counter + 1;
                if (toggle_counter >= current_toggle_count) begin
                    toggle_counter <= 0;
                    sound <= ~sound;
                end

                // Increment the main counter
                counter <= counter + 1;
            end else begin
                // Stop the alarm after the duration
                sound <= 0;
            end
        
    end
endmodule
