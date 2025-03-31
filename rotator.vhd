library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;

entity rotator is
port (l:in std_logic; b:in std_logic_vector(2 downto 0); a:in std_logic_vector(7 downto 0); 
s:out std_logic_vector(7 downto 0));
end entity;

architecture struct of rotator is

component mux2x1 is
port (i1,i0,s: in std_logic; y: out std_logic);
end component mux2x1;


signal w: std_logic_vector(7 downto 0);
signal x: std_logic_vector(7 downto 0);
signal y: std_logic_vector(7 downto 0);
signal z: std_logic_vector(7 downto 0);

begin

reversal1 : for i in 0 to 7 generate
r1: mux2x1 port map(i0 => a(i), i1 => a(7-i), S => l, Y => w(i));
end generate ;

r4bit : for i in 0 to 7 generate
lsb: if i < 4 generate
b2: mux2x1 port map(i0 => w(i), i1 => w(i+4), S => b(2), Y => x(i));
end generate lsb;
msb: if i > 3 generate
b2: mux2x1 port map(i0 => w(i), i1 => w(i-4), S => b(2), Y => x(i));
end generate msb;
end generate ;

r2bit : for i in 0 to 7 generate
lsb: if i < 6 generate
b1: mux2x1 port map(i0 => x(i), i1 => x(i+2), S => b(1), Y => y(i));
end generate lsb;
msb: if i > 5 generate
b1: mux2x1 port map(i0 => x(i), i1 => x(i-6), S => b(1), Y => y(i));
end generate msb;
end generate ;

r1bit : for i in 0 to 7 generate
lsb: if i < 7 generate
b0: mux2x1 port map(i0 => y(i), i1 => y(i+1), S => b(0), Y => z(i));
end generate lsb;
msb: if i > 6 generate
b0: mux2x1 port map(i0 => y(i), i1 => y(i-7), S => b(0), Y => z(i));
end generate msb;
end generate ;

reversal2 : for i in 0 to 7 generate
r2: mux2x1 port map(i0 => z(i), i1 => z(7-i), S => l, Y => s(i));
end generate ;

end architecture;