library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity bcd_to_gray is
   port
   (
      bcd_in      :  in std_logic_vector(3 downto 0);
      gray_out   : out std_logic_vector(3 downto 0)
   );
end bcd_to_gray;

architecture behave of bcd_to_gray is
begin
   process( bcd_in )
   begin
      if ( unsigned(bcd_in) < 10 ) then                              -- valid BCD range
         gray_out(3) <= bcd_in(3);                                   --/
         gray_out(2) <= bcd_in(3) or bcd_in(2);                      --| via KV Diagram
         gray_out(1) <= bcd_in(2) xor bcd_in(1);                     --|
         gray_out(0) <= bcd_in(1) xor bcd_in(0);                     --\
      else                                                           -- if bcd > 9 => ERROR
         gray_out <= "UUUU";
      end if;
   end process;
end behave;
