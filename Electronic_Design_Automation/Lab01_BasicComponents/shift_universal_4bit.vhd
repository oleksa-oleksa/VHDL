library ieee;
use ieee.std_logic_1164.all;

entity universal_4bit is
   port
   (
      s           :  in std_logic_vector( 1 downto 0 );              -- switch mode
      p           :  in std_logic_vector( 3 downto 0 );              -- parallel input
      shr, shl    :  in std_logic;                                   -- shift right, shift left
      clk, rst    :  in std_logic;                                   -- clock, reset

      q           : out std_logic_vector( 3 downto 0 )               -- output
   );
end universal_4bit;

architecture behave of universal_4bit is
   signal q_intern, q_out  : std_logic_vector( 3 downto 0 );
begin
   process ( clk )
   begin
      if ( rst = '1' ) then
         q_intern <= (others => '0');
         q_out    <= (others => '0');
      elsif ( rst = '0' ) then
         if ( rising_edge(clk) ) then
            case s is
               when "00"   =>                                        -- Hold Mode
               when "01"   =>                                        -- shr
                  q_intern    <= shr & q_intern( 3 downto 1 );
               when "10"   =>                                        -- shl
                  q_intern    <= q_intern( 2 downto 0 ) & shl;
               when "11"   =>                                        -- parallel load
                  q_intern    <= p;
               when others =>
            end case;
         elsif ( falling_edge(clk) ) then
            q_out <= q_intern;
         end if;
      end if;
   end process;

   q  <= q_out;
end behave;
