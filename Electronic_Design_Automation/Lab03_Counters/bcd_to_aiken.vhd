library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity bcd_to_aiken is
   port
   (
      bcd_in      :  in std_logic_vector(3 downto 0);
      aiken_out   : out std_logic_vector(3 downto 0)
   );
end bcd_to_aiken;

architecture behave of bcd_to_aiken is
begin
   process( bcd_in )
   begin
      if ( unsigned(bcd_in) < 5 ) then                                        -- 1st half from 0000 to 0100
         aiken_out <= bcd_in;
      elsif ( (unsigned(bcd_in) > 4) and (unsigned(bcd_in) < 10) ) then       -- 2nd half from 1011 to 1111
         aiken_out <= std_logic_vector((unsigned(bcd_in) + 6) );
      else                                                                    -- if bcd > 9 => ERROR
         aiken_out <= "UUUU";
      end if;
   end process;
end behave;
