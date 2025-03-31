library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;

entity mux2x1 is
port (i1,i0,s:in std_logic; y:out std_logic);
end entity;

architecture struct of mux2x1 is
signal y1,y2,snot:std_logic;

begin
inst1: inverter port map(a=>s,y=>snot);
inst2: and_2 port map(a=>i0,b=>snot,y=>y1);
inst3: and_2 port map(a=>i1,b=>s,y=>y2);
inst4: or_2 port  map(a=>y1,b=>y2,y=>y);
end architecture;