library ieee;
use ieee.std_logic_1164.all;

entity clock_min_or_sec is
   port
   (
      clk, ld              :  in std_logic;
      clr                  :  in std_logic;
      ld_tenth , ld_ones   :  in std_logic_vector(3 downto 0);

      overflow             : out std_logic;
      bcd_tenth, bcd_ones  : out std_logic_vector(3 downto 0)
   );
end clock_min_or_sec;

architecture behave of clock_min_or_sec is
   -------------------------------------------------------------------- Component List
   component bcd_counter_zero_to_five 
      port
      (
         clk, ld        :  in std_logic;                                      -- Clock Signal, Load Signal for specific start value
         clr            :  in std_logic;                                      -- Clear Signal
         ld_4bit        :  in std_logic_vector(3 downto 0);                   -- 4 bit input load start value
         out_4bit       : out std_logic_vector(3 downto 0);                   -- 4 bit output
         overflow       : out std_logic                                       -- Signal for ten
      );
   end component;

   component bcd_counter_zero_to_nine 
      port
      (
         clk, ld        :  in std_logic;                                      -- Clock Signal, Load Signal for specific start value
         clr            :  in std_logic;                                      -- Clear Signal
         ld_4bit        :  in std_logic_vector(3 downto 0);                   -- 4 bit input load start value
         out_4bit       : out std_logic_vector(3 downto 0);                   -- 4 bit output
         overflow       : out std_logic                                       -- Signal for ten
      );
   end component;
   -------------------------------------------------------------------- END Component List
   signal sec_ones_overflow   : std_logic;
begin
   sec_ones    : bcd_counter_zero_to_nine
                  port map ( clk, ld, clr, ld_ones, bcd_ones, sec_ones_overflow );
   sec_tenth   : bcd_counter_zero_to_five
                  port map ( sec_ones_overflow, ld, clr, ld_tenth, bcd_tenth, overflow );
end behave;
