library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;  

entity shift_subtract_divider is 
port(clk, reset, start : in std_logic;
		A, B : in std_logic_vector(3 downto 0);
		Q, R : out std_logic_vector(3 downto 0);
		done, error : out std_logic);
end entity;

architecture behav of shift_subtract_divider is

------------------Define state type here------------------
type state is (s1,s2,s3,s4,s5,er); --Fill other states here

  component comparator4bit is
   port (a3,a2,a1,a0,b3,b2,b1,b0:in std_logic; g,e,l:out std_logic);
  end component comparator4bit;

signal s_present,s_next : state:=s1;
signal div_reg,rem_reg:std_logic_vector(3 downto 0);
signal shift:integer;
signal err:std_logic;

begin

clock_proc:process(clk,reset)

begin

if(clock='1' and clock' event) then

if(reset='1') then
s_present<=s1;

--Here Reset is synchronous
-- Fill the code here

elsif (reset='0') then
s_present<=s_next;
-- Fill the code here

end if;
end if;
end process;


state_transition:process (s_present,s_next,start,b,err)

begin

case s_present is

when s1=>
if start='1' then
s_next<=s2;
end if;

when s2=>
div_reg<=b;
rem_reg<=a;
if B="0000" then
s_next<=er;
else s_next<=s3;
end if;

when er=>
err<='1';
s_next<=s5;

when s3=>

if div_reg(3)='1' then
div_reg<=div_reg;
shift<=0;

elsif div_reg(2)='1' then
div_reg<=div_reg(2 downto 0) & "0";
shift<=1;

elsif div_reg(1)='1' then
div_reg<=div_reg(1 downto 0) & "00";
shift<=2;

elsif div_reg(0)='1' then
div_reg<=div_reg(0 downto 0) & "000";
shift<=3;

end if;

s_next<=s4;

when s4=>

if rem_reg>=b then
inst1: division port map(div_reg=>div_reg,rem_reg=>rem_reg,shift=>shift,quo=>q,re=>r);
s_next<=s4;
else s_next<=s5;

end if;
end case;
end process;

error<=err;

end architecture;