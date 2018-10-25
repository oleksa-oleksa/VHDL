LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY tb_shift_siso IS
END tb_shift_siso;

ARCHITECTURE testbench OF tb_shift_siso IS

COMPONENT shift_siso is
     port(
         clk : in STD_LOGIC;
         reset : in STD_LOGIC;
	 enable : in STD_LOGIC;
         din : in STD_LOGIC;
         dout : out STD_LOGIC
         );
END COMPONENT;

-- define input stimul signal
SIGNAL s_clk : STD_LOGIC :='0';
SIGNAL s_reset : STD_LOGIC :='0';
SIGNAL s_enable : STD_LOGIC :='0'; 
SIGNAl s_din : STD_LOGIC :='0';
SIGNAl s_dout : STD_LOGIC :='0';

BEGIN

dut: ENTITY work.shift_siso
PORT MAP (
     clk => s_clk,
     reset => s_reset,
     enable => s_enable,
     din => s_din,
     dout => s_dout
);

-- common processes in the separate process
data_stimul: PROCESS
BEGIN
    s_din <= '1'; WAIT FOR 25 ns;
    s_din <= '0'; WAIT FOR 25 ns;
END PROCESS;

clock_stimul: PROCESS 
BEGIN
    s_clk <= '1'; WAIT FOR 5 ns;
    s_clk <= '0'; WAIT FOR 5 ns;
END PROCESS; 

enable_stimul: PROCESS
BEGIN
    s_enable <= '0'; WAIT FOR 20 ns;
    s_enable <= '1'; WAIT FOR 180 ns;
END PROCESS;

reset_stimul: PROCESS
BEGIN
    s_reset <= '0'; WAIT FOR 90 ns;
    s_reset <= '1'; WAIT FOR 10 ns;
END PROCESS;

END testbench;