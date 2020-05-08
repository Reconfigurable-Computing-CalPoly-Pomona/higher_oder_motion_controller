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

entity Piecewise_SecOrd is
    Port ( enable : in STD_LOGIC;
           start : in std_logic;
           reset : in std_logic;
           V_max : in natural;
           D : in natural;
           tmp : in natural;
           clk : in STD_LOGIC;
           frequency_out : out unsigned(31 downto 0));
end Piecewise_SecOrd;

architecture Behavioral of Piecewise_SecOrd is

begin

process (clk, enable, start) 
    begin 
   
 if (rising_edge(clk)) then   
    if (tmp < D) then
        frequency_out <= to_unsigned(tmp*V_max/(D), 32);
    elsif (tmp < 2*D) then
        frequency_out <= to_unsigned(V_max, 32);
    elsif (tmp < 3*D) then
        frequency_out <= to_unsigned(3*V_max-tmp*V_max/(D), 32);
    else
        frequency_out <= to_unsigned(0, 32);
    end if; 

 end if;  
     
    
    end process;

end Behavioral;
