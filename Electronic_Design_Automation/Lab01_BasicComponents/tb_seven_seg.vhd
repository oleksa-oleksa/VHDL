library ieee;
use ieee.std_logic_1164.all;

entity tb_seven_seg is
end tb_seven_seg;

-------------------------------

architecture test of tb_seven_seg is

   component seven_seg
      port
      (
         ltn            :  in std_logic;                                -- enable decoder
         bln            :  in std_logic;                                -- segment test
         hb             :  in std_logic;                                -- if 0, hexdec., if 1 displays 0 to 9
         b_in           :  in std_logic_vector(3 downto 0);             -- input number
         a,b,c,d,e,f,g  : out std_logic                                 -- output for segments
      );
   end component;

   signal b_in                   : std_logic_vector(3 downto 0);
   signal ltn, bln, hb           : std_logic;
   signal a, b, c, d, e, f, g    : std_logic;

begin

   dut: seven_seg
   port map
   (
      ltn, bln, hb, b_in, a, b, c, d, e, f, g
   );

   ltn   <= '1' after 0 ns; -- '1' after 5 ns;
   bln   <= '0' after 0 ns; -- '0' after 5 ns;
   hb    <= '1' after 0 ns; -- '1' after 5 ns;
    
   
   
   b_in  <= "0000" after   0 ns, "0001" after  10 ns,
            "0010" after  20 ns, "0011" after  30 ns,
            "0100" after  40 ns, "0101" after  50 ns,
            "0110" after  60 ns, "0111" after  70 ns,
            "1000" after  80 ns, "1001" after  90 ns,
            "1010" after 100 ns, "1011" after 110 ns,
            "1100" after 120 ns, "1101" after 130 ns,
            "1110" after 140 ns, "1111" after 150 ns;

end test;

