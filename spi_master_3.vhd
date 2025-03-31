library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity spi_master_3 is
	port (rst, clk_in, miso : in std_logic;
			mosi, sclk_adc, sclk_dac, cs_b_adc, cs_b_dac, d_out_dac : out std_logic);
end entity;

architecture design of spi_master_3 is
		
	component spi_master_2a is
		port (rst, clk_in, miso : in std_logic;
				mosi, sclk, cs_b, done : out std_logic;
				d_out : out std_logic_vector(9 downto 0));
	end component;
	
	component spi_master_2b is
		port (data   : in std_logic_vector(9 downto 0);
				rst_b  : in std_logic;
				clk_in : in std_logic;
				sclk, cs_b, d_out: out std_logic);
	end component;
	
	signal adc_value : std_logic_vector(9 downto 0);
	signal done_f    : std_logic;
begin
	
	spi_a : spi_master_2a port map (rst=>rst, clk_in=>clk_in, miso=>miso, mosi=>mosi, sclk=>sclk_adc, cs_b=>cs_b_adc, done=>done_f, d_out=>adc_value);
	spi_b : spi_master_2b port map (data=>adc_value, rst_b=>done_f, clk_in=>clk_in, sclk=>sclk_dac, cs_b=>cs_b_dac, d_out=>d_out_dac);
	
end architecture;	