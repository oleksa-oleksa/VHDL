LIBRARY ieee;
USE ieee.std_logic_1164.all;

-- high active enable
-- each D-latch works independently from each other to remember its own input
-- Only En is common for all latches

ENTITY fourBitLatch IS
PORT( D3, D2, D1, D0 : IN STD_LOGIC;
      Enable : IN STD_LOGIC; 
      Q3, Q2, Q1, Q0 : OUT STD_LOGIC
);
END fourBitLatch;

ARCHITECTURE Behavioral OF fourBitLatch IS
COMPONENT dt_dlatch IS
PORT ( D : IN STD_LOGIC;
       En : IN STD_LOGIC;
       Ql : OUT STD_LOGIC
);
END COMPONENT dt_dlatch;

BEGIN

-- 4 Registers, each remembers one binaty digit
DLatch_0: dt_dlatch
PORT MAP (D0, Enable, Q0);

DLatch_1: dt_dlatch
PORT MAP (D1, Enable, Q1);

DLatch_2: dt_dlatch
PORT MAP (D2, Enable, Q2);

DLatch_3: dt_dlatch
PORT MAP (D3, Enable, Q3);

END Behavioral;