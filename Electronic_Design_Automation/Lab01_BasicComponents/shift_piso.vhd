library IEEE;
use IEEE.STD_LOGIC_1164.all;

-- For parallel in ? parallel out shift registers
-- all data bits appear on the parallel outputs immediately 
--following the simultaneous entry of the data bits. 

entity shift_piso is
     port(
         clk : in STD_LOGIC;
         reset : in STD_LOGIC;
	 enable : in STD_LOGIC;
         din : in STD_LOGIC_VECTOR(3 downto 0);
         dout : out STD_LOGIC
         );
end shift_piso;

architecture Behav of shift_piso is
 
begin
    piso : process (clk, reset, enable) is                  
    variable s : std_logic_vector(3 downto 0) := "0000";
    begin
        if (reset = '1') then
            s := "0000";

	-- shifting and output the msb
        elsif (rising_edge(clk) and enable = '0') then       
            dout <= s(3);
	    s := s(2 downto 0) & '0';

	-- loading into internal register
        elsif (rising_edge(clk) and enable = '1') then
	   s := din;    
        end if;      
    end process piso;
end Behav;