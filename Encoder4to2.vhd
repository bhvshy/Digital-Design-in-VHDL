library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;

entity encoder4to2 is
port (a,b,c,d,en:in std_logic; y1,y0:out std_logic);
end entity;

architecture struct of encoder4to2 is
signal s0,s1:std_logic;

begin
inst1: or_2 port map(a=>a,b=>b,y=>s1);
inst4: or_2 port map(a=>a,b=>c,y=>s0);
inst2: and_2 port map(a=>s1,b=>en,y=>y1);
inst3: and_2 port map(a=>s0,b=>en,y=>y0);
end architecture;