module AlarmCheck (
    input logic [7:0] AlarmSeconds,
    input logic [7:0] AlarmMinutes,
    input logic [7:0] AlarmHours,
    input logic [7:0] ClockSeconds,
    input logic [7:0] ClockMinutes,
    input logic [7:0] ClockHours,
    output logic Alarm
);

    assign Alarm = (
        (AlarmSeconds == ClockSeconds) &&
        (AlarmMinutes == ClockMinutes) &&
        (AlarmHours == ClockHours)
    );

endmodule
