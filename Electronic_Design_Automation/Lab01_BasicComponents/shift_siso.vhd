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

begin
    siso : process (clk, reset, enable) is 
    
    variable s : std_logic_vector(3 downto 0) := "0000";                 
    
    begin
        if (reset = '1') then
            dout <= "0000";

        elsif (rising_edge(clk) AND enable = '1') then           
            s(3 downto 1) <= s(2 downto 0 );
       	    s(0) <= din;
        end if;      
    end process siso;

dout = s(3); -- shifted bit 

end Behav;