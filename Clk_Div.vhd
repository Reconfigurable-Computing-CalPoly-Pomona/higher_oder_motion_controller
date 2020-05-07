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

entity Clk_Div is
    Port ( enable : in std_logic;
           reset : in STD_LOGIC;
           clk : in STD_LOGIC;
           value_out : out natural);
end Clk_Div;

architecture Behavioral of Clk_Div is

signal value: natural:= 0;
signal tmp: natural:= 0;
signal clktmp : std_logic := '0';
begin

process(clk,reset)
begin
 if( reset = '1' ) then
 value <= 0;
 tmp <=0;
elsif (clk'event and clk='1') then  
   if (tmp >= 8000) then --7 Mhz *1000 = 7000 tmp, .500 Mhz *1000 = 50
        tmp <= 0;
        value <= value+1;
   else 
        tmp <= tmp+1;
   end if;         
end if;         
end process;
   value_out <= value; 
end Behavioral;