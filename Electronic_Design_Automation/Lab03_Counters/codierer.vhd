library ieee;
use ieee.std_logic_1164.all;

entity codierer is
   port
   (
      clk, clr, ld   :  in std_logic;
      input          :  in std_logic_vector(3 downto 0);
      output         : out std_logic_vector(6 downto 0)
   );
end codierer;

architecture behave of codierer is
   --------------------------------------------------------------------- Component List
   component pipo
      port
      (
         clk, clr :  in std_logic;                                      -- clock and clear
         en       :  in std_logic;                                      -- enable
         d        :  in std_logic_vector( 3 downto 0 );                 -- data input
         q        : out std_logic_vector( 3 downto 0 )                  -- data output
      );
   end component;

   component bcd_counter
      port
      (
         clk, ld        :  in std_logic;                                      -- Clock Signal, Load Signal for specific start value
         clr            :  in std_logic;                                      -- Clear Signal
         ld_4bit        :  in std_logic_vector(3 downto 0);                   -- 4 bit input load start value
         out_4bit       : out std_logic_vector(3 downto 0)                    -- 4 bit output
      );
   end component;

   component seven_seg
      port
      (
         ltn            :  in std_logic;                                -- enable decoder
         bln            :  in std_logic;                                -- segment test
         hb             :  in std_logic;                                -- if 0, hexdec., if 1 displays 0 to 9
         b_in           :  in std_logic_vector(3 downto 0);             -- input number
         a,b,c,d,e,f,g  : out std_logic                                 -- output for segments
      );
   end component;
   
   component bcd_to_aiken
      port
      (
         bcd_in      :  in std_logic_vector(3 downto 0);
         aiken_out   : out std_logic_vector(3 downto 0)
      );
   end component;

   component bcd_to_gray
      port
      (
         bcd_in      :  in std_logic_vector(3 downto 0);
         gray_out    : out std_logic_vector(3 downto 0)
      );
   end component;
   --------------------------------------------------------------------- END Component List

   signal input_pipo_output      : std_logic_vector(3 downto 0);
   signal bcd_output   : std_logic_vector(3 downto 0);
   signal to_seven_seg           : std_logic_vector(3 downto 0);
   signal aiken_to_pipo          : std_logic_vector(3 downto 0);
   signal to_aiken_led           : std_logic_vector(3 downto 0);
   signal gray_to_pipo           : std_logic_vector(3 downto 0);
   signal to_gray_led            : std_logic_vector(3 downto 0);
begin
   input_pipo  : pipo 
                  port map ( clk, '0', '1', input, input_pipo_output );
   bcd         : bcd_counter 
                  port map ( clk, ld, clr , input_pipo_output, bcd_output );
   in_sevSeg   : pipo 
                  port map ( clk, '0', '1', bcd_output, to_seven_seg );
   sevSeg      : seven_seg 
                  port map ( '1', '0', '1', to_seven_seg, 
                     output(0), output(1), output(2), output(3),
                     output(4), output(5), output(6) );              -- low active
   bcd_aiken   : bcd_to_aiken
                  port map ( bcd_output, aiken_to_pipo );
   bcd_gray    : bcd_to_gray
                  port map ( bcd_output, gray_to_pipo );
   aiken_pipo  : pipo
                  port map ( clk, '0', '1', aiken_to_pipo, to_aiken_led );
   gray_pipo   : pipo
                  port map ( clk, '0', '1', gray_to_pipo, to_gray_led );
end behave;
