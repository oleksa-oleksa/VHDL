onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix unsigned -childformat {{/paralleladdervector/A(1) -radix unsigned} {/paralleladdervector/A(0) -radix unsigned}} -expand -subitemconfig {/paralleladdervector/A(1) {-radix unsigned} /paralleladdervector/A(0) {-radix unsigned}} /paralleladdervector/A
add wave -noupdate -radix unsigned -childformat {{/paralleladdervector/B(1) -radix unsigned} {/paralleladdervector/B(0) -radix unsigned}} -expand -subitemconfig {/paralleladdervector/B(1) {-radix unsigned} /paralleladdervector/B(0) {-radix unsigned}} /paralleladdervector/B
add wave -noupdate -radix unsigned -childformat {{/paralleladdervector/S(2) -radix unsigned} {/paralleladdervector/S(1) -radix unsigned} {/paralleladdervector/S(0) -radix unsigned}} -expand -subitemconfig {/paralleladdervector/S(2) {-radix unsigned} /paralleladdervector/S(1) {-radix unsigned} /paralleladdervector/S(0) {-radix unsigned}} /paralleladdervector/S
add wave -noupdate /paralleladdervector/H0
add wave -noupdate /paralleladdervector/C0
add wave -noupdate /paralleladdervector/H1
add wave -noupdate /paralleladdervector/C1
add wave -noupdate /paralleladdervector/H2
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
configure wave -namecolwidth 194
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
WaveRestoreZoom {0 ps} {957 ps}
