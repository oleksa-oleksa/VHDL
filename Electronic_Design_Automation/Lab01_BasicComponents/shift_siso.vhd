library IEEE;
use IEEE.STD_LOGIC_1164.all;

-- These are the simplest kind of shift registers. 
-- The data string is presented at 'Data In', and is shifted right one 
-- stage each time 'Data Advance' is brought high. 
-- At each advance, the bit on the far left (i.e. 'Data In') 
-- is shifted into the first flip-flop's output

entity shift_siso is
     port(
         clk : in STD_LOGIC;
         reset : in STD_LOGIC;
	 enable : in STD_LOGIC;
         din : in STD_LOGIC;
         dout : out STD_LOGIC
         );
end shift_siso;

architecture Behav of shift_siso is

signal s_qi : STD_LOGIC_VECTOR(3 downto 0) := "UUUU";
signal s_qo : STD_LOGIC_VECTOR(3 downto 0) := "UUUU";

begin
    siso : process (clk, reset, enable) is                
    begin
        if (reset = '1') then
            s_qi <= "0000";
 	    s_qo <= "0000";

	-- shift the bits of internal register and load the single bit
        elsif (rising_edge(clk) AND enable = '1') then           
            s_qi(3 downto 1)  <= s_qi(2 downto 0);
	    s_qi(0) <= din;
	
	-- output from the internal register
	elsif (falling_edge(clk) AND enable = '1') then
	    s_qo <= s_qi;  
        end if;      
    end process siso;
    -- final output
    dout <= s_qo(3);
end Behav;