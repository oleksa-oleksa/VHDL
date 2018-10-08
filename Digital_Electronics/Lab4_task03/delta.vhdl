library ieee;
use ieee.std_logic_1164.all;

entity delta is
   port
   (
      x     : in  std_logic;
      clk   : in  std_logic;
      reset : in  std_logic;
      y     : out std_logic := '0'
   );
end delta;

architecture behav of delta is

signal a, b, c : std_logic;

begin

   d1:process(clk)
   begin
      if (clk'event and clk = '1') then
         a <= x;
      end if;
   end process d1;

   d2:process(clk, reset)
   begin
      
      if(reset = '1') then
         y <= '0';
         b <= '0';
      elsif(clk'event and clk = '1') then
	 y <= c;
         b <= c;
      end if;
   end process d2;

   c <= a xor b;
end behav;
