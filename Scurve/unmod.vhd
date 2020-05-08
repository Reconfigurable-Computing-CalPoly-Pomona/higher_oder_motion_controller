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

entity unmod is
    Port ( enable : in std_logic;
          start : in std_logic;
          sel : in std_logic;
          clk : in std_logic;
          rst : in std_logic;
          X : in std_logic_vector(1 downto 0);
          Y : in std_logic_vector(1 downto 0);
          direction_in_x : in std_logic;
          direction_out_x : out std_logic;
          direction_in_y : in std_logic;
          direction_out_y : out std_logic;
          pulse_gen_x : out STD_LOGIC;
          pulse_gen_y : out STD_LOGIC
 );
end unmod;

architecture Behavioral of unmod is

component SecOrder
    Port ( enable: in std_logic;
           start : in std_logic;
           clk : in STD_LOGIC;
           distance: in natural;
           comp: in natural;
           rst : in STD_LOGIC;
           frequency_out : out unsigned(31 downto 0));
end component;

component ThdOrder
    Port ( enable: in std_logic;
           start : in std_logic;
           clk : in STD_LOGIC;
           distance: in natural;
           comp: in natural;
           rst : in STD_LOGIC;
           frequency_out : out unsigned(31 downto 0));
end component;

component Freq_behav is
    Port ( clk : in STD_LOGIC;
           Freq : in STD_LOGIC_VECTOR (31 downto 0);
           rst : in STD_LOGIC;
           start: in STD_LOGIC; 
           ok_top_test: out std_logic;         
           Pulse : out STD_LOGIC
          );
end component;

component en_pulse is
    Port ( freq_in : in STD_LOGIC_VECTOR (31 downto 0);
           freq_out : out STD_LOGIC_VECTOR (31 downto 0);
           clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           en : out STD_LOGIC);
end component;

signal freq_x, freq_y: std_logic_vector(31 downto 0);
signal freq_un_sec_x, freq_un_thd_x: unsigned(31 downto 0);
signal freq_un_sec_y, freq_un_thd_y: unsigned(31 downto 0);
signal start_sec, start_thd: std_logic;
signal enable_sec, enable_thd: std_logic;

signal X_sig, Y_sig: std_logic_vector(31 downto 0);

signal freq_logic_en_x: std_logic_vector(31 downto 0);
signal freq_logic_en_y: std_logic_vector(31 downto 0);
signal en_signal_x : std_logic;
signal en_signal_pulse_x : std_logic;
signal en_signal_y : std_logic;
signal en_signal_pulse_y : std_logic;

begin

process(clk)
begin

    if (X = "00" and Y = "00") then
            X_sig <= x"00000005";
            Y_sig <= x"00000005";
    elsif (X = "00" and Y = "01") then
            X_sig <= x"0000000a";
            Y_sig <= x"0000000a"; 
    elsif (X = "00" and Y = "10") then
            X_sig <= x"00000014";
            Y_sig <= x"00000014";
    elsif (X = "00" and Y = "11") then
            X_sig <= x"0000001e";
            Y_sig <= x"0000001e";
    elsif (X = "01" and Y = "00") then
            X_sig <= x"00000028";
            Y_sig <= x"00000028"; 
    elsif (X = "01" and Y = "01") then
            X_sig <= x"00000032";
            Y_sig <= x"00000032"; 
    elsif (X = "01" and Y = "10") then
            X_sig <= x"0000003c";
            Y_sig <= x"0000003c";
    else
            X_sig <= x"00000064";
            Y_sig <= x"00000064";   
    end if; 

end process;

direction_out_x <= direction_in_x;
direction_out_y <= direction_in_y;
start_sec <= start and not sel;
start_thd <= start and sel;
enable_sec <= enable and not sel;
enable_thd <= enable and sel;

SecndOrder_x: SecOrder port map(
             enable     => enable_sec,
             start      => start_sec,
             clk        => clk,
             rst        => rst,
             distance   => to_integer(unsigned(X_sig)),
             comp       => 100,
             frequency_out  => freq_un_sec_x);

ThrddOrder_x: ThdOrder port map(
             enable     => enable_thd,
             start      => start_thd,
             clk        => clk,
             rst        => rst,
             distance   => to_integer(unsigned(X_sig)),
             comp       => 100,
             frequency_out  => freq_un_thd_x);             

SecndOrder_y: SecOrder port map(
             enable     => enable_sec,
             start      => start_sec,
             clk        => clk,
             rst        => rst,
             distance   => to_integer(unsigned(Y_sig)),
             comp       => 100,
             frequency_out  => freq_un_sec_y);

ThrddOrder_y: ThdOrder port map(
             enable     => enable_thd,
             start      => start_thd,
             clk        => clk,
             rst        => rst,
             distance   => to_integer(unsigned(Y_sig)),
             comp       => 100,
             frequency_out  => freq_un_thd_y); 

process(clk)
begin

    if (sel = '0') then
        freq_x <= std_logic_vector(freq_un_sec_x);
        freq_y <= std_logic_vector(freq_un_sec_y);
    else
        freq_x <= std_logic_vector(freq_un_thd_x); 
        freq_y <= std_logic_vector(freq_un_thd_y);    
    end if; 

end process;

EN_PULSE_GEN_x: en_pulse port map (
                                   freq_in  => freq_x,
                                   freq_out => freq_logic_en_x,
                                   clk      => clk,
                                   rst      => rst,
                                   en       => en_signal_x
                                   );
                                  
en_signal_pulse_x <= rst or en_signal_x;

EN_PULSE_GEN_y: en_pulse port map (
                                   freq_in  => freq_y,
                                   freq_out => freq_logic_en_y,
                                   clk      => clk,
                                   rst      => rst,
                                   en       => en_signal_y
                                   );
                                  
en_signal_pulse_y <= rst or en_signal_y;

GEN_PULSE_MOTOR_x: Freq_behav port map(
                                clk         => clk,
                                Freq        => freq_logic_en_x,
                                rst         => en_signal_pulse_x,
                                start       => '1',
                                ok_top_test => open,
                                Pulse       => pulse_gen_x
                               );
                               
GEN_PULSE_MOTOR_y: Freq_behav port map(
                                clk         => clk,
                                Freq        => freq_logic_en_y,
                                rst         => en_signal_pulse_y,
                                start       => '1',
                                ok_top_test => open,
                                Pulse       => pulse_gen_y
                               );

end Behavioral;
