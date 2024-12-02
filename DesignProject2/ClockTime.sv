module ClockTime(
    input wire CLK,
    input wire RST,
    input logic INCREMENT,
     
    input logic [1:0] ORDER,
    output reg [7:0] seconds = 0,
    output reg [7:0] minutes = 0,
    output reg [7:0] hours = 0
);
    reg [31:0] counter = 0;
    parameter CLOCK_FREQ = 50000000; // Assume a 50 MHz clock

    // Two flip-flops for synchronization
    reg increment_sync1 = 0;
    reg increment_sync2 = 0;
    reg increment_prev = 0;
    wire increment_pulse;

    // Synchronize INCREMENT signal to CLK domain
    always_ff @(posedge CLK or negedge RST) begin
        if (!RST) begin
            increment_sync1 <= 0;
            increment_sync2 <= 0;
            increment_prev <= 0;
        end else begin
            increment_sync1 <= INCREMENT;
            increment_sync2 <= increment_sync1;
            increment_prev <= increment_sync2;
        end
    end

    // Generate a single pulse when INCREMENT rises
    assign increment_pulse = increment_sync2 && !increment_prev;

    always_ff @(posedge CLK or negedge RST) begin
        if (!RST) begin
            counter <= 0;
            seconds <= 0;
            minutes <= 0;
            hours <= 0;
        end else begin
            counter <= counter + 1;

            // Handle manual increment
            if (increment_pulse) begin
                case (ORDER)
                    2'b00: seconds <= seconds + 1;
                    2'b01: minutes <= minutes + 1;
                    2'b10: hours <= hours + 1;
                endcase

				// Check loop
                if (seconds == 59) begin
                    seconds <= 0;
                    minutes <= minutes + 1;
                    if (minutes == 59) begin
                        minutes <= 0;
                        hours <= hours + 1;
                        if (hours == 23) begin
                            hours <= 0;
                        end
                    end
                end
            end

            // Handle automatic increment
            if (counter >= CLOCK_FREQ - 1) begin
                counter <= 0;
                seconds <= seconds + 1;

                if (seconds >= (60-1)) begin
                    seconds <= 0;
                    minutes <= minutes + 1;
                end

                if (minutes >= (60-1)) begin
                    minutes <= 0;
                    hours <= hours + 1;
                end

                if (hours >= (24-1)) hours <= 0;
            end
        end
    end
endmodule