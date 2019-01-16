library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

-- std_logic_unsigned fuer: std_logic_vector + 1

entity clock_24_hour is
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
end clock_24_hour;

architecture behave of clock_24_hour is
   -------------------------------------------------------------------- Component List
   component clock_hour 
      port
      (
         clk, ld              :  in std_logic;                          -- Clock, Load
         clr                  :  in std_logic;                          -- Clear
         ld_tenth , ld_ones   :  in std_logic_vector(3 downto 0);       -- Load for tenth and ones

         overflow             : out std_logic;                          -- overflow, e.g. for days
         bcd_tenth, bcd_ones  : out std_logic_vector(3 downto 0)        -- bcd code for tenth and ones
      );
   end component;

   component clock_min_or_sec 
      port
      (
         clk, ld              :  in std_logic;
         clr                  :  in std_logic;
         ld_tenth , ld_ones   :  in std_logic_vector(3 downto 0);

         overflow             : out std_logic;
         bcd_tenth, bcd_ones  : out std_logic_vector(3 downto 0)
      );
   end component;
   -------------------------------------------------------------------- END Component List
   signal clock_count_1hz : natural range 0 to 50000010 := 0;
   -- signal clock_count_1hz     : std_logic_vector(27 downto 0);
   signal clock_enable_1hz    : std_logic;

   signal sec_to_min, min_to_hour, hour_to_day : std_logic;
begin
   u_clock_second : clock_min_or_sec
                  port map ( clock_enable_1hz, ld, clr, ld_second_tenth, ld_second_ones, 
                             sec_to_min, bcd_second_tenth, bcd_second_ones );
   u_clock_minute : clock_min_or_sec
                  port map ( sec_to_min, ld, clr, ld_minute_tenth, ld_minute_ones, min_to_hour, bcd_minute_tenth, bcd_minute_ones );
   u_clock_hour   : clock_hour
                  port map ( min_to_hour, ld, clr, ld_hour_tenth, ld_hour_tenth, hour_to_day, bcd_hour_tenth, bcd_hour_ones );

   process ( clock_50, clr )
   begin
      if ( rising_edge(clock_50) ) then
         if ( clr = '1' ) then
            clock_count_1hz      <= 0; --(others => '0');
            clock_enable_1hz     <= '0';
         elsif ( clr = '0' ) then
            if (clock_count_1hz <= 50000000 ) then --x"2FAF080" then -- 50'000'000 = 2FAF080
               clock_count_1hz   <= clock_count_1hz + 1;
               clock_enable_1hz  <= '0';
            else
               clock_count_1hz   <= 0; -- (others => '0');
               clock_enable_1hz  <= '1';
            end if;
         end if;
      end if;
   end process;
end behave;
