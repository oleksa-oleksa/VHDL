library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity booth is
	port(
		x, y : in  std_logic_vector(3 downto 0);
		z    : out std_logic_vector(7 downto 0);
		clk, reset : in std_logic
	);
end booth;

architecture behavior of booth is
type statetype is (init, checkQ, add, sub, shift, checkCnt, finished);
signal state, next_state: statetype := init;
signal Qaditional : std_logic;
signal M, Q  		: std_logic_vector(3 downto 0);
signal A     		: std_logic_vector(3 downto 0);
signal count 		: integer;
signal hand 		: std_logic;
begin 

--Zustandsaktualisierung
	pr1: process(clk, reset)
	begin
		if reset = '1' then
			state <= init;
		elsif (rising_edge(clk)) then
			state <= next_state;
		end if;
	end process pr1;
--Folgezustandsberechnung
	pr2: process(state, Q, Qaditional, count)
	begin
	--next_state <= state;
		case state is
			when init =>				
				next_state <= checkQ;
			when checkQ =>
				if((Q(0) = '1' and Qaditional = '1') or (Q(0) = '0' and Qaditional = '0')) then
					next_state <= shift;
				elsif(Q(0) = '0' and Qaditional = '1') then
					next_state <= add;
				elsif(Q(0) = '1' and Qaditional = '0') then
					next_state <= sub;
				end if;
			when add =>
				next_state <= shift;
			when sub =>
				next_state <= shift;
			when shift =>
				next_state <= checkCnt;
			when checkCnt =>
				if(count = 0) then
					next_state <= finished;
				else
					next_state <= checkQ;
				end if;
			when others =>
					next_state <= init;
		end case;
	end process pr2;
--Ausgangsberechnung
	pr3: process(state, x, y)
	begin
		case state is
			when init =>
				A <= "0000";
				M <= x;
				Q <= y;
				Qaditional <= '0';
				count <= 4;
			when checkQ =>
				-- nur next_state
			when add =>
				A <= std_logic_vector(signed(A) + signed(M));
			when sub =>
				A <= std_logic_vector(signed(A) - signed(M));
			when shift =>
				count <= count-1;
				hand <= A(0);
				Qaditional <= Q(0); --shift right 1 bit
			when checkCnt =>
				A <= A(3) & A(3 downto 1); --arithmetic shift right 1 bit
				Q <= hand & Q(3 downto 1); --arithmetic shift right 1 bit
			when finished =>
				z <= A & Q;
		when others =>
			--nothing
		end case;
	end process pr3;
end behavior;