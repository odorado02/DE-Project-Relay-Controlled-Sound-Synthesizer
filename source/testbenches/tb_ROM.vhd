-- Testbench automatically generated online
-- at https://vhdl.lapinoo.net
-- Generation date : 3.4.2024 15:31:58 UTC

library ieee;
use ieee.std_logic_1164.all;

entity tb_ROM is

        generic
        (
    N_data    : natural := 2;
    N_addr    : natural := 3
        );

end tb_ROM;

architecture tb of tb_ROM is

    component ROM
        generic
        (
        N_data    : natural := 2;
        N_addr    : natural := 3
        );
        port (clk     : in std_logic;
              address : in std_logic_vector (2 downto 0);
              data    : out std_logic_vector (1 downto 0));
    end component;

    signal clk     : std_logic;
    signal address : std_logic_vector (2 downto 0);
    signal data    : std_logic_vector (1 downto 0);

    constant TbPeriod : time := 10 ns; -- EDIT Put right period here
    signal TbClock : std_logic := '0';
    signal TbSimEnded : std_logic := '0';

begin

    dut : ROM
    port map (clk     => clk,
              address => address,
              data    => data);

    -- Clock generation
    TbClock <= not TbClock after TbPeriod/2 when TbSimEnded /= '1' else '0';

    -- EDIT: Check that clk is really your main clock signal
    clk <= TbClock;

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed
        address <= "000";
        -- EDIT Add stimuli here
        wait for 10 * TbPeriod;
        address <= "100";
        wait for 10 * TbPeriod;
        address <= "001";
        wait for 10 * TbPeriod;
        address <= "010";
        wait for 10 * TbPeriod;
        address <= "011";
        wait for 10 * TbPeriod;
        address <= "100";
        wait for 10 * TbPeriod;
        address <= "101";
        wait for 10 * TbPeriod;
        address <= "110";
        wait for 10 * TbPeriod;
        address <= "111";
        wait for 10 * TbPeriod;
        
        -- Stop the clock and hence terminate the simulation
        TbSimEnded <= '1';
        wait;
    end process;

end tb;

-- Configuration block below is required by some simulators. Usually no need to edit.

configuration cfg_tb_ROM of tb_ROM is
    for tb
    end for;
end cfg_tb_ROM;