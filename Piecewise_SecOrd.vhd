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
signal freq: natural := 0;
--signal VdivD: natural;--/D
--signal V3: natural;
begin

process (clk,tmp) 
begin   
if (rising_edge(clk) ) then
    --freq <= 50;
 if (enable = '1') then
    --freq <= 50; 
    if (tmp < D) then
        --frequency_out <= to_unsigned(tmp*V_max/(D), 32);
        freq <= tmp*V_max/(D);
        --freq <= tmp*VdivD;
        --freq <= 0;
        --freq <= 0;
    elsif (tmp < 2*D) then
        --frequency_out <= to_unsigned(V_max, 32);
        freq <= V_max;
        --freq <= 0;
    elsif (tmp < 3*D) then
        --frequency_out <= to_unsigned(3*V_max-tmp*V_max/(D), 32);
        freq <= 3*V_max-tmp*V_max/(D);
        --freq <= (V3)-(tmp*VdivD);
        --freq <= 0;
    else
        --frequency_out <= to_unsigned(0, 32);
        freq <= 0;
    end if; 
 end if;
end if;  
frequency_out <= to_unsigned(freq, 32);    

end process;

--process(reset,V_max,D)
--begin
-- V3 <= 3*V_max;
-- VdivD <= V_max/D;
--end process;
end Behavioral;
