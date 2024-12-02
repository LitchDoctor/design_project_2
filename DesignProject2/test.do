vsim -gui work.DesignProject2

add wave *

force RST 0 @ 0, 1 @ 30
force CLK 0 @ 0, 1 @ 10 -r 20

force EnableA1 0
force EnableA2 0
force EnableA3 0

force INCREMENENT 0 @ 0
force SELECTALARM[0] 0 @ 0
force SELECTALARM[1] 0 @ 0

force ORDER[0] 0 @ 0
force SELECTALARM[1] 0 @ 0

run 20000