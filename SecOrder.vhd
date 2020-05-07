----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/16/2020 12:17:05 PM
-- Design Name: 
-- Module Name: SecOrder - Behavioral
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
use IEEE.numeric_std.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity SecOrder is
    Port ( enable: in std_logic;
           start : in std_logic;
           clk : in STD_LOGIC;
           distance: in natural;
           comp: in natural;
           rst : in STD_LOGIC;
           frequency_out : out unsigned(31 downto 0));
end SecOrder;

architecture Behavioral of SecOrder is

component Variables_SecOrd
          Port ( distance : in natural;
                 comp : in natural;
                 V_max : out natural;
                 D : out natural);
      end component;

component Clk_Div
port( enable : in std_logic;
      reset : in STD_LOGIC;
      clk : in STD_LOGIC;
      --clock_out : out STD_LOGIC;
      value_out : out natural); 
      end component;
      
component Piecewise_SecOrd
      Port ( enable : in STD_LOGIC;
            start : in std_logic;
            reset : in std_logic;
            V_max : in natural;
            D : in natural;
            tmp : in natural;
            clk : in STD_LOGIC;
            frequency_out : out unsigned(31 downto 0));
            end component;        

signal V_max: natural;
signal D: natural;
signal tmp_signal: natural;
signal clock_out: std_logic;
begin
            
Variable_calc: Variables_SecOrd port map(
        distance    => distance,
        comp        => comp,
        V_max       => V_max,
        D           => D
        ); 
        
clk_divider: Clk_Div port map(
                    enable    => enable,
                    reset     => rst,
                    clk       => clk,
                    --clock_out => clock_out,
                    value_out => tmp_signal
                    );                   
                                      
Frequency_Calc: Piecewise_SecOrd port map(
                    enable          =>  enable,
                    start           =>  start,
                    reset           =>  rst,
                    V_max           =>  V_max,
                    D               =>  D,
                    tmp             =>  tmp_signal,
                    clk             =>  clk,
                    frequency_out   =>  frequency_out
                    );  

end Behavioral;
