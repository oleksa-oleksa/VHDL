LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;

ENTITY full_carry_ribble_adder IS
PORT(  x:  IN std_logic_vector(3 downto 0);
       y:  IN std_logic_vector(3 downto 0);
	   as:  IN std_logic;
    over:  OUT std_logic;
	    c:  OUT std_logic;
       s:  OUT std_logic_vector(3 downto 0 ));
END full_carry_ribble_adder;

ARCHITECTURE full_carry_ribble_adder_arc OF full_carry_ribble_adder IS

Component full_adder
PORT( x, y, ci:  IN std_logic;
          c, s:  OUT std_logic);
End Component;

signal carries : std_logic_vector(3 downto 0) := (others => 'U' );
signal temp : std_logic_vector(3 downto 0) := (others => 'U' );

BEGIN

temp(0) <= x(0) xor as;
temp(1) <= x(1) xor as;
temp(2) <= x(2) xor as;
temp(3) <= x(3) xor as;

--                          x:IN  ,y:IN,    ci:IN  ,   c:OUT   ,s:OUT
VA0 : full_adder PORT MAP (temp(0),y(0),     as    , carries(0),s(0) );
VA1 : full_adder PORT MAP (temp(1),y(1), carries(0), carries(1),s(1) );
VA2 : full_adder PORT MAP (temp(2),y(2), carries(1), carries(2),s(2) );
VA3 : full_adder PORT MAP (temp(3),y(3), carries(2), carries(3),s(3) );

over <= carries(3) xor carries(2);
c <= carries(3);

END full_carry_ribble_adder_arc;