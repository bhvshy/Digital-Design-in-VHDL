library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;

entity four_bit_adder_subtractor is
port (a0,a1,a2,a3,b0,b1,b2,b3,m:in std_logic; s0,s1,s2,s3,cout:out std_logic);
end entity;

architecture struct of four_bit_adder_subtractor is

component xor_using_nand is
port (a,b: in std_logic; y: out std_logic);
end component xor_using_nand;

component full_adder_using_nand is
port (a,b,cin: in std_logic; s,cout: out std_logic);
end component full_adder_using_nand;

signal c0,c1,c2,x0,x1,x2,x3:std_logic;

begin
inst1: xor_using_nand port map(a=>b0,b=>m,y=>x0);
inst2: xor_using_nand port map(a=>b1,b=>m,y=>x1);
inst3: xor_using_nand port map(a=>b2,b=>m,y=>x2);
inst4: xor_using_nand port map(a=>b3,b=>m,y=>x3);
inst5: full_adder_using_nand port map(a=>a0,b=>x0,cin=>m,s=>s0,cout=>c0);
inst6: full_adder_using_nand port map(a=>a1,b=>x1,cin=>c0,s=>s1,cout=>c1);
inst7: full_adder_using_nand port map(a=>a2,b=>x2,cin=>c1,s=>s2,cout=>c2);
inst8: full_adder_using_nand port map(a=>a3,b=>x3,cin=>c2,s=>s3,cout=>cout);
end architecture;