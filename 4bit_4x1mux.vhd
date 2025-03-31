library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;

entity mux4x1_4bit is
port (d3,d2,d1,d0,c3,c2,c1,c0,b3,b2,b1,b0,a3,a2,a1,a0,s1,s0:in std_logic; y3,y2,y1,y0:out std_logic);
end entity;

architecture struct of mux4x1_4bit is

component mux4x1 is
port (i3,i2,i1,i0,s1,s0: in std_logic; y: out std_logic);
end component mux4x1;

begin
inst1: mux4x1 port map(i3=>d3,i2=>c3,i1=>b3,i0=>a3,s1=>s1,s0=>s0,y=>y3);
inst2: mux4x1 port map(i3=>d2,i2=>c2,i1=>b2,i0=>a2,s1=>s1,s0=>s0,y=>y2);
inst3: mux4x1 port map(i3=>d1,i2=>c1,i1=>b1,i0=>a1,s1=>s1,s0=>s0,y=>y1);
inst4: mux4x1 port map(i3=>d0,i2=>c0,i1=>b0,i0=>a0,s1=>s1,s0=>s0,y=>y0);
end architecture;