library ieee;
use ieee.std_logic_1164.all;

entity bcd_subber is
   port
   (
      c_in        :  in std_logic;                          -- borrow / carry in
      op1, op2    :  in std_logic_vector(3 downto 0);       -- minuend, subtrahend

      c_out       : out std_logic;                          -- borrow / carry out 
      diff        : out std_logic_vector(3 downto 0)        -- difference
   );
end bcd_subber;

architecture behave of bcd_subber is
   signal c_1, c_2, c_3 : std_logic;
begin
   diff(0)  <= op1(0) xor op2(0) xor c_in;
   c_1      <= (not op1(0) and (op2(0) or c_in)) or (op2(0) and c_in);

   diff(1)  <= op1(1) xor op2(1) xor c_1;
   c_2      <= (not op1(1) and (op2(1) or c_1)) or (op2(1) and c_1);

   diff(2)  <= op1(2) xor op2(2) xor c_2;
   c_3      <= (not op1(2) and (op2(2) or c_2)) or (op2(2) and c_2);

   diff(3)  <= op1(3) xor op2(3) xor c_3;
   c_out    <= (not op1(3) and (op2(3) or c_3)) or (op2(3) and c_3);

end behave;
