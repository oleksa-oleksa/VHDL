library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

-- std_logic_unsigned fuer: std_logic_vector + 1

entity clock_microsec is
   port
   (
      clk                                       :  in std_logic;                    -- clock signal
      clr                                       :  in std_logic;

      overflow                                  : out std_logic;
      bcd_deci, bcd_hundredth, bcd_thousandth  : out std_logic_vector(3 downto 0)
   );
end clock_microsec;

architecture behave of clock_microsec is
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
   signal thousandth_to_hundredth, hundredth_to_deci : std_logic;
begin
   u_thousandth   : bcd_counter_zero_to_nine
                  port map ( clk,                     '0', clr, "0000", bcd_thousandth, thousandth_to_hundredth );

   u_hundredth    : bcd_counter_zero_to_nine
                  port map ( thousandth_to_hundredth, '0', clr, "0000", bcd_hundredth,  hundredth_to_deci );

   u_deci        : bcd_counter_zero_to_nine
                  port map ( hundredth_to_deci,      '0', clr, "0000", bcd_deci,      overflow);


end behave;
