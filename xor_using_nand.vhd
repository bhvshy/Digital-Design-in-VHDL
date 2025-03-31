library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;

entity xor_using_nand is
port (a,b:in std_logic; y:out std_logic);
end entity;

architecture struct of xor_using_nand is
signal s1,s2,s3:std_logic;
begin
inst1: NAND_2 port map(a=>a,b=>b,y=>s1);
inst2: NAND_2 port map(a=>a,b=>s1,y=>s2);
inst3: NAND_2 port map(a=>b,b=>s1,y=>s3);
inst4: NAND_2 port map(a=>s2,b=>s3,y=>y);
end architecture;