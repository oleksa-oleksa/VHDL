library IEEE;
use IEEE.STD_LOGIC_1164.all;

-- Serial-in to Parallel-out (SIPO)  -  the register is loaded with serial data, 
-- one bit at a time, with the stored data being available at the output in parallel form.

entity shift_sipo is
     port(
         clk : in STD_LOGIC;
         reset : in STD_LOGIC;
	 enable : in STD_LOGIC;
         din : in STD_LOGIC;
         dout : out STD_LOGIC_VECTOR(3 downto 0)
         );
end shift_sipo;

architecture Behav of shift_sipo is

begin
    sipo : process (clk, reset, enable) is                     
    begin
        if (reset = '1') then
            dout <= "0000";

	-- shifting and output
        elsif (rising_edge(clk) AND enable = '0') then
            dout(3 downto 1) <= dout(2 downto 0);
 	    dout(0) <= '0';

	-- load the single bit as lsb
	 elsif (rising_edge(clk) AND enable = '1') then
 	    dout(0) <= din;
	end if;      
    end process sipo;

end Behav;