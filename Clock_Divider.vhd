library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;
  
entity Clock_Divider is
port ( clk,reset: in std_logic;
clock_out: out std_logic);
end Clock_Divider;
  
architecture bhv of Clock_Divider is
  
signal count: integer:=1;
signal tmp : std_logic := '0';
  
begin
  
process(clk)
begin
if(rising_edge(clk)) then
    if(reset = '1') then
    count <= 1;
    tmp <= '0';   
    elsif (count = 5) then -- (Input/output freq) / 2 = count , (100Mhz / 8 Mhz) / 2 =6
    tmp <= NOT tmp; -- (Input/output freq) / 2 = count , (100Mhz / 5 Mhz) / 2 = 10
    count <= 1;
    else
    count <=count+1;
    end if;
end if;

end process;
clock_out <= tmp;
end bhv;
