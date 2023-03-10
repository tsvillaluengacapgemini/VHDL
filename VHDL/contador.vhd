-------------------------------------------------------------------------------------------------------------
------ CONTADOR CON SENTIDO ASCENDENTE/DESCENDENTE -----------

--- 	En cada pulso de reloj se aumenta o disminuye el valor 
---		del contador en 1 unidad.

---  - Utiliza señal de reloj para sincronizarse.
---  - Según el valor de sentido: '0' --> descendente;  '1' --> arcendente
-------------------------------------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;

entity contador is
 Port ( 
			reset : in STD_LOGIC;
			 clk : in STD_LOGIC;
			 sentido : in STD_LOGIC := '0';
			Q : out STD_LOGIC_VECTOR (3 downto 0) );	
end contador;

architecture Behavioral of contador is
signal counter : STD_LOGIC_VECTOR (3 downto 0) := "0000";
begin

	process(reset,clk)
	begin
		
		if reset='1' then
			counter <= "0000";
		
		elsif clk'event and clk = '1' then
			
			if sentido = '1' then	-- Sentido ASCENDENTE
				counter <= counter + 1;
			 
			 else
				counter <= counter - 1;	-- Sentido DESCENDENTE
			end if;
			
			Q <= counter;
		
		end if;
		
	end process;
	
end Behavioral;