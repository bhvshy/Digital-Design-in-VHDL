library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;

entity full_adder_using_nand is
port (a,b,cin:in std_logic; s,cout:out std_logic);
end entity;

architecture struct of full_adder_using_nand is

component xor_using_nand is
port (a,b: in std_logic; y: out std_logic);
end component xor_using_nand;

component or_using_nand is
port (a,b: in std_logic; y: out std_logic);
end component or_using_nand;

component and_using_nand is
port (a,b: in std_logic; y: out std_logic);
end component and_using_nand;

signal s1,s2,s3:std_logic;

begin
inst1: xor_using_nand port map(a=>a,b=>b,y=>s1);
inst2: xor_using_nand port map(a=>s1,b=>cin,y=>s);
inst3: and_using_nand port map(a=>s1,b=>cin,y=>s2);
inst4: and_using_nand port map(a=>a,b=>b,y=>s3);
inst5: or_using_nand port map(a=>s2,b=>s3,y=>cout);
end architecture;