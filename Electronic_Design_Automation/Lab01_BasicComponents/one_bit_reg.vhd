LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY one_bit_reg IS
PORT (   D : IN STD_LOGIC;
	LD : In STD_LOGIC;	
       CLK : IN STD_LOGIC;
	CLR : IN STD_LOGIC;
       QD, nQD : OUT STD_LOGIC
      );
END one_bit_reg;

-- D-FlipFlop reacts only on rising clock edge

ARCHITECTURE Behav OF one_bit_reg IS
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
		QD <= '0';
		nQD <= NOT D;
        END IF;
END PROCESS;
END Behav;