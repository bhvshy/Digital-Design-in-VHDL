library ieee;
use ieee.std_logic_1164.all;
use work.Flipflops.all;

-- write the Flipflops packege declaration

entity seq_gen is
port (reset,clock: in std_logic;y:out std_logic);
end entity seq_gen;

architecture struct of seq_gen is
signal D:std_logic_vector(2 downto 0);
signal Q:std_logic_vector(2 downto 0);
signal r:std_logic;

begin

D(2)<=(Q(2) and (Q(1) nand Q(0))) or (not Q(2) and Q(1) and Q(0));
D(1)<=Q(1) xor Q(0);
D(0)<=(Q(2) and Q(1)) or not Q(0);
r<=(not Q(2) and not Q(1) and not Q(0)) or reset;

inst1: dff_reset port map (D=>D(2),clock=>clock,reset=>r,Q=>Q(2));
inst2: dff_reset port map (D=>D(1),clock=>clock,reset=>r,Q=>Q(1));
inst3: dff_set port map (D=>D(0),clock=>clock,set=>r,Q=>Q(0));

y<= Q(0);
-- write the equations in dataflow e.g z=a+bc written as z <= a or (b and c)
-- for DFF inputs which was derived and also for y.
-- Instantiate components dff_reset
-- and dff_set appropriately using port map statements.
end struct;