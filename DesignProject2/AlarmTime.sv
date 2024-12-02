module AlarmTime(
    input logic INCREMENT,
    input logic RESET,
    input logic [1:0] ORDER,
    
	 output reg [7:0] seconds = 0,
    output reg [7:0] minutes = 0,
    output reg [7:0] hours = 0
);

	logic last_inc = 0;
	
	always_ff@(posedge INCREMENT) begin
		last_inc <= INCREMENT;
	end

    always @(posedge last_inc or negedge RESET) begin
            if (!RESET) begin
                seconds <= 0;
                minutes <= 0;
                hours <= 0;
            end else if (last_inc) begin
				
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

