library ieee;
use ieee.std_logic_1164.all;

entity bcd_adder is
   port
   (
      c_in        :  in std_logic;                       -- carry in
      op1, op2    :  in std_logic_vector(3 downto 0);    -- first and second operand 

      c_out       : out std_logic;                       -- carry out
      sum         : out std_logic_vector(3 downto 0)     -- output sum
   );
end bcd_adder;

architecture behave of bcd_adder is
   signal c_1, c_2, c_3 : std_logic := '0';
begin
   sum(0)   <= op1(0) xor op2(0) xor c_in;
   c_1      <= (op2(0) and (op1(0) or c_in)) or (op1(0) and c_in);

   sum(1)   <= op1(1) xor op2(1) xor c_1;
   c_2      <= (op2(1) and (op1(1) or c_1)) or (op1(1) and c_1);

   sum(2)   <= op1(2) xor op2(2) xor c_2;
   c_3      <= (op2(2) and (op1(2) or c_2)) or (op1(2) and c_2);

   sum(3)   <= op1(3) xor op2(3) xor c_3;
   c_out    <= (op2(3) and (op1(3) or c_3)) or (op1(3) and c_3);
end behave;
