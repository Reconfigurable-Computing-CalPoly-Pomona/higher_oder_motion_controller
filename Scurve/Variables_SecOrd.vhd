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

entity Variables_SecOrd is
    Port ( distance : in natural;
           comp : in natural;
           V_max : out natural;
           D : out natural);
end Variables_SecOrd;

architecture Behavioral of Variables_SecOrd is

signal Total_Time: natural;

begin

V_max <= comp*20*distance/100;                    
Total_Time <= (100*distance)/(50*comp); 
D <= 1000*Total_time/3; 

end Behavioral;
