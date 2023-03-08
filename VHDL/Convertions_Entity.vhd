
-------------------------------------------------------------------------------

-- Conversions
-- Conversions of different numeric types (for reference only)

-- Conversion de todo tipo de variable hacia cualquier tipo de variable ---

-------------------------------------------------------------------------------



library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;



entity conversions is
generic (
	input_size : integer := 4);
port (
		output_sv : out signed(input_size-1 downto 0);
		output_uv : out unsigned(input_size-1 downto 0);
		output_int : out integer range 0 to 2**input_size-1 downto 0);
		output_slv : out std_logic_vector(input_size-1 downto 0);
		input_sv : in signed(input_size-1 downto 0);
		input_uv : in unsigned(input_size-1 downto 0);
		input_int : in integer range 0 to 2**input_size-1 downto 0);
		input_slv : in std_logic_vector(input_size-1 downto 0);
		opcode : in std_logic_vector(1 downto 0));

end conversions;



architecture behavior of conversions is

begin

-- Process that shows how to convert to a Signed_Vector

	signed_conversion: process(input_sv, input_uv, input_int, input_slv, opcode)
	begin

		case opcode is

			when "00" => -- signed
				output_sv <= input_sv;

			when "01" => -- unsigned
				output_sv <= signed(input_uv);

			when "10" => -- integer
				output_sv <= to_signed(input_int, output_sv'length);

			when "11" => -- std_logic_vector
				output_sv <= signed(input_slv);

			when others =>
				output_sv <= (others => 'X');

		end case;

	end process signed_conversion;

-- Process that shows how to convert to a Unsigned_Vector

	unsigned_conversion: process(input_sv, input_uv, input_int, input_slv, opcode)
	begin

		case opcode is

			when "00" => -- signed
				output_uv <= unsigned(input_sv);

			when "01" => -- unsigned
				output_uv <= input_uv;

			when "10" => -- integer
				output_uv <= to_unsigned(input_int, output_uv'length);

			when "11" => -- std_logic_vector
				output_uv <= unsigned(input_slv);

			when others =>
				output_uv <= (others => 'X');

		end case;

	end process unsigned_conversion;

-- Process that shows how to convert to a Integer

	int_conversion: process(input_sv, input_uv, input_int, input_slv, opcode)
	begin

		case opcode is

			when "00" => -- signed
				output_int <= to_integer(unsigned(input_sv));

			when "01" => -- unsigned
				output_int <= to_integer(input_uv);

			when "10" => -- integer
				output_int <= input_int;

			when "11" => -- std_logic_vector
				output_int <= to_integer(unsigned(input_slv));

			when others =>
				output_uv <= 0;

		end case;

	end process int_conversion;

-- Process that shows how to convert to a Standard Logic Vector

	std_logic_vector_conversion: process(input_sv, input_uv, input_int, input_slv, opcode)
	begin

		case opcode is

			when "00" => -- signed
				output_slv <= std_logic_vector(input_sv);

			when "01" => -- unsigned
				output_slv <= std_logic_vector(input_uv);

			when "10" => -- integer
				output_slv <= input_int;

			when "11" => -- std_logic_vector
				output_slv <= std_logic_vector(to_unsigned(input_int,output_slv'length));

			when others =>
				output_slv <= (others => 'X');

		end case;

	end process std_logic_vector_conversion;

end behavior;

