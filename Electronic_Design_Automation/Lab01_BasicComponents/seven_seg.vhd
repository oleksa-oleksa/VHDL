library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity seven_seg is
   port
   (
      ltn            :  in std_logic;                                -- enable decoder
      bln            :  in std_logic;                                -- segment test
      hb             :  in std_logic;                                -- if 0, hexdec., if 1 displays 0 to 9
      b_in           :  in std_logic_vector(3 downto 0);             -- input number
      a,b,c,d,e,f,g  : out std_logic                                 -- output for segments
   );
end seven_seg;

architecture behave of seven_seg is
begin
   process( ltn, bln, hb, b_in )
   begin
      if ( (ltn = '0') and (bln = '0') ) then                                       -- not active
         a <= '1'; b <= '1'; c <= '1'; d <= '1';
         e <= '1'; f <= '1'; g <= '1';
      elsif ( (ltn = '0') and (bln = '1') ) then                                    -- segment test
         a <= '0'; b <= '0'; c <= '0'; d <= '0';
         e <= '0'; f <= '0'; g <= '0';
      elsif ( (ltn = '1') and (bln = '0') ) then                                    -- normal display
         if ( (to_integer(unsigned(b_in)) < 10) or (hb = '0') ) then                -- normal when <10, or all hex
            a <=     (    b_in(0) and not b_in(1) and not b_in(2) and not b_in(3)) 
                  or (not b_in(0) and not b_in(1) and     b_in(2) and not b_in(3))
                  or (    b_in(0) and     b_in(1) and not b_in(2) and     b_in(3))
                  or (    b_in(0) and not b_in(1) and     b_in(2) and     b_in(3));

            b <=     (    b_in(0) and not b_in(1) and     b_in(2) and not b_in(3)) 
                  or (not b_in(0) and     b_in(1) and     b_in(2)                )
                  or (    b_in(0) and     b_in(1)                 and     b_in(3))
                  or (not b_in(0)                 and     b_in(2) and     b_in(3));

            c <=     (not b_in(0) and     b_in(1) and not b_in(2) and not b_in(3)) 
                  or (                    b_in(1) and     b_in(2) and     b_in(3))
                  or (not b_in(0)                 and     b_in(2) and     b_in(3));

            d <=     (    b_in(0) and not b_in(1) and not b_in(2) and not b_in(3)) 
                  or (not b_in(0) and not b_in(1) and     b_in(2) and not b_in(3))
                  or (    b_in(0) and     b_in(1) and     b_in(2)                )
                  or (not b_in(0) and     b_in(1) and not b_in(2) and     b_in(3));

            e <=     (    b_in(0) and not b_in(1) and not b_in(2)                ) 
                  or (                not b_in(1) and     b_in(2) and not b_in(3))
                  or (    b_in(0)                                 and not b_in(3));

            f <=     (    b_in(0)                 and not b_in(2) and not b_in(3)) 
                  or (                    b_in(1) and not b_in(2) and not b_in(3))
                  or (    b_in(0) and     b_in(1)                 and not b_in(3))
                  or (    b_in(0) and not b_in(1) and     b_in(2) and     b_in(3));

            g <=     (                not b_in(1) and not b_in(2) and not b_in(3)) 
                  or (    b_in(0) and     b_in(1) and     b_in(2) and not b_in(3))
                  or (not b_in(0) and not b_in(1) and     b_in(2) and     b_in(3));
         elsif ( (to_integer(unsigned(b_in)) > 9) and (hb = '1') ) then             -- if dec. display and greater 9: displ. off
            a <= '1'; b <= '1'; c <= '1'; d <= '1';
            e <= '1'; f <= '1'; g <= '1';
         end if;
      end if;
   end process;

end behave;
