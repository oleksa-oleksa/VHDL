LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;

ENTITY full_adder IS
PORT( x, y, ci:  IN std_logic;
          sum, cout:  OUT std_logic);
END full_adder;


ARCHITECTURE full_adder_arc OF full_adder IS
BEGIN

sum <= x XOR y XOR ci ;
cout <= (x AND y) OR (ci AND x) OR (ci AND y);

END full_adder_arc;