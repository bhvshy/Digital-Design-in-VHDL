library ieee;
use ieee.std_logic_1164.all;

entity alu is
port (
a: in std_logic_vector(3 downto 0);
b: in std_logic_vector(3 downto 0);
s: in std_logic_vector(1 downto 0);
y: out std_logic_vector(7 downto 0));
end alu;

architecture a1 of alu is

function sub(a: in std_logic_vector(3 downto 0); b: in std_logic_vector(3 downto 0))

return std_logic_vector is
-- declaring and initializing variables using aggregates
variable diff : std_logic_vector(7 downto 0) := (others => '0');
variable carry: std_logic_vector(8 downto 0) := (others => '0');
variable ain: std_logic_vector(7 downto 0) := "0000" & a;
variable bin: std_logic_vector(7 downto 0) := "0000" & b;

begin
-- Hint: Use for loop to calculate value of "diff" and "carry" variable
for i in 0 to 7 loop
diff(i) := ain(i) xor bin(i) xor carry(i);
carry(i+1) := ((not ain(i)) and bin(i)) or (carry(i) and not(ain(i) xor  bin(i)));
end loop;
-- Use aggregates to assign values to multiple bits
return diff;

end sub;

function shift_A_by_B(A: in std_logic_vector(3 downto 0); B: in std_logic_vector(3 downto 0))
return std_logic_vector is
variable shifted_A : std_logic_vector(3 downto 0) := (others => '0');
begin
if B(3) = '1' then  -- Right shift
if B(1 downto 0)="00" then
shifted_A := A;
elsif B(1 downto 0)="01" then
shifted_A(3) :='0';
shifted_A( 2 downto 0) := A(3 downto 1);
elsif B(1 downto 0)="10" then
shifted_A(3) :='0';
shifted_A(2) :='0';
shifted_A( 1 downto 0) := A(3 downto 2);
else
shifted_A(3) :='0';
shifted_A(2) :='0';
shifted_A(1) :='0';
shifted_A( 0 downto 0) := A(3 downto 3);
end if;
else  -- Left shift
if B(1 downto 0)="00" then
shifted_A := A;
elsif B(1 downto 0)="01" then
shifted_A(0) := '0';
shifted_A(3 downto 1):=A(2 downto 0);
elsif B(1 downto 0)="10" then
shifted_A(0) := '0';
shifted_A(1) := '0';
shifted_A(3 downto 2):=A(1 downto 0);
else
shifted_A(0) := '0';
shifted_A(1) := '0';
shifted_A(2) := '0';
shifted_A(3 downto 3):=A(0 downto 0);
end if;
end if;
return shifted_A;
end shift_A_by_B;

begin
alu : process( a, b, s )

begin

if s(1)='0' then
if s(0)='0' then
y<=a & b;
end if;
end if;

if s(1)='0' then
if s(0)='1' then
y<=sub(a,b);
end if;
end if;

if s(1)='1' then
if s(0)='0' then
y<=("0000" & (a xor b));
end if;
end if;

if s(1)='1' then
if s(0)='1' then

y <= "0000" & shift_A_by_B(A, B);

end if;
end if;

end process ;

end a1 ;