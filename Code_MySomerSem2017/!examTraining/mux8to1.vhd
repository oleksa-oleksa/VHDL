library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux8to1 is
Port ( 
	d_in : in STD_LOGIC_VECTOR (7 downto 0);
	s : in STD_LOGIC_VECTOR (2 downto 0);
	d_out : out STD_LOGIC);
end mux8to1;

architecture Behavioral of mux8to1 is
begin
process (d_in, s)
begin
	case s is
		when "000"=> d_out <= d_in(0);
		when "001"=> d_out <= d_in(1);
		when "010"=> d_out <= d_in(2);
		when "011"=> d_out <= d_in(3);
		when "100"=> d_out <= d_in(4);
		when "101"=> d_out <= d_in(5);
		when "110"=> d_out <= d_in(6);
		when "111"=> d_out <= d_in(7);
		when others=> null;
end case;
end process;
end Behavioral;