library ieee;
use ieee.std_logic_1164.all;

entity addsub is
   port(  CLK, RST : in std_logic;
	  OP   : in std_logic;
          A, B : in std_logic_vector(7 downto 0);
          R  	: out std_logic_vector(7 downto 0);
          OVERFLOW, Cout: out std_logic);
end addsub;
 
architecture struct of addsub is
component full_adder IS
PORT( x, y, ci:  IN std_logic;
          sum, cout:  OUT std_logic);
END component;

signal C1, C2, C3, C4, C5, C6, C7, C8: std_logic;
signal s_A, s_B : std_logic_vector(7 downto 0);
signal TMP: std_logic_vector(7 downto 0);
 
BEGIN

	IF (RST = '1') THEN 

	TMP <= A xor B;

	FA0 : full_adder port map( A(0), TMP(0), OP, R(0), C1 );
	FA1 : full_adder port map( A(1), TMP(1), C1, R(1), C2 );
	FA2 : full_adder port map( A(2), TMP(2), C2, R(2), C3 );
	FA3 : full_adder port map( A(3), TMP(3), C3, R(3), C4 );
	FA5 : full_adder port map( A(4), TMP(4), C4, R(4), C5 );
	FA6 : full_adder port map( A(5), TMP(5), C5, R(5), C6 );
	FA7 : full_adder port map( A(6), TMP(6), C6, R(6), C7 );
	FA8 : full_adder port map( A(7), TMP(7), C7, R(7), C8 );
	
	OVERFLOW <= C7 XOR C8;
	Cout <= C8;

end struct;