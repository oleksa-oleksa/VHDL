LIBRARY IEEE
USE IEEE.std_logic_1164.all;

ENTITY threedigitcounter IS
PORT (	intCLK, RST : IN std_logic;
			O				: OUT std_logic_vector(6 downto 0));
END threedigitcounter;

ARCHITECTURE bahav OF threedigitcounter IS

SIGNAL extCLK : std_logic := '0';
SIGNAL State, nextState : std_logic_vector(2 downto 0);
SIGNAL count  : integer := '0';
	
BEGIN

init_clock : PROCESS(intCLK, RST)
BEGIN

	IF (RST = '1') THEN State <= "000"; count <= '0';
	ELSIF (intCLK'event and intCLK = '1') THEN count <= count + 1;
		IF	(count = 50000000) THEN 	-- after 50 MHz
			IF extCLK = '0' THEN extCLK <= '1'; count <= '0'; State <= nextState;
			ELSIF extCLK = '1' THEN extCLK <= '0'; count <= '0'; state <= nextState;
			END IF;
		END IF;
	END IF; 
END PROCESS;

logic : PROCESS(state)
BEGIN
	CASE (state) IS
		WHEN "000" => nextState <= "001"; O <= "1111110";
		WHEN "001" => nextState <= "010"; O <= "0110000";
		WHEN "010" => nextState <= "011"; O <= "1101101";
		WHEN "011" => nextState <= "100"; O <= "1111001";
		WHEN "100" => nextState <= "101"; O <= "0110011";
		WHEN "101" => nextState <= "110"; O <= "1011011";
		WHEN "110" => nextState <= "111"; O <= "1011111";
		WHEN OTHERS => nextState <= "000"; O <= "1110000";
	END CASE;
END PROCESS;	

END behav;		