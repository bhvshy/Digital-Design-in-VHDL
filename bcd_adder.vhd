library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;

entity bcd_adder is
	port (a3, a2, a1, a0, b3, b2, b1, b0: in std_logic;
			y4, y3, y2, y1, y0: out std_logic);
end entity;

architecture struct of bcd_adder is
	component four_bit_adder_subtractor is
		port (a3, a2, a1, a0, b3, b2, b1, b0, M: in std_logic;
				Cout, s3, s2, s1, s0: out std_logic);
	end component;
	
		signal s3, s2, s1, s0, Cout, sig1, sig2, sig3, sig4, sig5: std_logic;
		
begin
		inst1: four_bit_adder_subtractor port map (a3=>a3, a2=>a2, a1=>a1, a0=>a0, b3=>b3, b2=>b2, b1=>b1, b0=>b0, M=>'0', s3=>s3, s2=>s2, s1=>s1, s0=>s0, Cout=>Cout);
		inst2: AND_2 port map (a=>s3, b=>s2, y=>sig1);
		inst3: AND_2 port map (a=>s3, b=>s1, y=>sig2);
		inst4: OR_2 port map (a=>sig1, b=>sig2, y=>sig3);
		inst5: OR_2 port map (a=>Cout, b=>sig3, y=>sig4);
		inst6: four_bit_adder_subtractor port map (a3=>'0', a2=>sig4, a1=>sig4, a0=>'0', b3=>s3, b2=>s2, b1=>s1, b0=>s0, M=>'0', s3=>y3, s2=>y2, s1=>y1, s0=>y0, Cout=>sig5);
		inst7: OR_2 port map (a=>Cout, b=>sig3, y=>y4);
end architecture;