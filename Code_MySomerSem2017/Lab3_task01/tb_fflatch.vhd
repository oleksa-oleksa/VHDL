LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY tb_fflatch IS
END tb_fflatch;

ARCHITECTURE testbench OF tb_fflatch IS

-- D-LATCH
COMPONENT dt_dlatch
PORT ( D : IN STD_LOGIC;
       En : IN STD_LOGIC;
       Ql, nQl : OUT STD_LOGIC
);
END COMPONENT;

-- D-FLIPFLOP
COMPONENT dt_dflipflop
PORT ( D : IN STD_LOGIC;
       Clk : IN STD_LOGIC;
       Qf, nQf : OUT STD_LOGIC
);
END COMPONENT;

-- define input stimul signal
SIGNAL s_clk : STD_LOGIC :='0'; 
SIGNAL s_D : STD_LOGIC :='0';
SIGNAL s_Ql, s_nQl, s_Qf, s_nQf : STD_LOGIC;

BEGIN

dut1: ENTITY work.dt_dlatch
PORT MAP (
     D => s_D,
     En => s_clk,
     Ql => s_Ql,
     nQl => s_nQl
);

dut2: ENTITY work.dt_dflipflop
PORT MAP (
     D => s_D,
     Clk => s_clk,
     Qf => s_Qf,
     nQf => s_nQf
);

-- common processes in the separate process
clock_stimuli: PROCESS -- 100ns
BEGIN
    s_clk <= '0'; WAIT FOR 15 ns;
    s_clk <= '1'; WAIT FOR 10 ns;
END PROCESS; 

data_stimuli: PROCESS
BEGIN
    s_D <= '0'; WAIT FOR 10 ns; 
    s_D <= '1'; WAIT FOR 25 ns; 
END PROCESS;

END testbench;