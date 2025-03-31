library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;

entity majority is
port (a,b,c,d,e:in std_logic; y:out std_logic);
end entity;

architecture struct of majority is
signal s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13:std_logic;

begin
inst1: and_2 port map(a=>a,b=>b,y=>s1);
inst2: or_2 port  map(a=>a,b=>b,y=>s2);
inst3: or_2 port  map(a=>d,b=>e,y=>s3);
inst4: and_2 port map(a=>d,b=>e,y=>s4);
inst5: or_2 port  map(a=>s1,b=>s4,y=>s5);
inst6: and_2 port map(a=>s2,b=>s3,y=>s6);
inst7: and_2 port map(a=>s1,b=>s3,y=>s7);
inst8: and_2 port map(a=>s2,b=>s4,y=>s8);
inst9: or_2 port  map(a=>s5,b=>s6,y=>s9);
inst10: inverter port  map(a=>c,y=>s10);
inst11: or_2 port  map(a=>s7,b=>s8,y=>s11);
inst12: and_2 port map(a=>s9,b=>c,y=>s12);
inst13: and_2 port map(a=>s10,b=>s11,y=>s13);
inst14: or_2 port  map(a=>s12,b=>s13,y=>y);
end architecture;