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

-- DATE "05/03/2017 16:48:13"

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

ENTITY 	parity IS
    PORT (
	X2 : IN std_logic;
	X1 : IN std_logic;
	X0 : IN std_logic;
	Dataword : BUFFER std_logic_vector(3 DOWNTO 0)
	);
END parity;

-- Design Ports Information
-- Dataword[0]	=>  Location: PIN_E21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Dataword[1]	=>  Location: PIN_E22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Dataword[2]	=>  Location: PIN_E25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Dataword[3]	=>  Location: PIN_E24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- X0	=>  Location: PIN_AB28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- X1	=>  Location: PIN_AC28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- X2	=>  Location: PIN_AC27,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF parity IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_X2 : std_logic;
SIGNAL ww_X1 : std_logic;
SIGNAL ww_X0 : std_logic;
SIGNAL ww_Dataword : std_logic_vector(3 DOWNTO 0);
SIGNAL \Dataword[0]~output_o\ : std_logic;
SIGNAL \Dataword[1]~output_o\ : std_logic;
SIGNAL \Dataword[2]~output_o\ : std_logic;
SIGNAL \Dataword[3]~output_o\ : std_logic;
SIGNAL \X0~input_o\ : std_logic;
SIGNAL \X1~input_o\ : std_logic;
SIGNAL \X2~input_o\ : std_logic;
SIGNAL \xor2~0_combout\ : std_logic;

BEGIN

ww_X2 <= X2;
ww_X1 <= X1;
ww_X0 <= X0;
Dataword <= ww_Dataword;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

-- Location: IOOBUF_X107_Y73_N9
\Dataword[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \X0~input_o\,
	devoe => ww_devoe,
	o => \Dataword[0]~output_o\);

-- Location: IOOBUF_X111_Y73_N9
\Dataword[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \X1~input_o\,
	devoe => ww_devoe,
	o => \Dataword[1]~output_o\);

-- Location: IOOBUF_X83_Y73_N2
\Dataword[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \X2~input_o\,
	devoe => ww_devoe,
	o => \Dataword[2]~output_o\);

-- Location: IOOBUF_X85_Y73_N23
\Dataword[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \xor2~0_combout\,
	devoe => ww_devoe,
	o => \Dataword[3]~output_o\);

-- Location: IOIBUF_X115_Y17_N1
\X0~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_X0,
	o => \X0~input_o\);

-- Location: IOIBUF_X115_Y14_N1
\X1~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_X1,
	o => \X1~input_o\);

-- Location: IOIBUF_X115_Y15_N8
\X2~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_X2,
	o => \X2~input_o\);

-- Location: LCCOMB_X112_Y72_N16
\xor2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \xor2~0_combout\ = \X1~input_o\ $ (\X0~input_o\ $ (\X2~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001100101100110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \X1~input_o\,
	datab => \X0~input_o\,
	datad => \X2~input_o\,
	combout => \xor2~0_combout\);

ww_Dataword(0) <= \Dataword[0]~output_o\;

ww_Dataword(1) <= \Dataword[1]~output_o\;

ww_Dataword(2) <= \Dataword[2]~output_o\;

ww_Dataword(3) <= \Dataword[3]~output_o\;
END structure;


