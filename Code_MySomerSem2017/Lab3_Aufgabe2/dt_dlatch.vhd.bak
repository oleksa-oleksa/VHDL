LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY dt_dlatch IS
PORT ( D : IN STD_LOGIC;
       En : IN STD_LOGIC;
       Ql, nQl : OUT STD_LOGIC
      );
END dt_dlatch;

-- Gated D latch is implemented in a VHDL process. 
-- In the process, if EN is high, then Q = D 
-- When EN is low nothing happens -> NC .

ARCHITECTURE BehavioralLatch OF dt_dlatch IS
BEGIN

PROCESS (D, En) -- Sensivity list
BEGIN
	IF (En = '1') THEN
		Ql <= D;
		nQl <= NOT D;
        END IF;
END PROCESS;


END BehavioralLatch;
