library ieee;
use ieee.std_logic_1164.all;

entity tb_clock_24_hour is
end tb_clock_24_hour;

-------------------------------

architecture test of tb_clock_24_hour is

   component clock_24_hour
      port
      (
         clock_50, ld                        :  in std_logic;                    -- clock signal, load yes/no
         clr                                 :  in std_logic;
         ld_hour_ones, ld_hour_tenth         :  in std_logic_vector(3 downto 0); -- load presets for hour
         ld_minute_ones, ld_minute_tenth     :  in std_logic_vector(3 downto 0); -- load presets for minute
         ld_second_ones, ld_second_tenth     :  in std_logic_vector(3 downto 0); -- load presets for second

         bcd_hour_ones, bcd_hour_tenth       : out std_logic_vector(3 downto 0); -- bcd output for hour
         bcd_minute_ones, bcd_minute_tenth   : out std_logic_vector(3 downto 0); -- bcd output for minute
         bcd_second_ones, bcd_second_tenth   : out std_logic_vector(3 downto 0)  -- bcd output for second
      );
   end component;

   signal clk : std_logic;
   signal bcd_hour_ones, bcd_hour_tenth, bcd_minute_ones, bcd_minute_tenth : std_logic_vector(3 downto 0);

begin

   dut: clock_24_hour
   port map
   (
      clk, '0', '0', "0000", "0000", "0000", "0000", bcd_hour_ones, bcd_hour_tenth, bcd_minute_ones, bcd_minute_tenth
   );

   process
   begin
      clk <= '0';
      wait for 1 ps;
      clk <= '1';
      wait for 1 ps;
   end process;


end test;

