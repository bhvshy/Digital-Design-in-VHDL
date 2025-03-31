library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity spi_master_2b is
	port (
		data: in std_logic_vector(9 downto 0);
		rst_b: in std_logic;
		clk_in: in std_logic;
		sclk, cs_b, d_out: out std_logic);
end entity;

architecture beh of spi_master_2b is
	component clock_divider is
		port (clk_in : in std_logic; clk_out : out std_logic);
	end component;
	signal reg_b : std_logic_vector(9 downto 0);
	signal count : integer := 0;
	signal clk   : std_logic;
	signal sclk_en : std_logic;

begin

	clk_div : clock_divider
		port map (clk_in=>clk_in, clk_out=>clk);
	
	sclk <= clk and sclk_en;
	
	process(clk, rst_b)
	begin
		if rst_b='0' then
			count <= 0;
			sclk_en<= '0';
			reg_b <= data;
			cs_b  <= '1';
			d_out <= 'X';

		elsif falling_edge(clk) then
			case count is
			when 0 =>
				d_out<= '0';
			when 1|2|3 =>
				d_out<= '1';
			when 14|15 =>
				d_out<= '0';
			when 16 =>
				d_out<= 'X';
			when others =>
				d_out<= reg_b(13-count);
			end case;

			if count<=15 then
				cs_b <= '0';
				sclk_en <= '1';
				count<= count + 1;
			else
				cs_b <='1';
				sclk_en<='0';
			end if;
		end if;
	end process;
	
end architecture;