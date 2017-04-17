onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /rsff_nor/S
add wave -noupdate /rsff_nor/R
add wave -noupdate /rsff_nor/Q
add wave -noupdate /rsff_nor/nQ
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {514 ps} 0}
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
WaveRestoreZoom {0 ps} {1 ns}
view wave 
wave clipboard store
wave create -driver freeze -pattern clock -initialvalue U -period 250ps -dutycycle 50 -starttime 0ps -endtime 1000ps sim:/rsff_nor/S 
wave create -driver freeze -pattern clock -initialvalue U -period 300ps -dutycycle 50 -starttime 0ps -endtime 1000ps sim:/rsff_nor/R 
WaveCollapseAll -1
wave clipboard restore
