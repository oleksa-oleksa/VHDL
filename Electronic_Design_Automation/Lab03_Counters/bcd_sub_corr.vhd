library ieee;
use ieee.std_logic_1164.all;

entity bcd_sub_corr is
   port
   (
      c_in        :  in std_logic;                       -- borrow / carry in
      op1, op2    :  in std_logic_vector(3 downto 0);    -- minuend, subtrahend

      c_out       : out std_logic;                       -- borrow / carry out
      diff        : out std_logic_vector(3 downto 0)     -- difference
   );
end bcd_sub_corr;

architecture behave of bcd_sub_corr is
   -------------------------------------------------------------------- COMPONENT LIST
   component bcd_subber 
      port
      (
         c_in        :  in std_logic;                          -- borrow / carry in
         op1, op2    :  in std_logic_vector(3 downto 0);       -- minuend, subtrahend

         c_out       : out std_logic;                          -- borrow / carry out 
         diff        : out std_logic_vector(3 downto 0)        -- difference
      );
   end component;

   component bcd_sub_corrector 
      port
      (
         c        :  in std_logic;                       -- c_out from previous addition
         bcd      :  in std_logic_vector(3 downto 0);    -- bcd to evaluate

         c_out    : out std_logic;                       -- corrected borrow / carry 
         correct  : out std_logic_vector(3 downto 0)     -- corrected bcd
      );
   end component;
   -------------------------------------------------------------------- END COMPONENT LIST
   signal tmp_borrow : std_logic;
   signal tmp_diff : std_logic_vector(3 downto 0);
begin
   u_sub    : bcd_subber
            port map ( c_in, op1, op2, tmp_borrow, tmp_diff );
   u_c_sub  : bcd_sub_corrector
            port map ( tmp_borrow, tmp_diff, c_out, diff );

end behave;
