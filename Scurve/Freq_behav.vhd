----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/13/2020 12:55:22 PM
-- Design Name: 
-- Module Name: Freq_behav - Behavioral
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
use IEEE.STD_LOGIC_SIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Freq_behav is
    Port ( clk : in STD_LOGIC;
           Freq : in STD_LOGIC_VECTOR (31 downto 0);
           rst : in STD_LOGIC;
           start: in STD_LOGIC; 
           ok_top_test: out std_logic;         
           Pulse : out STD_LOGIC
          );
end Freq_behav;

architecture Behavioral of Freq_behav is

component counter_generic is
    generic (count_size:integer:= 32); 
    Port ( clk   : in STD_LOGIC;
           rst   : in STD_LOGIC;
           count : out STD_LOGIC_VECTOR (count_size-1 downto 0)
         );
end component counter_generic;

component Divide is
    Port( clk: in STD_LOGIC;
          reset: in STD_LOGIC;
          start: in STD_LOGIC;
          A: in STD_LOGIC_VECTOR(31 downto 0);
          B: in STD_LOGIC_VECTOR(31 downto 0);
          D: out STD_LOGIC_VECTOR(31 downto 0);
          R: out STD_LOGIC_VECTOR(31 downto 0);
          ok: out STD_LOGIC;
          err: out STD_LOGIC
        );
end component Divide;

signal count_top: std_logic_vector (31 downto 0);
signal pulse_tmp: std_logic;
signal rst_top,trigger: std_logic;
signal ok_top: std_logic;
signal err_top: std_logic;
signal A_top: std_logic_vector (31 downto 0) ;
signal D_top: std_logic_vector (31 downto 0);
signal final_result: std_logic_vector(31 downto 0) := x"00000000";
signal rst_D_top: std_logic;
begin

rst_top <= rst or trigger;
ok_top_test <= ok_top;
A_top <= x"02FAF080"; -- 50000000 hex number
COUNTER_GEN: counter_generic generic map (count_size => 32)
                             port map (
                                       clk => clk,
                                       rst => rst_top,
                                       count => count_top                                        
                                      );
DIVISION_FUNC: Divide port map (             -- module to do the division instead of division 
                                  clk => clk,
                                  reset => rst,
                                  start => start,
                                  A => A_top,
                                  B => Freq,
                                  D => D_top,
                                  R => open,
                                  ok => ok_top,
                                  err => open                                  
                                 );
                                 
FUNCTION_GEN: process (clk,rst,ok_top)
--              variable Freq_conv: integer;
           
              begin
             
              if rst = '1' then
                 pulse_tmp <= '0';
                
              else
                 if (rising_edge(clk)) then
--                    if (Freq = 0) then
--                        Freq_conv := 50000000;
--                    elsif (ok_top = '1') then
--                        Freq_conv := to_integer(unsigned(D_top));
--                    end if;
                    if( ok_top = '1') then -- wait for the division 
                        final_result <= D_top;
                    end if;
                    if ( count_top >= final_result) then -- get the count number to change the frequency base                   
                        trigger <= '1';         -- trigger to reset the count
                        pulse_tmp <= not pulse_tmp;  -- change the pulse 
                    else
                        trigger <= '0';  
                    end if;
                 end if;
              
              end if;
              
              end process;
pulse <= pulse_tmp;
end Behavioral;
