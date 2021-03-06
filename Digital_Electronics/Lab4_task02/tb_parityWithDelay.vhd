LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY tb_parityWithDelay is
END tb_parityWithDelay;

ARCHITECTURE test OF tb_parityWithDelay IS

COMPONENT parityWithDelay
GENERIC ( Th : TIME := 3 ns;
          Tp : TIME := 5 ns
);
PORT (
	X2, X1, X0 : IN STD_LOGIC;
	Dataword   : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
);
END COMPONENT;

SIGNAL X0 : STD_LOGIC := 'X';
SIGNAL X1 : STD_LOGIC := 'X';
SIGNAL X2 : STD_LOGIC := 'X';
SIGNAL Dataword : STD_LOGIC_VECTOR (3 DOWNTO 0) := "XXXX";


BEGIN
dut1: parityWithDelay
PORT MAP (
      X2 => X2,
      X1 => X1,
      X0 => X0,
      Dataword => Dataword
);

	
X0 <= '0' AFTER 0 ns, '1' AFTER  20 ns, 
      '0' AFTER  40 ns, '1' AFTER 60 ns, 
      '0' AFTER 80 ns, '1' AFTER 100 ns, 
      '0' AFTER 120 ns, '1' AFTER 140 ns;

X1 <= '0' AFTER 0 ns, '0' AFTER  20 ns, 
      '1' AFTER  40 ns, '1' AFTER 60 ns, 
      '0' AFTER 80 ns, '0' AFTER 100 ns, 
      '1' AFTER 120 ns, '1' AFTER 140 ns;

X2 <= '0' AFTER 0 ns, '0' AFTER  20 ns, 
      '0' AFTER  40 ns, '0' AFTER 60 ns, 
      '1' AFTER 80 ns, '1' AFTER 100 ns, 
      '1' AFTER 120 ns, '1' AFTER 140 ns,
      '0' AFTER 160 ns;
      
END test;
