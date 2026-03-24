library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library work;
use work.RAM_definitions_PK.all;
use IEEE.NUMERIC_STD.ALL;

entity tb_im_ram is
end tb_im_ram;

architecture Behavioral of tb_im_ram is
component im_ram is
    generic (
        G_RAM_WIDTH : integer := 8;            		    -- Specify RAM data width
        G_RAM_DEPTH : integer := 256*256; 				        -- Specify RAM depth (number of entries)
        G_RAM_PERFORMANCE : string := "LOW_LATENCY"   -- Select "HIGH_PERFORMANCE" or "LOW_LATENCY" 
    );
    port (
        addra : in std_logic_vector((clogb2(G_RAM_DEPTH)-1) downto 0);     -- Write address bus, width determined from RAM_DEPTH
        addrb : in std_logic_vector((clogb2(G_RAM_DEPTH)-1) downto 0);     -- Read address bus, width determined from RAM_DEPTH
        dina  : in std_logic_vector(G_RAM_WIDTH-1 downto 0);		  -- RAM input data
        clk  : in std_logic;                       			  -- Clock
        wea   : in std_logic;                       			  -- Write enable
        enb   : in std_logic;                       			  -- RAM Enable, for additional power savings, disable port when not in use
        rstb  : in std_logic;                       			  -- Output reset (does not affect memory contents)
        regceb: in std_logic;                       			  -- Output register enable
        doutb : out std_logic_vector(G_RAM_WIDTH-1 downto 0) 		  -- RAM output data
    );
    
    
end component;
signal clk : std_logic := '0';
signal addra, addrb : std_logic_vector(15 downto 0);
signal doutb : std_logic_vector(7 downto 0);
signal dina : std_logic_vector(7 downto 0);
constant Tclk : time := 10ns;


begin
    clk_gen: clk <= not clk after Tclk/2;
    dut: im_ram generic map( G_RAM_WIDTH => 8, G_RAM_DEPTH => 256*256, G_RAM_PERFORMANCE => "HIGH_PERFORMANCE")
           port map(addra => addra, addrb => addrb, dina => dina, doutb => doutb, clk => clk, regceb => '1', enb => '1', wea => '1', rstb => '0');
    addrb <= std_logic_vector(to_unsigned(552, 16)),std_logic_vector(to_unsigned(12345, 16)) after 10*Tclk, std_logic_vector(to_unsigned(2003, 16)) after 20 * Tclk;
end Behavioral;
