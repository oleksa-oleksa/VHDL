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

COMPONENT seven_seg IS
port(
      ltn            :  in std_logic;                                -- enable decoder
      bln            :  in std_logic;                                -- segment test
      hb             :  in std_logic;                                -- if 0, hexdec., if 1 displays 0 to 9
      b_in           :  in std_logic_vector(3 downto 0);             -- input number
      a,b,c,d,e,f,g  : out std_logic                                 -- output for segments
);

END COMPONENT;

BEGIN
	
	--TODO
	
END behav;