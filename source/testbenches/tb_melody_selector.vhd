-- Testbench automatically generated online
-- at https://vhdl.lapinoo.net
-- Generation date : 3.4.2024 14:29:27 UTC

library ieee;
use ieee.std_logic_1164.all;

entity tb_up_and_down_counter is

end tb_up_and_down_counter;

architecture tb of tb_up_and_down_counter is

    component up_and_down_counter
        port (clk     : in std_logic;
              INC     : in std_logic;
              rst     : in std_logic;
              EN      : in std_logic;
              COUNT : out std_logic_vector (1 downto 0));
    end component;

    signal clk     : std_logic;
    signal INC     : std_logic;
    signal rst     : std_logic;
    signal EN      : std_logic;
    signal COUNT : std_logic_vector (1 downto 0);

    constant TbPeriod : time := 10 ns; -- EDIT Put right period here
    signal TbClock : std_logic := '0';
    signal TbSimEnded : std_logic := '0';

begin

    dut : up_and_down_counter
    port map (clk     => clk,
              INC     => INC,
              rst     => rst,
              EN      => EN,
              COUNT => COUNT);

    -- Clock generation
    TbClock <= not TbClock after TbPeriod/2 when TbSimEnded /= '1' else '0';

    -- EDIT: Check that clk is really your main clock signal
    clk <= TbClock;

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed
        INC <= '0';
        EN <= '0';

        -- Reset generation
        -- EDIT: Check that rst is really your reset signal
        rst <= '1';
        wait for 100 ns;
        rst <= '0';
        wait for 100 ns;
        EN <= '1';
        wait for 100 ns;
        INC <= '1';
        wait for 50 ns;
        EN <= '0';
        INC <= '0';
        wait for 100 ns;
        EN <= '1';
        wait for 100 ns;

        -- EDIT Add stimuli here
        wait for 100 * TbPeriod;

        -- Stop the clock and hence terminate the simulation
        TbSimEnded <= '1';
        wait;
    end process;

end tb;

-- Configuration block below is required by some simulators. Usually no need to edit.

configuration cfg_tb_up_and_down_counter of tb_up_and_down_counter is
    for tb
    end for;
end cfg_tb_up_and_down_counter;