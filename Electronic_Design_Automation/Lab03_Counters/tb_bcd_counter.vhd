library ieee;
use ieee.std_logic_1164.all;

entity tb_bcd_counter is
end tb_bcd_counter;

-------------------------------

architecture test of tb_bcd_counter is

   component bcd_counter
   port
   (
      clk, ld        :  in std_logic;                                      -- Clock Signal, Load Signal for specific start value
      clr            :  in std_logic;                                      -- Clear Signal
      ld_4bit        :  in std_logic_vector(3 downto 0);                   -- 4 bit input load start value
      out_4bit       : out std_logic_vector(3 downto 0)                    -- 4 bit output
   );
   end component;

   signal clk, ld, clr  : std_logic;
   signal ld_4bit       : std_logic_vector(3 downto 0) := "UUUU";
   signal out_4bit      : std_logic_vector(3 downto 0) := "UUUU";

begin

   dut: bcd_counter
   port map
   (
      clk, ld, clr, ld_4bit, out_4bit
   );

   process ------------------------------------------------------------- Clock Stimuli
   begin
      clk <= '0';
      wait for 5 ns;
      clk <= '1';
      wait for 5 ns;
   end process; -------------------------------------------------------- END Clock Stimuli

   clr      <= '1' after 0 ns, '0' after 15 ns;
   ld       <= '1' after 0 ns, '0' after 25 ns;
   ld_4bit  <= "0011" after 0 ns;



end test;

