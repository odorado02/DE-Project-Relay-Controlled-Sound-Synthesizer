----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/27/2024 05:15:11 PM
-- Design Name: 
-- Module Name: melody_selector - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all; --for (+) operators

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity up_and_down_counter is
    Port ( clk : in STD_LOGIC;
           INC : in STD_LOGIC;
           rst : IN STD_LOGIC;
           EN : IN STD_LOGIC;          
           COUNT : out STD_LOGIC_VECTOR (1 downto 0));
end up_and_down_counter;

architecture Behavioral of up_and_down_counter is

    signal sig_count : STD_LOGIC_VECTOR (1 downto 0);

begin

    

    process (clk)
    begin
    if rst = '1' then
        sig_count <= (others => '0');
    elsif rising_edge (clk) then
      if EN='1' then
          if INC='1' then
             sig_count <= sig_count + 1;
          else
             sig_count <= sig_count - 1;
          end if;
       end if;
    end if;
    end process;
    
    COUNT <= sig_count;           
    
end Behavioral;
