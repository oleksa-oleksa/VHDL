library ieee;
use ieee.std_logic_1164.all;

ENTITY bcdarith IS
   PORT
   (
       inByte1, inByte2	: IN std_logic_vector(7 downto 0);
       outByte  : OUT std_logic_vector(7 downto 0);
       OP : IN std_logic);
END bcdarith;

ARCHITECTURE behav OF bcdarith IS

COMPONENT addsub IS
   port(  OP   : in std_logic;
          A, B : in std_logic_vector(3 downto 0);
          R  	: out std_logic_vector(3 downto 0);
          Cout : out std_logic);
			 
END COMPONENT;

BEGIN
	
	--TODO
	
END behav;