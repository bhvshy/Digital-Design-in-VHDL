library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;

entity or_using_nand is
port (a,b:in std_logic; y:out std_logic);
end entity;

architecture struct of or_using_nand is
signal s1,s2:std_logic;
begin
inst1: NAND_2 port map(a=>a,b=>a,y=>s1);
inst2: NAND_2 port map(a=>b,b=>b,y=>s2);
inst3: NAND_2 port map(a=>s1,b=>s2,y=>y);
end architecture;