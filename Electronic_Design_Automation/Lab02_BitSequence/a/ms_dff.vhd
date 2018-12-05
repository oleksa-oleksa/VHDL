library ieee;
use ieee.std_logic_1164.all;

entity ms_dff is
port(     d : IN std_logic := 'U';
   clk, clr : IN std_logic := 'U';
     qp, qn : OUT std_logic);
end ms_dff;

architecture dff_behavior of ms_dff is

   signal Qi : std_logic := 'U';
   signal Qo : std_logic := 'U';

begin

   dff : process(d, clk, clr) is
   begin
      if    ( clr = '1' ) then   Qi <= '0'; Qo <= '0';
      elsif ( clr = '0' ) then
         if    (  rising_edge(clk) ) then  Qi <= d;
         elsif ( falling_edge(clk) ) then  Qo <= Qi;
         end if;
      else
         Qi <= Qi; Qo <= Qo;
      end if;
   end process dff;

   qp <= Qo;
   qn <= not Qo;

end dff_behavior;
