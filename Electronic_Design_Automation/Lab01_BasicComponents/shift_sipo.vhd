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

signal s_qi : STD_LOGIC_VECTOR(3 downto 0) := "UUUU";
signal s_qo : STD_LOGIC_VECTOR(3 downto 0) := "UUUU";

begin
    sipo : process (clk, reset, enable) is                     
    begin
        if (reset = '1') then
            s_qi <= "0000";
 	    s_qo <= "0000";

	-- shifting and output
        elsif (rising_edge(clk) AND enable = '1') then
            s_qi(3 downto 1) <= s_qi(2 downto 0);
 	    s_qi(0) <= din;

	-- load the single bit as lsb
	 elsif (falling_edge(clk) AND enable = '1') then
 	    s_qo <= s_qi;
	end if;      
    end process sipo;
    -- final output
    dout <= s_qo;
end Behav;