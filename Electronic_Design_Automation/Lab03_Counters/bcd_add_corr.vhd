library ieee;
use ieee.std_logic_1164.all;

entity bcd_add_corr is
   port
   (
      c_in        :  in std_logic;                       -- carry in
      op1, op2    :  in std_logic_vector(3 downto 0);    -- Operand 1 and 2 for addition

      c_out       : out std_logic;                       -- carry out
      sum         : out std_logic_vector(3 downto 0)     -- sum
   );
end bcd_add_corr;

architecture behave of bcd_add_corr is
   -------------------------------------------------------------------- COMPONENT LIST
   component bcd_adder 
      port
      (
         c_in        :  in std_logic;                       -- carry in
         op1, op2    :  in std_logic_vector(3 downto 0);    -- first and second operand 

         c_out       : out std_logic;                       -- carry out
         sum         : out std_logic_vector(3 downto 0)     -- output sum
      );
   end component;

   component bcd_add_corrector 
      port
      (
         c        :  in std_logic;                       -- c_out from previous addition
         bcd      :  in std_logic_vector(3 downto 0);    -- bcd to evaluate

         c_out    : out std_logic;                       -- corrected carry out
         correct  : out std_logic_vector(3 downto 0)     -- corrected bcd
      );
   end component;
   -------------------------------------------------------------------- END COMPONENT LIST
   signal tmp_sum : std_logic_vector(3 downto 0);
   signal tmp_c_out : std_logic;
begin
   u_adder : bcd_adder
            port map ( c_in, op1, op2, tmp_c_out, tmp_sum );
   u_corr   : bcd_add_corrector
            port map ( tmp_c_out, tmp_sum, c_out, sum );


end behave;
