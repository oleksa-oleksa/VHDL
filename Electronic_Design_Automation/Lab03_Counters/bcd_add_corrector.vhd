library ieee;
use ieee.std_logic_1164.all;

entity bcd_add_corrector is
   port
   (
      c        :  in std_logic;                       -- c_out from previous addition
      bcd      :  in std_logic_vector(3 downto 0);    -- bcd to evaluate

      c_out    : out std_logic;                       -- corrected carry out
      correct  : out std_logic_vector(3 downto 0)     -- corrected bcd
   );
end bcd_add_corrector;

architecture behave of bcd_add_corrector is
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
   -------------------------------------------------------------------- END COMPONENT LIST
   signal sig_sum : std_logic_vector(3 downto 0);
   signal sig_c_out : std_logic;

begin
   u_adder  : bcd_adder
            port map ( '0', bcd, "0110", sig_c_out, sig_sum );

   process( sig_sum, bcd ) -- c_out, bcd ) -- evaluator
   begin
      if ( c = '1' ) then
         correct  <= sig_sum;
         c_out    <= c;
      elsif ( bcd(3) = '1' ) then
         if ( (bcd(2) = '1') or (bcd(1) = '1') ) then
            correct  <= sig_sum;
            c_out    <= '1';
         else
            correct  <= bcd;
            c_out    <= c;
         end if;
      else
         correct <= bcd;
         c_out    <= c;
      end if;
   end process;
end behave;
