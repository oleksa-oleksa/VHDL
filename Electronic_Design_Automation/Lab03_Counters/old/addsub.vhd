library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity addsub is
   port(  CLK, RST      : in std_logic;
	  OP            : in std_logic;
          A1, B1, A2, B2 : in unsigned(3 downto 0);
          R1, R2	: out unsigned(3 downto 0); 
	  Cout  	: buffer std_logic;
          OVERFLOW      : out std_logic
	);
end addsub;
 
architecture struct of addsub is
component full_bcd_adder IS
port(
        a,b  : in  unsigned(3 downto 0); -- input numbers.
        carry_in : in std_logic;
        sum  : out  unsigned(3 downto 0); 
        carry : out std_logic  
    );
END component;

BEGIN

	Adder0: full_bcd_adder PORT MAP (a => A1(3 downto 0), b => B1(3 downto 0), carry_in => '0', sum => R1(3 downto 0), carry => Cout);
	Adder1: full_bcd_adder PORT MAP (a => A2(3 downto 0), b => B2(3 downto 0), carry_in => Cout, sum => R2(3 downto 0), carry => OVERFLOW);

end struct;