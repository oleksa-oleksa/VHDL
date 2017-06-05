LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY parityCheckWithDelay IS
GENERIC ( Th : TIME := 3 ns;
          Tp : TIME := 5 ns
);
PORT
(
  	Dataword   : IN STD_LOGIC_VECTOR (3 DOWNTO 0); -- three switches put the bit directly into array
	isBrocken  : OUT STD_LOGIC 
);
END parityCheckWithDelay;

ARCHITECTURE evenParCheck OF parityCheckWithDelay IS

SIGNAL xor1, Parity : STD_LOGIC :='X'; -- Unknown

BEGIN

ParityChecker: PROCESS -- Wait statement is illegal for sensivity list. 
	BEGIN
   	-- calculating expected paritybit
	WAIT FOR Th;
	xor1 <= Dataword(0) XOR Dataword(1) AFTER Tp; 
	WAIT FOR Th;
	Parity <= xor1 XOR Dataword(2) AFTER Tp; -- holds the calculated paritybit of dataword (1 or 0)
	WAIT FOR Th;
	
	-- Compare the existing parity with calculated
	-- XOR for detection the error
	-- if XOR2 != Dataword(3) ==> 1 else 0 (no error)
	
	isBrocken <= Dataword(3) XOR Parity AFTER Tp;
	END PROCESS ParityChecker;
	
END evenParCheck;