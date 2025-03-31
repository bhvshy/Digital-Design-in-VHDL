library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;

entity encoder8to3 is
port (a,b,c,d,e,f,g,h,en:in std_logic; y2,y1,y0:out std_logic);
end entity;

architecture struct of encoder8to3 is
signal s1,s2,s3,s4,s5,s6,s7,s8:std_logic;

begin
inst1: or_2 port  map(a=>a,b=>b,y=>s1);
inst2: or_2 port  map(a=>c,b=>d,y=>s2);
inst3: or_2 port  map(a=>e,b=>f,y=>s3);
inst4: or_2 port  map(a=>a,b=>c,y=>s4);
inst5: or_2 port  map(a=>e,b=>g,y=>s5);
inst6: or_2 port  map(a=>s1,b=>s2,y=>s6);
inst7: or_2 port  map(a=>s1,b=>s3,y=>s7);
inst8: or_2 port  map(a=>s4,b=>s5,y=>s8);
inst9: and_2 port map(a=>s6,b=>en,y=>y2);
inst10: and_2 port map(a=>s7,b=>en,y=>y1);
inst11: and_2 port  map(a=>s8,b=>en,y=>y0);
end architecture;