vsim -gui work.DesignProject2

add wave *

# Reset and clock setup
force RST 0 @ 0, 1 @ 30 
force CLK 0 @ 0, 1 @ 10 -r 20 

# Initially disable all alarms
force EnableA1 1
force EnableA2 1
force EnableA3 1

# Setup for setting Alarm 1 (3:06:00)
# First set hours = 3
force SELECTALARM[0] 1 @ 0
force SELECTALARM[1] 0 @ 0 

force ORDER[0] 0 @ 0
force ORDER[1] 1 @ 0
force INCREMENT 0 @ 0, 1 @ 40, 0 @ 60, 1 @ 80, 0 @ 100, 1 @ 120, 0 @ 140

# Set minutes = 4
force ORDER[0] 1 @ 240
force ORDER[1] 0 @ 240
force INCREMENT 0 @ 240, 1 @ 240, 0 @ 260, 1 @ 280, 0 @ 300, 1 @ 320, 0 @ 340, 1 @ 360, 0 @ 380

# Now set the clock time (3:04:00)
force SELECTALARM[0] 0 @ 500
force SELECTALARM[1] 0 @ 500

# Set hours = 3
force ORDER[0] 0 @ 640
force ORDER[1] 1 @ 640
force INCREMENT 0 @ 640, 1 @ 640, 0 @ 660, 1 @ 680, 0 @ 700, 1 @ 720, 0 @ 740

# Set minutes = 3
force ORDER[0] 1 @ 840
force ORDER[1] 0 @ 840
force INCREMENT 0 @ 840, 1 @ 840, 0 @ 860, 1 @ 880, 0 @ 900

# Set seconds = 0
force ORDER[0] 0 @ 1040
force ORDER[1] 0 @ 1040

# Enable Alarm 1
force EnableA1 1 @ 2000

run 20000