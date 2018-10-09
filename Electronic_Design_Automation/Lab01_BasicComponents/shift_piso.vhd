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
variable s : std_logic_vector(3 downto 0) := "0000";  
begin
    pipo : process (clk, reset, enable) is                  
    begin
        if (reset = '1') then
            dout <= "0000";

        elsif (rising_edge(clk) AND enable = '1') then       
            dout <= din;    
        end if;      
    end process pipo;
end Behav;