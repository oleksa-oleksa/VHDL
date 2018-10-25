library ieee;
use ieee.std_logic_1164.all;

entity one_bit_reg is
   port
   (
      ld, clr, clk   :  in std_logic;
      d_0            :  in std_logic;
      q_0            : out std_logic
   );
end one_bit_reg;

architecture behave of one_bit_reg is
   signal q_intern, q_out  : std_logic := 'U';                       -- intern signal for master slave
begin
   process ( clk, clr )
   begin
      if ( clr = '1' ) then                                          -- clr, async = most priority
         q_intern <= '0';
         q_out    <= '0';
      else
         if ( ld = '1' ) then
            if ( rising_edge( clk ) ) then
               q_intern    <= d_0;
            elsif ( falling_edge( clk ) ) then
               q_out       <= q_intern;
            end if;
         end if;
      end if;
   end process;

   q_0   <= q_out;
end behave;

