

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_min_max is
end tb_min_max;

architecture Behavioral of tb_min_max is
component min_max is
    port(a: in std_logic_vector(7 downto 0);
         b: in std_logic_vector(7 downto 0);
         en: in std_logic;
         min: out std_logic_vector(7 downto 0);
         max: out std_logic_vector(7 downto 0));
end component;
signal a, b: std_logic_vector(7 downto 0) := (others => '0');
signal min, max: std_logic_vector(7 downto 0);
constant Tclk: time := 20ns;
begin
    povezivanje: min_max port map(a => a, b => b, en => '1', min => min, max => max);
    stimulus: process is
    begin
    a <= "00110011";
    b <= "01010101";
    wait for Tclk;
    a <= "10101010";
    b <= "10011001";
    wait for Tclk;
    a <= "11001100";
    b <= "11001100";
    wait;
    end process;

end Behavioral;
