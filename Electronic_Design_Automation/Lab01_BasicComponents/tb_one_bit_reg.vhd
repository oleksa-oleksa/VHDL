LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY tb_one_bit_reg IS
END tb_one_bit_reg;

ARCHITECTURE testbench OF tb_one_bit_reg IS

-- D-FLIPFLOP
COMPONENT one_bit_reg
PORT (   D : IN STD_LOGIC;
	LD : In STD_LOGIC;	
       CLK : IN STD_LOGIC;
	CLR : IN STD_LOGIC;
       QD, nQD : OUT STD_LOGIC
);
END COMPONENT;

-- define input stimul signal
SIGNAL s_D : STD_LOGIC :='0';
SIGNAL s_LD : STD_LOGIC :='0';
SIGNAL s_clk : STD_LOGIC :='0';
SIGNAL s_clr : STD_LOGIC :='0'; 
SIGNAL s_QD, s_nQD : STD_LOGIC;

BEGIN

dut: ENTITY work.one_bit_reg
PORT MAP (
     D => s_D,
     LD => s_LD,
     CLK => s_clk,
     CLR => s_clr,
     QD => s_QD,
     nQD => s_nQD
);

-- common processes in the separate process
data_stimul: PROCESS
BEGIN
    s_D <= '0'; WAIT FOR 8 ns; 
    s_D <= '1'; WAIT FOR 12 ns; 
END PROCESS;

clock_stimul: PROCESS 
BEGIN
    s_clk <= '0'; WAIT FOR 16 ns;
    s_clk <= '1'; WAIT FOR 24 ns;
END PROCESS; 

enable_stimul: PROCESS
BEGIN
    s_LD <= '0'; WAIT FOR 32 ns;
    s_LD <= '1'; WAIT FOR 48 ns;
END PROCESS;

clear_stimul: PROCESS
BEGIN
    s_clr <= '0'; WAIT FOR 74 ns;
    s_clr <= '1'; WAIT FOR 96 ns;
END PROCESS;

END testbench;