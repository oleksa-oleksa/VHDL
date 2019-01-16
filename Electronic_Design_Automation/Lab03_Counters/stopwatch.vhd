library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

-- std_logic_unsigned fuer: std_logic_vector + 1

entity stopwatch is
   port
   (
      clock_50                            :  in std_logic;                    -- clock signal, load yes/no
      clr                                 :  in std_logic;                    -- clear signal
      start                               :  in std_logic;                    -- start signal

      bcd_deci, bcd_hundredth, bcd_thousandth : out std_logic_vector(3 downto 0);
      bcd_second_ones, bcd_second_tenth   : out std_logic_vector(3 downto 0); -- bcd output for second
      bcd_minute_ones, bcd_minute_tenth   : out std_logic_vector(3 downto 0)  -- bcd output for minute
   );
end stopwatch;

architecture behave of stopwatch is
   -------------------------------------------------------------------- Component List
   component clock_microsec 
      port
      (
         clk                                 :  in std_logic;                    -- clock signal
         clr                                 :  in std_logic;

         overflow                            : out std_logic;
         bcd_deci, bcd_hundredth, bcd_thousandth    : out std_logic_vector(3 downto 0)
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
   signal clock_count_1hz     : natural range 0 to 50000010 := 0;
   signal clock_enable_1hz    : std_logic;

   signal microsec_to_sec, sec_to_min, min_to_hour : std_logic;
begin
   u_clock_microsec   : clock_microsec
                  port map ( clock_enable_1hz, clr, microsec_to_sec, bcd_deci, bcd_hundredth, bcd_thousandth );

   u_clock_second : clock_min_or_sec
                  port map ( microsec_to_sec, '0', clr, "0000", "0000", 
                             sec_to_min, bcd_second_tenth, bcd_second_ones );

   u_clock_minute : clock_min_or_sec
                  port map ( sec_to_min,      '0', clr, "0000", "0000", 
                             min_to_hour, bcd_minute_tenth, bcd_minute_ones );


   process ( clock_50, clr )
   begin
      if ( rising_edge(clock_50) ) then
         if ( clr = '1' ) then
            clock_count_1hz      <= 0; --(others => '0');
            clock_enable_1hz     <= '0';
         elsif ( clr = '0' ) then
            if (clock_count_1hz <= 5000) then --x"2FAF080" then -- 50'000'000 = 2FAF080 equals 1 sek, when clock = 50mhz
               clock_count_1hz   <= clock_count_1hz + 1;
               clock_enable_1hz  <= '0';
            else
               clock_count_1hz   <= 0; -- (others => '0');
               if ( start = '1' ) then
                  clock_enable_1hz  <= '1';
               else 
                  clock_enable_1hz  <= '0';
               end if;
            end if;
         end if;
      end if;
   end process;
end behave;
