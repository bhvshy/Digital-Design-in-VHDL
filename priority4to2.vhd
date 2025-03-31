library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;

entity priority4to2 is
port (a,b,c,d:in std_logic; y1,y0,v:out std_logic);
end entity;

architecture struct of priority4to2 is
signal s2,s1,s0,bnot:std_logic;

begin
inst1: or_2 port  map(a=>a,b=>b,y=>s2);
inst2: inverter port map(a=>b,y=>bnot);
inst3: and_2 port map(a=>bnot,b=>c,y=>s1);
inst4: or_2 port map(a=>a,b=>s1,y=>y0);
inst5: or_2 port  map(a=>c,b=>d,y=>s0);
inst6: or_2 port  map(a=>s2,b=>s2,y=>y1);
inst7: or_2 port  map(a=>s2,b=>s0,y=>v);
end architecture;