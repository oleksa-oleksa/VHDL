LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY fourBitShift IS
PORT( D : IN STD_LOGIC;
      Clk : IN STD_LOGIC; 
      shiftOutput : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
);
END fourBitShift;

ARCHITECTURE Behavioral OF fourBitShift IS
COMPONENT dt_dflipflop IS
PORT ( D : IN STD_LOGIC;
       Clk : IN STD_LOGIC;
       Qf : OUT STD_LOGIC
);
END COMPONENT dt_dflipflop;

SIGNAL Q3, Q2, Q1, Q0 : STD_LOGIC;

BEGIN

-- 4 Registers.
-- Loading starts here
FF_3: dt_dflipflop
PORT MAP (D, Clk, Q3);

FF_2: dt_dflipflop
PORT MAP (Q3, Clk, Q2);

FF_1: dt_dflipflop
PORT MAP (Q2, Clk, Q1);

-- MSB is here
FF_0: dt_dflipflop
PORT MAP (Q1, Clk, Q0);

shiftOutput <= Q3 & Q2 & Q1 & Q0;

END Behavioral;