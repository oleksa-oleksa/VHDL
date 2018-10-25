library ieee;
use ieee.std_logic_1164.all;

entity n_bit_reg is
   generic
   (
      bits  : natural := 8                                           -- natural, subtype of integer, 0 to x
   );
   port
   (
      ld, clr, clk   :  in std_logic;
      d              :  in std_logic_vector(bits-1 downto 0);
      q              : out std_logic_vector(bits-1 downto 0)
   );
end n_bit_reg;

architecture behave of n_bit_reg is
   signal q_intern, q_out  : std_logic_vector(bits-1 downto 0) := (others => 'U');     -- intern signal for master slave
begin
   process ( clk, clr )
   begin
      if ( clr = '1' ) then                                          -- clr, async = most priority
         q_intern <= (others => '0');
         q_out    <= (others => '0');
      else
         if ( ld = '1' ) then
            if ( rising_edge( clk ) ) then
               q_intern    <= d;  
            elsif ( falling_edge( clk ) ) then
               q_out       <= q_intern;
            end if;
         end if;
      end if;
   end process;

   q     <= q_out;
end behave;

