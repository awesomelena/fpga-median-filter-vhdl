library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_line_buffer is
--  Port ( );
end tb_line_buffer;

architecture Behavioral of tb_line_buffer is
component line_buffer is
port (
        clk      : in std_logic;
        in_data  : in std_logic_vector(7 downto 0);
        out_data : out std_logic_vector(7 downto 0)
    );
end component;
signal clk : std_logic := '0';
signal in_data : std_logic_vector(7 downto 0);
signal out_data : std_logic_vector(7 downto 0);
constant Tclk : time := 10ns;
begin
clk_gen: clk <= not clk after Tclk/2;
dut: line_buffer port map( clk => clk, in_data => in_data, out_data=> out_data);
stimulus: process is 
begin
in_data <= "00101000";
wait for 300*Tclk;
wait;
end process;
end Behavioral;

