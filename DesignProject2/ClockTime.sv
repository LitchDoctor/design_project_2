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

    always @(posedge CLK, posedge INCREMENT) begin
            if (!RST) begin
                counter <= 0;
                seconds <= 0;
                minutes <= 0;
                hours <= 0;
            end else begin
				
					case(ORDER)
						2'b00: begin
							seconds <= seconds + 1; 
						end
						2'b01: begin
							minutes <= minutes + 1;
						end
						2'b10: begin
							hours <= hours + 1;
						end
						
					endcase

				  if (CLK) counter <= counter + 1;
					  if ( INCREMENT || (counter >= CLOCK_FREQ - 1)) begin
							  counter <= 0;
							  seconds <= seconds + 1;

							  if (seconds >= 59) begin
									 seconds <= 0;
									 minutes <= minutes + 1;

									 if (minutes >= 59) begin
											minutes <= 0;
											hours <= hours + 1;

											if (hours >= 23) begin
													hours <= 0;
											end
									 end
							  end
						end
            end
    end
endmodule