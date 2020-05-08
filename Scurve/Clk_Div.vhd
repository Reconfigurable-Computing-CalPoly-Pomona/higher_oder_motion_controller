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

begin

process(clk,reset,enable)
begin
    if (enable = '0') then
        value_out <= value;
    else    
        if(reset='1') then
            value<=0;
        else
            if (clk'event and clk='1') then  
                if (tmp = 100000) then
                    tmp <= 0;
                    value <= value+1;
                else         
                    tmp <= tmp+1;
                end if;    
            end if;
        end if;
        
       value_out <= value;
         
    end if; 
end process;

end Behavioral;