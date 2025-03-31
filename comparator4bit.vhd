library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;

entity comparator4bit is
port (a3,a2,a1,a0,b3,b2,b1,b0:in std_logic; g,e,l:out std_logic);
end entity;

architecture struct of comparator4bit is
signal b3not,b2not,b1not,b0not,s3,s2,s1,s0,r3,r2,r1,r0,x1,x2,x3,y1,y2,y3,z1,z2,z3:std_logic;

begin
inst1: inverter port map(a=>b3,y=>b3not);
inst2: inverter port map(a=>b2,y=>b2not);
inst3: inverter port map(a=>b1,y=>b1not);
inst4: inverter port map(a=>b0,y=>b0not);
inst5: xor_2 port  map(a=>a3,b=>b3not,y=>s3);
inst6: xor_2 port  map(a=>a2,b=>b2not,y=>s2);
inst7: xor_2 port  map(a=>a1,b=>b1not,y=>s1);
inst8: xor_2 port  map(a=>a0,b=>b0not,y=>s0);
inst9: and_2 port map(a=>a3,b=>b3not,y=>r3);
inst10: and_2 port map(a=>a2,b=>b2not,y=>r2);
inst11: and_2 port map(a=>a1,b=>b1not,y=>r1);
inst12: and_2 port map(a=>a0,b=>b0not,y=>r0);
inst13: and_2 port map(a=>s3,b=>s2,y=>x1);
inst14: and_2 port map(a=>x1,b=>s1,y=>x2);
inst15: and_2 port map(a=>x2,b=>s0,y=>x3);
inst16: and_2 port map(a=>x3,b=>x3,y=>e);
inst17: and_2 port map(a=>s3,b=>r2,y=>y1);
inst18: and_2 port map(a=>x1,b=>r1,y=>y2);
inst19: and_2 port map(a=>x2,b=>r0,y=>y3);
inst20: or_2 port map(a=>r3,b=>y1,y=>z1);
inst21: or_2 port map(a=>z1,b=>y2,y=>z2);
inst22: or_2 port map(a=>z2,b=>y3,y=>z3);
inst23: or_2 port map(a=>z3,b=>z3,y=>g);
inst24: nor_2 port map(a=>x3,b=>z3,y=>l);
end architecture;