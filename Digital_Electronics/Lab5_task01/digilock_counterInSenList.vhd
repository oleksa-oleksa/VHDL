library ieee;
use ieee.std_logic_1164.all;

entity digilock is
   port
   (
      x     : in  std_logic;
      clk   : in  std_logic;
      reset : in  std_logic;
      lock  : out std_logic;
      alarm : out std_logic
   );
end digilock;

architecture behave of digilock is
   type Zustaende is (S1, S2, S3, S4, S5, S6, SE, SA);                   -- SE - Error State
   signal zustand, folgezustand  : Zustaende;
   signal counter : integer range 1 to 4;
begin
   Zustandsspeicher: process ( clk, reset, counter)
   begin
      if ( reset = '1' ) then
         zustand <= S1;
	 counter <= 1;
      elsif ( clk = '1' and clk'event) then
         zustand <= folgezustand;
	 if (folgezustand = SE) then
		counter <= counter + 1;
	 end if;
      end if;
   end process Zustandsspeicher;

   Uebergang: process (x, Zustand, counter)
    begin
      case zustand is
         when S1 => if x = '1' then folgezustand <= S2;
                    else            folgezustand <= SE; 
                    end if;
         when S2 => if x = '0' then folgezustand <= S3;
                    else            folgezustand <= SE; 
                    end if;
         when S3 => if x = '1' then folgezustand <= S4;
                    else            folgezustand <= SE; 
                    end if;
         when S4 => if x = '0' then folgezustand <= S5;
                    else            folgezustand <= SE; 
                    end if;
         when S5 => if x = '1' then folgezustand <= S6; -- UNLOCK
                    else            folgezustand <= SA; -- we got the winner ALARM
                    end if;
         when S6 => if x = '1' then folgezustand <= S6;
                    else            folgezustand <= S1;
                    end if;
         when SE => if counter = 4 
				then folgezustand <= SA; -- we got the winner ALARM
		    else 	     folgezustand <= SE; 
		    end if;
	 when SA =>                  folgezustand <= SA; -- here before reset 
         when others =>             folgezustand <= S1;
      end case;
   end process Uebergang;


   Ausgang: process ( Zustand )
   begin
      case zustand is
         when S6     => lock <= '0'; alarm <= '0'; -- UNLOCK
         when SE     => lock <= '1'; alarm <= '0'; -- CATCH
	 when SA     => lock <= '1'; alarm <= '1'; -- ALARM
         when others => lock <= '1'; alarm <= '0';
      end case;
   end process Ausgang;

end behave;

