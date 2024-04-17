----------------------------------------------------------------------------------
-- Company:
-- Engineer:
-- 
-- Create Date: 04/03/2024 04:25:15 PM
-- Design Name:
-- Module Name: encoder_A - Behavioral
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
use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity encoder is
Port (
output : out std_logic_vector(3 downto 0) ;
entree : in std_logic_vector(2 downto 0) );
end encoder;

architecture Behavioral of encoder is
begin

process (entree)
begin

case (entree) is
when "000" =>
output <= "0000";
when "001" =>
output <= "0001";
when "010" =>
output <= "0011";
when "011" =>
output <= "0111";
when "100" =>
output <= "1111";
when others =>
output <= "0000";

end case;

end process;

end Behavioral; 