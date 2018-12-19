library ieee;
use ieee.std_logic_1164.all;

entity addsub is
   port(  CLK, RST      : in std_logic;
	  OP            : in std_logic;
          A, B          : in std_logic_vector(7 downto 0);
          R 		: out std_logic_vector(7 downto 0); 
	Cout  		: out std_logic_vector(7 downto 0);
          OVERFLOW      : out std_logic
	);
end addsub;
 
architecture struct of addsub is
component full_adder IS
PORT( x, y, ci:  IN std_logic;
      sum, cout:  OUT std_logic);
END component;

BEGIN
-- 8 Registers, each adds one binary digit
Adder0: full_adder PORT MAP (A(0), B(0), '0', R(0), Cout(0));
Adder1: full_adder PORT MAP (A(1), B(1), Cout(0), R(1), Cout(1));
Adder2: full_adder PORT MAP (A(2), B(2), Cout(1), R(2), Cout(2));
Adder3: full_adder PORT MAP (A(3), B(3), Cout(2), R(3), Cout(3));
Adder4: full_adder PORT MAP (A(4), B(4), Cout(3), R(4), Cout(4));
Adder5: full_adder PORT MAP (A(5), B(5), Cout(4), R(5), Cout(5));
Adder6: full_adder PORT MAP (A(6), B(6), Cout(5), R(6), Cout(6));
Adder7: full_adder PORT MAP (A(7), B(7), Cout(6), R(7), Cout(7));
OVERFLOW <= Cout(7);

end struct;