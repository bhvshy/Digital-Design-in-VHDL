library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity clock_divider is
	port(
		clk_in: in std_logic; 
		clk_out: out std_logic
	);
end entity;

architecture design of clock_divider is

	shared variable count : integer := 0;
	constant inp_freq : integer := 10e6;
	constant out_freq : integer := 1e6;
	constant max_count : integer := inp_freq/(2*out_freq);
	signal clk_nxt_val : std_logic := '0';
	
begin

	clk_out <= clk_nxt_val;
	
	clock_division: process(clk_in)
		begin
			if (rising_edge(clk_in)) then
				count := count + 1;
				if (count = max_count) then
					clk_nxt_val <= not clk_nxt_val;
					count := 0;
				end if;
			end if;
		end process;

end architecture;		