LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY tb_fourBitShift IS
END tb_fourBitShift;

ARCHITECTURE testbench OF tb_fourBitShift IS

COMPONENT fourBitShift IS
PORT( D : IN STD_LOGIC;
      Clk : IN STD_LOGIC; 
      shiftOutput : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
);
END COMPONENT;

-- define input stimul signal
SIGNAL tb_clk : STD_LOGIC :='0'; 
SIGNAL tb_D : STD_LOGIC :='0';
SIGNAL tb_shiftOutput : STD_LOGIC_VECTOR(3 DOWNTO 0) := "0000";

BEGIN

dut: ENTITY work.fourBitShift
PORT MAP ( 
      D => tb_D,
      Clk => tb_clk,
      shiftOutput => tb_shiftOutput
);

-- common processes in the separate process
clock_stimuli: PROCESS -- 100ns
BEGIN
    tb_clk <= '0'; WAIT FOR 15 ns;
    tb_clk <= '1'; WAIT FOR 10 ns;
END PROCESS; 

data_stimuli: PROCESS 
BEGIN
    tb_D <= '0';
    WAIT FOR 10 ns;

    tb_D <= '1'; 
    WAIT FOR 20 ns;

    tb_D <= '0'; 
    WAIT FOR 15 ns;

    tb_D <= '1'; 
    WAIT FOR 20 ns;
 
    tb_D <= '1'; 
    WAIT FOR 25 ns;

    tb_D <= '0'; 
    WAIT FOR 15 ns;
    
END PROCESS;

END testbench;