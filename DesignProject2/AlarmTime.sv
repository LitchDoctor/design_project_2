module AlarmTime(
    input logic INCREMENT,
    input logic RESET,
    input logic [1:0] ORDER,
    
	 output reg [7:0] seconds,
    output reg [7:0] minutes,
    output reg [7:0] hours
);

    // Initial block to set default values during simulation
    initial begin
        seconds = 0;
        minutes = 0;
        hours = 0;
    end


	 initial begin
        seconds = 0;
        minutes = 0;
        hours = 0;
    end
    always @(posedge INCREMENT) begin
            if (!RESET) begin
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
					//Loop Checks
					if (seconds >= 59) begin
						seconds <= 0;
						minutes <= minutes+1;
					end
					
					if (minutes >= 59) begin
						minutes <= 0;
						hours <= hours + 1;
					end
					
					
					if (hours >= 23) hours <= 0;
			end
	end
endmodule