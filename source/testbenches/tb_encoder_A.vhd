-- Testbench automatically generated online
-- at https://vhdl.lapinoo.net
-- Generation date : 3.4.2024 15:58:50 UTC

library ieee;
use ieee.std_logic_1164.all;

entity tb_encodeur is
end tb_encodeur;

architecture tb of tb_encodeur is

component encodeur
port (output : out std_logic_vector (3 downto 0);
entree : in std_logic_vector (2 downto 0));
end component;

signal output : std_logic_vector (3 downto 0);
signal entree : std_logic_vector (2 downto 0);

constant TbPeriod : time := 1000 ns; -- EDIT Put right period here
signal TbClock : std_logic := '0';
signal TbSimEnded : std_logic := '0';

begin

dut : encodeur
port map (output => output,
entree => entree);

-- Clock generation
TbClock <= not TbClock after TbPeriod/2 when TbSimEnded /= '1' else '0';

-- EDIT: Replace YOURCLOCKSIGNAL below by the name of your clock as I haven't guessed it
-- YOURCLOCKSIGNAL <= TbClock;

stimuli : process
begin
-- EDIT Adapt initialization as needed
entree <= (others => '0');

entree <= "010";
wait for 10ns ;
entree <= "100";
wait for 10ns ;
entree <= "001";
wait for 10ns ;
entree <= "111";
wait for 10ns ;
entree <= "101";
wait for 10ns ;

-- EDIT Add stimuli here
wait for 100 * TbPeriod;

-- Stop the clock and hence terminate the simulation
TbSimEnded <= '1';
wait;
end process;

end tb;

-- Configuration block below is required by some simulators. Usually no need to edit.

configuration cfg_tb_encodeur of tb_encodeur is
for tb
end for;
end cfg_tb_encodeur;