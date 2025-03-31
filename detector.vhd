library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity detector is
port (
inp: in std_logic_vector(4 downto 0);
reset,clock: in std_logic;
outp: out std_logic) ;
end detector;

architecture bhv of detector is

------------------Define state type here------------------
type state is (rst,s1,s2,s3,s4); --Fill other states here

------------------Define signals of state type--------------
signal x_present,x_next: state:=rst;
signal y_present,y_next: state:=rst;
signal z_present,z_next: state:=rst;
signal outx,outy,outz: std_logic;

begin
clock_proc:process(clock,reset)

begin

if(clock='1' and clock' event) then

if(reset='1') then
x_present<=rst;
y_present<=rst;
z_present<=rst;
--Here Reset is synchronous
-- Fill the code here

elsif (reset='0') then
x_present<=x_next;
y_present<=y_next;
z_present<=z_next;
-- Fill the code here

end if;
end if;
end process;

state_transition_proc:process(inp,x_present,y_present,z_present)

begin

case x_present is --must1

when rst=>
if(unsigned(inp)=13) then --m has been detected
x_next<=s1;
end if; -- Fill the code here

when s1=>
if(unsigned(inp)=21) then --u has been detected
x_next<=s2;
end if; -- Fill the code here

when s2=>
if(unsigned(inp)=19) then --s has been detected
x_next<=s3;
end if; -- Fill the code here

when s3=>
if(unsigned(inp)=20) then --t has been detected
x_next<=s4;
end if; -- Fill the code here

when s4=>
if(unsigned(inp)=28) then --1 has been detected
x_next<=rst;
end if; -- Fill the code here

end case;

case y_present is --lion2

when rst=>
if(unsigned(inp)=12) then --l has been detected
y_next<=s1; -- Fill the code here
end if;

when s1=>
if(unsigned(inp)=9) then --i has been detected
y_next<=s2; -- Fill the code here
end if;

when s2=>
if(unsigned(inp)=15) then --o has been detected
y_next<=s3; -- Fill the code here
end if;

when s3=>
if(unsigned(inp)=14) then --n has been detected
y_next<=s4; -- Fill the code here
end if;

when s4=>
if(unsigned(inp)=29) then --2 has been detected
y_next<=rst; -- Fill the code here
end if;

end case;

case z_present is --ring3

when rst=>
if(unsigned(inp)=18) then --r has been detected
z_next<=s1; -- Fill the code here
end if;

when s1=>
if(unsigned(inp)=9) then --i has been detected
z_next<=s2; -- Fill the code here
end if;

when s2=>
if(unsigned(inp)=14) then --n has been detected
z_next<=s3; -- Fill the code here
end if;

when s3=>
if(unsigned(inp)=7) then --g has been detected
z_next<=s4; -- Fill the code here
end if;

when s4=>
if(unsigned(inp)=30) then --3 has been detected
z_next<=rst; -- Fill the code here
end if;

end case;
end process;

output_proc:process(x_present, y_present, z_present, inp) ------- output process after this which will give
-------the output based on the present state and input (Mealy machine)

begin

if (x_present=s4 and (unsigned(inp)=28)) or (y_present=s4 and (unsigned(inp)=29)) or (z_present=s4 and (unsigned(inp)=30)) then
outp<='1';

else outp<='0';
end if;

end process;

end architecture;