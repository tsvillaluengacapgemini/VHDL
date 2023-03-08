
-- Ejercicio 16 - GenericMapTb

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
 
entity T16_GenericMapTb is
end entity;
 
architecture sim of T16_GenericMapTb is
 
    constant DataWidth : integer := 8;
 
    signal Sig1 : signed(DataWidth-1 downto 0) := x"AA";
    signal Sig2 : signed(DataWidth-1 downto 0) := x"BB";
    signal Sig3 : signed(DataWidth-1 downto 0) := x"CC";
    signal Sig4 : signed(DataWidth-1 downto 0) := x"DD";
 
    signal Sel : signed(1 downto 0) := (others => '0');
 
    signal Output : signed(DataWidth-1 downto 0);
 
begin
 
    -- An Instance of T16_GenericMux with architecture rtl
    i_Mux1 : entity work.T16_GenericMux(rtl)
    generic map(DataWidth => DataWidth)
    port map(
        Sel    => Sel,
        Sig1   => Sig1,
        Sig2   => Sig2,
        Sig3   => Sig3,
        Sig4   => Sig4,
        Output => Output);
 
    -- Testbench process
    process is
    begin
        wait for 10 ns;
        Sel <= Sel + 1;
        wait for 10 ns;
        Sel <= Sel + 1;
        wait for 10 ns;
        Sel <= Sel + 1;
        wait for 10 ns;
        Sel <= Sel + 1;
        wait for 10 ns;
        Sel <= "UU";
        wait;
    end process;
 
end architecture;