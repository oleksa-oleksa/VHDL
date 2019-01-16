library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

-- std_logic_unsigned fuer: std_logic_vector + 1

entity counter_three_digit is
   port
   (
      clock_50                            :  in std_logic;                    -- clock signal
      clr                                 :  in std_logic;

      bcd_ones, bcd_tenth, bcd_hundred    : out std_logic_vector(3 downto 0)
   );
end counter_three_digit;

architecture behave of counter_three_digit is
   -------------------------------------------------------------------- Component List
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
   signal clock_count_1hz     : natural range 0 to 50000010 := 0;
   signal clock_enable_1hz    : std_logic;

   signal ones_to_tenth, tenth_to_hundred, hundred_to_thousand : std_logic;
begin
   u_ones      : bcd_counter_zero_to_nine
               port map ( clock_enable_1hz, '0', clr, "0000", bcd_ones,    ones_to_tenth );
   u_tenth     : bcd_counter_zero_to_nine
               port map ( ones_to_tenth,    '0', clr, "0000", bcd_tenth,   tenth_to_hundred );
   u_hundred   : bcd_counter_zero_to_nine
               port map ( tenth_to_hundred, '0', clr, "0000", bcd_hundred, hundred_to_thousand );

   process ( clock_50, clr )
   begin
      if ( rising_edge(clock_50) ) then
         if ( clr = '1' ) then
            clock_count_1hz      <= 0; --(others => '0');
            clock_enable_1hz     <= '0';
         elsif ( clr = '0' ) then
            if (clock_count_1hz <= 50000000) then --x"2FAF080" then -- 50'000'000 = 2FAF080
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
