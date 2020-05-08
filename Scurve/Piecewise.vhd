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

entity Piecewise is
    Port ( enable : in STD_LOGIC;
           start : in STD_LOGIC;
           reset : in std_logic;
           V_max : in natural;
           D : in natural;
           tmp : in natural;
           clk : in STD_LOGIC;
           frequency_out : out unsigned(31 downto 0));
end Piecewise;

architecture Behavioral of Piecewise is

--signal tmp: natural:= 1;
signal freq: natural;

begin

process (clk, enable, start) 
    begin

if (rising_edge(clk)) then
    
 if (enable = '1') then
    if (tmp < D) then
        freq <= (V_max*tmp*tmp)/(4*D*D);
    elsif (tmp < 2*D) then
        freq <= (V_max/4) + ((V_max)*(tmp-D))/(2*D);
    elsif (tmp < 3*(D)) then
        freq <= V_max - (V_max*(tmp-D*3)*(tmp-D*3))/(4*D*D);
    elsif (tmp < 4*D) then
        freq <= V_max;
    elsif (tmp < 5*D) then
        freq <= V_max - (V_max*(4*D-tmp)*(4*D-tmp))/(4*D*D);
    elsif (tmp < 6*D) then
        freq <= 3*V_max - (V_max/4) -(tmp-D)*(V_max/(2*D));
    elsif (tmp < 7*D) then
        freq <= (V_max*(tmp - 7*D)*(tmp-7*D))/(4*D*D);
    else
        freq <= 0;
    end if;    
    
    frequency_out <= to_unsigned(freq, 32);
    
 else
    frequency_out <= to_unsigned(0, 32);
 end if;
 
end if;
         
    end process; 

end Behavioral;
