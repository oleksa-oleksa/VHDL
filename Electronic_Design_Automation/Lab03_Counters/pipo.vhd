library ieee;
use ieee.std_logic_1164.all;

entity pipo is
   port
   (
      clk, clr :  in std_logic;                                      -- clock and clear
      en       :  in std_logic;                                      -- enable
      d        :  in std_logic_vector( 3 downto 0 );                 -- data input
      q        : out std_logic_vector( 3 downto 0 )                  -- data output
   );
end pipo;

architecture behave of pipo is
   signal q_intern, q_out : std_logic_vector( 3 downto 0 );
begin
   process( clk, clr )
   begin
      if ( clr = '1' ) then
         q_intern <= (others => '0');
         q_out <= (others => '0');
      elsif ( en = '1' ) then
         if ( rising_edge( clk ) ) then
            q_intern <= d;
         elsif ( falling_edge( clk ) ) then
            q_out <= q_intern;
         end if;
      end if;
   end process;

   q <= q_out;
end behave;
