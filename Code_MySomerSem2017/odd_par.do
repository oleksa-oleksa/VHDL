onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /paritybitodd3bits/X0
add wave -noupdate /paritybitodd3bits/X1
add wave -noupdate /paritybitodd3bits/X2
add wave -noupdate /paritybitodd3bits/Dataword
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
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
WaveRestoreZoom {0 ps} {1 ns}
view wave 
wave clipboard store
wave create -driver freeze -pattern clock -initialvalue 0 -period 100ps -dutycycle 50 -starttime 0ps -endtime 1000ps sim:/paritybitodd3bits/X0 
wave create -driver freeze -pattern clock -initialvalue 0 -period 150ps -dutycycle 50 -starttime 0ps -endtime 1000ps sim:/paritybitodd3bits/X1 
wave create -driver freeze -pattern clock -initialvalue 0 -period 200ps -dutycycle 50 -starttime 0ps -endtime 1000ps sim:/paritybitodd3bits/X2 
WaveCollapseAll -1
wave clipboard restore
