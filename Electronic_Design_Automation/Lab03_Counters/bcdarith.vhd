library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY bcdarith IS
   PORT
   (
       CLK, RST : in std_logic;
 	SIGN, OPERATION       : in std_logic; -- SIGN = 1 means first number is negative
					      -- OP = 1 means second number is negative 
	X1, X2, Y1, Y2: IN std_logic_vector(3 downto 0);
       SUM1, SUM2  : OUT std_logic_vector(3 downto 0);
       OP : IN std_logic);
END bcdarith;

ARCHITECTURE behav OF bcdarith IS

COMPONENT addsub IS
   port(  CLK, RST      : in std_logic;
          A1, B1, A2, B2 : in unsigned(3 downto 0);
          R1, R2	: out unsigned(3 downto 0); 
	  Cout  	: buffer std_logic;
          OVERFLOW      : out std_logic
	);
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
SIGNAL NEG_X1, NEG_X2, NEG_Y1, NEG_Y2 : std_logic_vector(3 downto 0);
BEGIN
main: PROCESS (CLK, rst)
BEGIN
	IF (rst = '0') THEN
		SUM1 <= "0000";
		SUM2 <= "0000";
	
	elsif (rising_edge(clk) AND rst = '1') then
		if (SIGN = '1') then -- convert first number to two's complement
			NEG_X1 <= NOT (X1);
			NEG_X1 <= X1 XOR '1';
			NEG_X2 <= NOT (X2);
			NEG_X2 <= X2 XOR '1';
		end if;
		if (OPERATION = '1') then -- convert first number to two's complement
			NEG_Y1 <= NOT (Y1);
			NEG_Y1 <= Y1 XOR '1';
			NEG_Y2 <= NOT (Y2);
			NEG_Y2 <= Y2 XOR '1';
		end if;

	end if;	
END PROCESS;

BCD_Arithmetic: addsub PORT MAP (CLK, RST, X1, Y1, X2, Y2, SUM1, SUM2);

END behav;