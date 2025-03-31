library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;

entity and_using_nand is
port (a,b:in std_logic; y:out std_logic);
end entity;

architecture struct of and_using_nand is
signal s:std_logic;
begin
inst1: NAND_2 port map(a=>a,b=>b,y=>s);
inst2: NAND_2 port map(a=>s,b=>s,y=>y);
end architecture;