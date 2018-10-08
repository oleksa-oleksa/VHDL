onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -height 30 /majority/x1
add wave -noupdate -height 30 /majority/x2
add wave -noupdate -height 30 /majority/x3
add wave -noupdate -color Magenta -height 30 /majority/f
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {986 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {1008 ps}
view wave 
wave clipboard store
wave create -driver freeze -pattern clock -initialvalue 0 -period 100ns -dutycycle 8 -starttime 0ns -endtime 800ns sim:/majority/x1 
wave create -driver freeze -pattern clock -initialvalue 1 -period 200ps -dutycycle 50 -starttime 0ps -endtime 1000ps sim:/majority/x2 
wave create -driver freeze -pattern clock -initialvalue 0 -period 300ps -dutycycle 50 -starttime 0ps -endtime 1000ps sim:/majority/x3 
wave create -driver freeze -pattern clock -initialvalue 1 -period 100ps -dutycycle 50 -starttime 0ps -endtime 1000ps sim:/majority/x1 
WaveCollapseAll -1
wave clipboard restore
