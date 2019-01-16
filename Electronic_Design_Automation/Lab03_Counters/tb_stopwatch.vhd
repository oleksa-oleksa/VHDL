library ieee;
use ieee.std_logic_1164.all;

entity tb_stopwatch is
end tb_stopwatch;

-------------------------------

architecture test of tb_stopwatch is

   component stopwatch 
      port
      (
         clock_50                            :  in std_logic;                    -- clock signal, load yes/no
         clr                                 :  in std_logic;                    -- clear signal
         start                               :  in std_logic;                    -- start signal

         bcd_deci, bcd_hundredth, bcd_thousandth : out std_logic_vector(3 downto 0);
         bcd_second_ones, bcd_second_tenth   : out std_logic_vector(3 downto 0); -- bcd output for second
         bcd_minute_ones, bcd_minute_tenth   : out std_logic_vector(3 downto 0)  -- bcd output for minute
      );
   end component;

   signal clk, clr, start : std_logic;
   signal bcd_deci, bcd_hundredth, bcd_thousandth : std_logic_vector(3 downto 0); -- bcd output for minute
   signal bcd_second_ones, bcd_second_tenth  : std_logic_vector(3 downto 0); -- bcd output for minute
   signal bcd_minute_ones, bcd_minute_tenth        : std_logic_vector(3 downto 0); -- bcd output for minute

begin

   dut: stopwatch 
   port map
   (
      clk, clr, start, 
      bcd_deci, bcd_hundredth, bcd_thousandth,
      bcd_second_ones, bcd_second_tenth,
      bcd_minute_ones, bcd_minute_tenth 
   );

   process
   begin
      clk <= '1';
      wait for 1 ps;
      clk <= '0';
      wait for 1 ps;
   end process;

   clr <= '1' after 0 ps, '0' after 4 ps;
   start <= '1' after 5 ps, '0' after 10000 ns;

end test;

