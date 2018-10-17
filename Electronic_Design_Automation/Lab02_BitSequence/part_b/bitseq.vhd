library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

ENTITY Bit_sequence IS
PORT (	CLK, RST, X : IN std_logic;
			Y : OUT std_logic;
			Z : OUT std_logic_vector(8 downto 0));
END Bit_sequence;


ARCHITECTURE behave OF Bit_sequence IS

TYPE States IS (A, B, C, D, E, F, G, H, I);
SIGNAL state, nextState: States;

BEGIN

	first : PROCESS (CLK, RST, state)
	BEGIN
--		IF (RST = '0') THEN state <= A; Z <= ( others => '0' );
--		ELSIF CLK'event AND CLK = '1' THEN state <= nextState;
		IF CLK'event AND CLK = '1' THEN
			IF (RST = '0') THEN
				state <= A;
			ELSE
				state <= nextState;
			END IF;
		END IF;	
	END PROCESS first;
	
	second : PROCESS (state, X)
	BEGIN
		CASE state IS
			WHEN A => 	IF ( X = '0' ) THEN nextState <= B;
							ELSE nextState <= F; 
							END IF;
			WHEN B => 	IF ( X = '0' ) THEN nextState <= C;
							ELSE nextState <= F;  
							END IF;
			WHEN C => 	IF ( X = '0' ) THEN nextState <= D; 
							ELSE nextState <= F;  
							END IF;
			WHEN D => 	IF ( X = '0' ) THEN nextState <= E; 
							ELSE nextState <= F;  
							END IF;
			WHEN E => 	IF ( X = '0' ) THEN nextState <= E; 
							ELSE nextState <= F;  
							END IF;
	-- -------------------------------------------------						
			WHEN F => 	IF X = '1' THEN nextState <= G;
							ELSE nextState <= B; 
							END IF;
			WHEN G => 	IF X = '1' THEN nextState <= H;  
							ELSE nextState <= B;
							END IF;
			WHEN H => 	IF X = '1' THEN nextState <= I;  
							ELSE nextState <= B; 
							END IF;
			WHEN I => 	IF X = '1' THEN nextState <= I;  
							ELSE nextState <= B;
							END IF;
			WHEN OTHERS => nextState <= A;

		END CASE;
	END PROCESS second;

	third : PROCESS (state)
	BEGIN

		CASE state IS
			WHEN A => 	Z <= "000000000"; Y <=  '0';
			WHEN B => 	Z <= "000000011"; Y <=  '0';
			WHEN C => 	Z <= "000000101"; Y <=  '0';
			WHEN D => 	Z <= "000001001"; Y <=  '0';
			WHEN E => 	Z <= "000010001"; Y <=  '1';
			WHEN F => 	Z <= "000100001"; Y <=  '0';
			WHEN G => 	Z <= "001000001"; Y <=  '0';
			WHEN H => 	Z <= "010000001"; Y <=  '0';
			WHEN I => 	Z <= "100000001"; Y <=  '1';
			WHEN OTHERS => 	Z <= "000000000"; Y <=  '0';
		END CASE;	

	END PROCESS third;
		
END behave;