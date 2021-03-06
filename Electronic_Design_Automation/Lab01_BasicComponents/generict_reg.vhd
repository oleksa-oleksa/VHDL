LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.numeric_bit.all;

ENTITY generic_reg IS

GENERIC (BUS_WIDTH : INTEGER := 8);

PORT   (D : IN STD_LOGIC_VECTOR(BUS_WIDTH-1 DOWNTO 0);
	LD : IN STD_LOGIC;	
       CLK : IN STD_LOGIC;
	CLR : IN STD_LOGIC;
       QD, nQD : OUT STD_LOGIC_VECTOR(BUS_WIDTH-1 DOWNTO 0)
      );
END generic_reg ;

-- D-FlipFlop reacts only on rising clock edge

ARCHITECTURE Behav OF generic_reg  IS
BEGIN

-- Using rising_edge instead of clock'event to avoid unexpected trigger in std_logic
-- This function returns a value "TRUE" only when the present value is '1' and the last value is '0'.
-- If the past value is something like 'Z','U' etc. then it will return a "FALSE"

PROCESS (CLK, CLR, LD) -- Sensivity list
BEGIN
	IF (rising_edge(CLK) AND (LD = '1') AND (CLR = '0')) THEN
		QD <= D;
		nQD <= NOT D;
	ELSIF (CLR'event AND CLR = '1') THEN
		QD <= "00000000";
		nQD <= NOT D;
        END IF;
END PROCESS;
END Behav;