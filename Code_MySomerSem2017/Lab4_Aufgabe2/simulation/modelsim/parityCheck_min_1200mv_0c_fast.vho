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

-- DATE "05/10/2017 16:36:45"

-- 
-- Device: Altera EP4CE115F29C7 Package FBGA780
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY CYCLONEIVE;
LIBRARY IEEE;
LIBRARY STD;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;
USE STD.STANDARD.ALL;

ENTITY 	parityCheck IS
    PORT (
	Dataword : IN STD.STANDARD.bit_vector(3 DOWNTO 0);
	isBrocken : OUT STD.STANDARD.bit
	);
END parityCheck;

-- Design Ports Information
-- isBrocken	=>  Location: PIN_L7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Dataword[0]	=>  Location: PIN_L6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Dataword[1]	=>  Location: PIN_N3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Dataword[2]	=>  Location: PIN_M5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Dataword[3]	=>  Location: PIN_N4,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF parityCheck IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_Dataword : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_isBrocken : std_logic;
SIGNAL \isBrocken~output_o\ : std_logic;
SIGNAL \Dataword[1]~input_o\ : std_logic;
SIGNAL \Dataword[2]~input_o\ : std_logic;
SIGNAL \Dataword[3]~input_o\ : std_logic;
SIGNAL \Dataword[0]~input_o\ : std_logic;
SIGNAL \isBrocken~0_combout\ : std_logic;

BEGIN

ww_Dataword <= IEEE.STD_LOGIC_1164.TO_STDLOGICVECTOR(Dataword);
isBrocken <= IEEE.STD_LOGIC_1164.TO_BIT(ww_isBrocken);
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

-- Location: IOOBUF_X0_Y47_N16
\isBrocken~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \isBrocken~0_combout\,
	devoe => ww_devoe,
	o => \isBrocken~output_o\);

-- Location: IOIBUF_X0_Y46_N22
\Dataword[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Dataword(1),
	o => \Dataword[1]~input_o\);

-- Location: IOIBUF_X0_Y47_N1
\Dataword[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Dataword(2),
	o => \Dataword[2]~input_o\);

-- Location: IOIBUF_X0_Y46_N15
\Dataword[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Dataword(3),
	o => \Dataword[3]~input_o\);

-- Location: IOIBUF_X0_Y47_N22
\Dataword[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Dataword(0),
	o => \Dataword[0]~input_o\);

-- Location: LCCOMB_X1_Y47_N16
\isBrocken~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \isBrocken~0_combout\ = \Dataword[1]~input_o\ $ (\Dataword[2]~input_o\ $ (\Dataword[3]~input_o\ $ (\Dataword[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Dataword[1]~input_o\,
	datab => \Dataword[2]~input_o\,
	datac => \Dataword[3]~input_o\,
	datad => \Dataword[0]~input_o\,
	combout => \isBrocken~0_combout\);

ww_isBrocken <= \isBrocken~output_o\;
END structure;


