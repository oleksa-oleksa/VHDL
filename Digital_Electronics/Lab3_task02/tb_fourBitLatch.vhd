LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY tb_fourBitLatch IS
END tb_fourBitLatch;

ARCHITECTURE testbench OF tb_fourBitLatch IS

COMPONENT fourBitLatch IS
PORT( D3, D2, D1, D0 : IN STD_LOGIC;
      Enable : IN STD_LOGIC; 
      Q3, Q2, Q1, Q0 : OUT STD_LOGIC
);
END COMPONENT;

-- define input stimul signal
SIGNAL tb_clk : STD_LOGIC :='0'; 
SIGNAL tb_D3 : STD_LOGIC :='0';
SIGNAL tb_D2 : STD_LOGIC :='0';
SIGNAL tb_D1 : STD_LOGIC :='0';
SIGNAL tb_D0 : STD_LOGIC :='0';
SIGNAL tb_Q3, tb_Q2, tb_Q1, tb_Q0 : STD_LOGIC;

BEGIN

dut: ENTITY work.fourBitLatch
PORT MAP ( 
      D3 => tb_D3,
      D2 => tb_D2,
      D1 => tb_D1,
      D0 => tb_D0,
      Enable => tb_clk,
      Q3 => tb_Q3,
      Q2 => tb_Q2,
      Q1 => tb_Q1,
      Q0 => tb_Q0
);

-- common processes in the separate process
clock_stimuli: PROCESS -- 100ns
BEGIN
    tb_clk <= '0'; WAIT FOR 15 ns;
    tb_clk <= '1'; WAIT FOR 10 ns;
END PROCESS; 

data_stimuli: PROCESS 
BEGIN
    tb_D3 <= '0';
    tb_D2 <= '0';
    tb_D1 <= '0';
    tb_D0 <= '1'; 
    WAIT FOR 10 ns;

    tb_D3 <= '0';
    tb_D2 <= '0';
    tb_D1 <= '1';
    tb_D0 <= '0'; 
    WAIT FOR 20 ns;

    tb_D3 <= '0';
    tb_D2 <= '1';
    tb_D1 <= '0';
    tb_D0 <= '0'; 
    WAIT FOR 15 ns;

    tb_D3 <= '1';
    tb_D2 <= '0';
    tb_D1 <= '0';
    tb_D0 <= '0'; 
    WAIT FOR 20 ns;

    tb_D3 <= '1';
    tb_D2 <= '1';
    tb_D1 <= '1';
    tb_D0 <= '1'; 
    WAIT FOR 25 ns;

    tb_D3 <= '0';
    tb_D2 <= '0';
    tb_D1 <= '0';
    tb_D0 <= '0'; 
    WAIT FOR 15 ns;
    
END PROCESS;

END testbench;