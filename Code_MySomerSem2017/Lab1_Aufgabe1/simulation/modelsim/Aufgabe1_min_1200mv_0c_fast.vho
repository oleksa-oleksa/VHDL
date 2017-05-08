-- Copyright (C) 1991-2014 Altera Corporation. All rights reserved.
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, the Altera Quartus II License Agreement,
-- the Altera MegaCore Function License Agreement, or other 
-- applicable license agreement, including, without limitation, 
-- that your use is for the sole purpose of programming logic 
-- devices manufactured by Altera and sold by Altera or its 
-- authorized distributors.  Please refer to the applicable 
-- agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 14.1.0 Build 186 12/03/2014 SJ Web Edition"

-- DATE "05/03/2017 17:14:48"

-- 
-- Device: Altera EP4CE115F29C7 Package FBGA780
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	Aufgabe1 IS
    PORT (
	IA : IN std_logic;
	IB : IN std_logic;
	S : IN std_logic;
	E : IN std_logic;
	Y1 : BUFFER std_logic;
	Y2 : BUFFER std_logic;
	Y3 : BUFFER std_logic
	);
END Aufgabe1;

-- Design Ports Information
-- Y1	=>  Location: PIN_E21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Y2	=>  Location: PIN_E22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Y3	=>  Location: PIN_E25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- IB	=>  Location: PIN_AD27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- IA	=>  Location: PIN_AC27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- S	=>  Location: PIN_AC28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- E	=>  Location: PIN_AB28,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF Aufgabe1 IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_IA : std_logic;
SIGNAL ww_IB : std_logic;
SIGNAL ww_S : std_logic;
SIGNAL ww_E : std_logic;
SIGNAL ww_Y1 : std_logic;
SIGNAL ww_Y2 : std_logic;
SIGNAL ww_Y3 : std_logic;
SIGNAL \Y1~output_o\ : std_logic;
SIGNAL \Y2~output_o\ : std_logic;
SIGNAL \Y3~output_o\ : std_logic;
SIGNAL \IB~input_o\ : std_logic;
SIGNAL \IA~input_o\ : std_logic;
SIGNAL \S~input_o\ : std_logic;
SIGNAL \E~input_o\ : std_logic;
SIGNAL \Y1~0_combout\ : std_logic;

BEGIN

ww_IA <= IA;
ww_IB <= IB;
ww_S <= S;
ww_E <= E;
Y1 <= ww_Y1;
Y2 <= ww_Y2;
Y3 <= ww_Y3;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

-- Location: IOOBUF_X107_Y73_N9
\Y1~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Y1~0_combout\,
	devoe => ww_devoe,
	o => \Y1~output_o\);

-- Location: IOOBUF_X111_Y73_N9
\Y2~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Y1~0_combout\,
	devoe => ww_devoe,
	o => \Y2~output_o\);

-- Location: IOOBUF_X83_Y73_N2
\Y3~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Y1~0_combout\,
	devoe => ww_devoe,
	o => \Y3~output_o\);

-- Location: IOIBUF_X115_Y13_N8
\IB~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_IB,
	o => \IB~input_o\);

-- Location: IOIBUF_X115_Y15_N8
\IA~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_IA,
	o => \IA~input_o\);

-- Location: IOIBUF_X115_Y14_N1
\S~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_S,
	o => \S~input_o\);

-- Location: IOIBUF_X115_Y17_N1
\E~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_E,
	o => \E~input_o\);

-- Location: LCCOMB_X114_Y17_N16
\Y1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Y1~0_combout\ = (!\E~input_o\ & ((\S~input_o\ & (\IB~input_o\)) # (!\S~input_o\ & ((\IA~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \IB~input_o\,
	datab => \IA~input_o\,
	datac => \S~input_o\,
	datad => \E~input_o\,
	combout => \Y1~0_combout\);

ww_Y1 <= \Y1~output_o\;

ww_Y2 <= \Y2~output_o\;

ww_Y3 <= \Y3~output_o\;
END structure;


