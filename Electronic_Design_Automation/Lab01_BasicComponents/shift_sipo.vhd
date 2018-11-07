library IEEE;
use IEEE.STD_LOGIC_1164.all;
USE ieee.numeric_std.all;

-- Serial-in to Parallel-out (SIPO)  -  the register is loaded with serial data, 
-- one bit at a time, with the stored data being available at the output in parallel form.

entity shift_sipo is
     port(
         clk : in STD_LOGIC;
         reset : in STD_LOGIC;
         din : in STD_LOGIC;
         dout : out STD_LOGIC_VECTOR(3 downto 0)
         );
end shift_sipo;

architecture Behav of shift_sipo is

signal s_qo : STD_LOGIC_VECTOR(3 downto 0) := "UUUU";
signal s_q3, s_q2, s_q1, s_q0 : STD_LOGIC := 'U';

begin
    sipo : process (clk, reset) is   
    variable counter : unsigned ( 1 DOWNTO 0 ) := "00";
    variable rd : std_logic := '0';                  
    begin
	
        if (reset = '1') then
 	    s_qo <= "0000";
	    s_qo(3) <= '0';
	    s_qo(2) <= '0';
	    s_qo(1) <= '0';
	    s_qo(0) <= '0';
	    rd := '0';

	 elsif (falling_edge(clk) AND rd = '0' AND reset = '0') then
	    s_q0 <= din;
	    s_q1 <= s_q0;
	    s_q2 <= s_q1;
	    s_q3 <= s_q2;

	    if (counter = "11") then
  		rd := '1';
	    end if;
 	    
            counter := counter + 1;

	 elsif (falling_edge(clk) AND rd = '1' AND reset = '0') then
	    -- cleaning for a new cycle
	    if (counter = "00") then 
	    	rd := '0';
       	    end if;
	
	  -- loading
	    s_q0 <= din;
	    s_q1 <= s_q0;
	    s_q2 <= s_q1;
	    s_q3 <= s_q2;

           -- output
	    s_qo(3) <= s_q3;
	    s_qo(2) <= s_q2;
	    s_qo(1) <= s_q1;
	    s_qo(0) <= s_q0;
	
	   counter := counter + 1;
	end if;      

    end process sipo;
    -- final output
    dout <= s_qo;
end Behav;