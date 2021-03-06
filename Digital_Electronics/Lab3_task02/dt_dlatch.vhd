LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY dt_dlatch IS
PORT ( D : IN STD_LOGIC;
       En : IN STD_LOGIC;
       Ql : OUT STD_LOGIC
      );
END dt_dlatch;

-- SWITCH on Altera Board is low-active
-- Gated D latch is implemented in a VHDL process. 
-- In the process, if EN is low, then Q = D 
-- When EN is hight nothing happens -> NC .

ARCHITECTURE BehavioralLatch OF dt_dlatch IS
BEGIN

PROCESS (D, En) -- Sensivity list
BEGIN
	IF (En = '0') THEN
		Ql <= D;	
        END IF;
END PROCESS;


END BehavioralLatch;
