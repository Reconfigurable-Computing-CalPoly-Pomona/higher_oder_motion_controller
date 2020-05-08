--Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
--Date        : Wed May  6 19:54:05 2020
--Host        : MSI running 64-bit major release  (build 9200)
--Command     : generate_target NEXYSMB_wrapper.bd
--Design      : NEXYSMB_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity NEXYSMB_wrapper is
  port (
    LightX : out STD_LOGIC;
    LightY : out STD_LOGIC;
    MOTORDirectionX : out STD_LOGIC;
    MOTORDirectionY : out STD_LOGIC;
    PULSEX : out STD_LOGIC;
    PULSEY : out STD_LOGIC;
    rst : in STD_LOGIC;
    rx : in STD_LOGIC;
    sysclk : in STD_LOGIC;
    tx : out STD_LOGIC
  );
end NEXYSMB_wrapper;

architecture STRUCTURE of NEXYSMB_wrapper is
  component NEXYSMB is
  port (
    rst : in STD_LOGIC;
    rx : in STD_LOGIC;
    tx : out STD_LOGIC;
    sysclk : in STD_LOGIC;
    PULSEX : out STD_LOGIC;
    PULSEY : out STD_LOGIC;
    MOTORDirectionX : out STD_LOGIC;
    MOTORDirectionY : out STD_LOGIC;
    LightX : out STD_LOGIC;
    LightY : out STD_LOGIC
  );
  end component NEXYSMB;
begin
NEXYSMB_i: component NEXYSMB
     port map (
      LightX => LightX,
      LightY => LightY,
      MOTORDirectionX => MOTORDirectionX,
      MOTORDirectionY => MOTORDirectionY,
      PULSEX => PULSEX,
      PULSEY => PULSEY,
      rst => rst,
      rx => rx,
      sysclk => sysclk,
      tx => tx
    );
end STRUCTURE;
