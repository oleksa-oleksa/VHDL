library ieee;
use ieee.std_logic_1164.all;

entity clock_hour is
   port
   (
      clk, ld              :  in std_logic;                          -- Clock, Load
      clr                  :  in std_logic;                          -- Clear
      ld_tenth , ld_ones   :  in std_logic_vector(3 downto 0);       -- Load for tenth and ones

      overflow             : out std_logic;                          -- overflow, e.g. for days
      bcd_tenth, bcd_ones  : out std_logic_vector(3 downto 0)        -- bcd code for tenth and ones
   );
end clock_hour;

architecture behave of clock_hour is
   -------------------------------------------------------------------- Component List
   component bcd_counter_zero_to_two 
      port
      (
         clk, ld        :  in std_logic;                                      -- Clock Signal, Load Signal for specific start value
         clr            :  in std_logic;                                      -- Clear Signal
         ld_4bit        :  in std_logic_vector(3 downto 0);                   -- 4 bit input load start value

         twenty         : out std_logic;
         out_4bit       : out std_logic_vector(3 downto 0)                    -- 4 bit output
      );
   end component;

   component bcd_counter_hour_zero_to_nine 
      port
      (
         clk, ld        :  in std_logic;                                      -- Clock Signal, Load Signal for specific start value
         clr            :  in std_logic;                                      -- Clear Signal
         twenty         :  in std_logic;
         ld_4bit        :  in std_logic_vector(3 downto 0);                   -- 4 bit input load start value

         out_4bit       : out std_logic_vector(3 downto 0);                   -- 4 bit output
         overflow       : out std_logic                                       -- Signal for ten
      );
   end component;
   -------------------------------------------------------------------- END Component List
   signal hour_ones_overflow, twenty   : std_logic;

begin
   hour_tenth  : bcd_counter_zero_to_two
                  port map ( hour_ones_overflow, ld, clr, ld_tenth, twenty,  bcd_tenth );
   hour_ones   : bcd_counter_hour_zero_to_nine
                  port map ( clk, ld, clr, twenty, ld_ones, bcd_ones, hour_ones_overflow );
end behave;
