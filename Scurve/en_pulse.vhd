----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/10/2020 04:33:39 PM
-- Design Name: 
-- Module Name: en_pulse - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity en_pulse is
    Port ( freq_in : in STD_LOGIC_VECTOR (31 downto 0);
           freq_out : out STD_LOGIC_VECTOR (31 downto 0);
           clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           en : out STD_LOGIC);
end en_pulse;

architecture Behavioral of en_pulse is

begin

EN_FUN: process(clk)
        begin
        
        if rst = '1' then
            en <= '0';
        else
            if rising_edge(clk) then
               if (freq_in = x"00000000") then
                    en <= '1'; 
               else
                    en <= '0';
               
               end if;
            
            end if;
        end if;
        
        end process;
freq_out <= freq_in;

end Behavioral;
