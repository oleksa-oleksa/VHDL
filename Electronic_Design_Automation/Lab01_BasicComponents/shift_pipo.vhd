library IEEE;
use IEEE.STD_LOGIC_1164.all;

-- For parallel in parallel out shift registers
-- all data bits appear on the parallel outputs immediately 
--following the simultaneous entry of the data bits. 

entity shift_pipo is
     port(
         clk : in STD_LOGIC;
         reset : in STD_LOGIC;
	 enable : in STD_LOGIC;
         din : in STD_LOGIC_VECTOR(3 downto 0);
         dout : out STD_LOGIC_VECTOR(3 downto 0)
         );
end shift_pipo;

architecture Behav of shift_pipo is

signal s_qi : STD_LOGIC_VECTOR(3 downto 0) := "UUUU";
signal s_qo : STD_LOGIC_VECTOR(3 downto 0) := "UUUU";

begin
    pipo : process (clk, reset, enable) is                  
    begin
        if (reset = '1') then
            s_qi <= "0000";
 	    s_qo <= "0000";

	-- shifting and output all bits
        elsif (rising_edge(clk) AND enable = '1') then       
          s_qi <= din;    

	-- loading into internal register
        elsif (falling_edge(clk) and enable = '1') then 
	    s_qo <= s_qi;  
        end if;      
    end process pipo;
    dout <= s_qo;
end Behav;