LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY tb_shift_sipo IS
END tb_shift_sipo;

ARCHITECTURE testbench OF tb_shift_sipo IS

COMPONENT shift_sipo is
     port(
         clk : in STD_LOGIC;
         reset : in STD_LOGIC;
         din : in STD_LOGIC;
         dout : out STD_LOGIC_VECTOR(3 downto 0)
         );
END COMPONENT;

-- define input stimul signal
SIGNAL s_clk : STD_LOGIC :='0';
SIGNAL s_reset : STD_LOGIC :='0';
SIGNAl s_din : STD_LOGIC :='0';
SIGNAl s_dout : STD_LOGIC_VECTOR(3 downto 0) := "0000";

BEGIN

dut: ENTITY work.shift_sipo
PORT MAP (
     clk => s_clk,
     reset => s_reset,
     din => s_din,
     dout => s_dout
);

-- common processes in the separate process
data_stimul: PROCESS
BEGIN
    s_din <= '1'; WAIT FOR 100 ns;
END PROCESS;

clock_stimul: PROCESS 
BEGIN
    s_clk <= '1'; WAIT FOR 5 ns;
    s_clk <= '0'; WAIT FOR 5 ns;
END PROCESS; 

reset_stimul: PROCESS
BEGIN
    s_reset <= '0'; WAIT FOR 250 ns;
    s_reset <= '1'; WAIT FOR 20 ns;
END PROCESS;

END testbench;