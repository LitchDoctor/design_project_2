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

    always @(posedge CLK, negedge RST) begin
            if (!RST) begin
                counter <= 0;
                seconds <= 0;
                minutes <= 0;
                hours <= 0;
            end else begin
				   counter <= counter + 1;
				   if (counter >= CLOCK_FREQ - 1) begin
						counter <= 0;
						seconds <= seconds + 1; 

						//Loop Checks
						if (seconds >= (60-1)) begin
							seconds <= 0;
							minutes <= minutes+1;
						end//endif
						
						if (minutes >= (60-1)) begin
							minutes <= 0;
							hours <= hours + 1;
						end //endif
						
						if (hours >= (24-1)) hours <= 0;
					end//endif
            

			end //end - if not rst
    end //end always block
endmodule