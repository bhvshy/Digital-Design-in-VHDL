library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;

entity mux4x1 is
port (i3,i2,i1,i0,s1,s0:in std_logic; y:out std_logic);
end entity;

architecture struct of mux4x1 is

component mux2x1 is
port (i1,i0,s: in std_logic; y: out std_logic);
end component mux2x1;


signal y1,y2:std_logic;

begin
inst1: mux2x1 port map(i1=>i1,i0=>i0,s=>s0,y=>y1);
inst2: mux2x1 port map(i1=>i3,i0=>i2,s=>s0,y=>y2);
inst3: mux2x1 port map(i1=>y2,i0=>y1,s=>s1,y=>y);
end architecture;