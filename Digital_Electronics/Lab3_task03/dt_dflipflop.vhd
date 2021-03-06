LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY dt_dflipflop IS
PORT ( D : IN STD_LOGIC;
       Clk : IN STD_LOGIC;
       Qf : OUT STD_LOGIC
      );
END dt_dflipflop;

-- D-FlipFlop reacts only on rising clock edge

ARCHITECTURE BehavioralFF OF dt_dflipflop IS
BEGIN


-- Using rising_edge instead of clock'event to avoid unexpected trigger in std_logic
-- This function returns a value "TRUE" only when the present value is '1' and the last value is '0'.
-- If the past value is something like 'Z','U' etc. then it will return a "FALSE"

PROCESS (Clk) -- Sensivity list
BEGIN
	IF (rising_edge(clk)) THEN
		Qf <= D;
        END IF;
END PROCESS;


END BehavioralFF;