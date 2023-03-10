-----------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------   /////////// TEMPORIZADOR  \\\\\\\\\\\\ -------------------------------------------------

--- 	Mostrará en la salida una señal de Temp_Finish = '1' cuando el tiempo asignado finalice.

---		ASIGNACIÓN TEMP:
-----		CLK_RATE --> Frecuencia de reloj de nuestra placa
-----		TEMP_RATE --> Frecuencia asociada al tiempo de temporiz. ( T = 1 / f )

------------------------------------------------------------------------------------------------------------------------------------------------------


-- Libraries
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.math_real.all;

-- Entity
entity TEMPORIZADOR is
	Generic (
		CLK_RATE		: integer := 100000000; -- 50 MHz default
		TEMP_RATE 	: integer := 2);			-- 2 Hz default
	Port (
		Temp_Finish		: out std_logic := '0';
		Clk					: in std_logic;
		Reset				: in std_logic);		-- Active Low
end TEMPORIZADOR;

-- Architecture
architecture behavior of TEMPORIZADOR is

-- Calculate count value to achieve 'BLINK_RATE' from generic
constant MAX_VAL		: integer := CLK_RATE / TEMP_RATE;

-- Register to hold the current count value
signal count_reg   	: integer range 0 to MAX_VAL-1 := 0;

-- Temporization flag
signal temp_flag		: std_logic := '0';

	
	begin
	
		-- Flag assignation
		Temp_Finish <= temp_flag;
		
		-- Process that increments the counter every rising clock edge
		count_proc: process(Clk)
		begin
			if rising_edge(Clk) then
				if((reset = '0') or (count_reg = MAX_VAL)) then
					count_reg <= 0;
				else
					count_reg <= count_reg + 1;
				end if;
			end if;
		end process;

		-- Process that will toggle the LED output every time the counter
		-- reaches the calculated 'MAX_VAL'
		output_proc: process(Clk)
		begin
		
			temp_flag = '0';
			if rising_edge(Clk) then
				if (count_reg = MAX_VAL) then
					temp_flag = '1';
				end if;
			end if;
	end process;
	
end behavior;