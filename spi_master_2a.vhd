library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity spi_master_2a is
	port (rst, clk_in, miso : in std_logic;
			mosi, sclk, cs_b, done : out std_logic;
			d_out : out std_logic_vector(9 downto 0));
end entity;

architecture beh of spi_master_2a is
	component clock_divider is
		port (clk_in : in std_logic; clk_out : out std_logic);
	end component;
	signal reg_a : std_logic_vector(9 downto 0);
	signal count : integer := 0;
	signal clk   : std_logic;
begin

	clk_div : clock_divider
		port map (clk_in=>clk_in, clk_out=>clk);
		
	sclk <= clk;
	d_out <= reg_a;
	
	process(clk, rst)
	begin
	if rst='1' then
		cs_b <= '1';
		count <= 0;
		reg_a <= (others=>'X');
		done <= '0';
		mosi <= 'X';
	elsif falling_edge(clk) then
		case count is
			when 0|1 => mosi <= '1';
			when 2|3|4 => mosi <= '0';
			when others => mosi <= 'X';
		end case;
		if count<=15 then
			cs_b<='0'; count<=count+1;
		elsif count=16 then
			cs_b<='0'; 
			count<=count+1; 
			done<='0';
		else
			cs_b<='1'; 
			count<=0; 
			done<='1'; 
			reg_a <= (others=>'X');
		end if;
	elsif rising_edge(clk) then
		if count>=8 and count<=17 then
			reg_a(17-count) <= miso;
		end if;	
	end if;
	end process;
	
end architecture;