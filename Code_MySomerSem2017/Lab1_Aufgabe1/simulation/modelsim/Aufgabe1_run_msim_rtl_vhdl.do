transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {H:/DT_workDir/Lab1_Aufgabe1/Aufgabe1.vhd}
