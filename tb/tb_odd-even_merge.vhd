
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity tb_odd_even_merge is
end tb_odd_even_merge;

architecture Behavioral of tb_odd_even_merge is
component odd_even_merge is
    port(clk: in std_logic;
         a0: in std_logic_vector(7 downto 0);
         a1: in std_logic_vector(7 downto 0);
         a2: in std_logic_vector(7 downto 0);
         a3: in std_logic_vector(7 downto 0);
         a4: in std_logic_vector(7 downto 0);
         a5: in std_logic_vector(7 downto 0);
         a6: in std_logic_vector(7 downto 0);
         a7: in std_logic_vector(7 downto 0);
         a8: in std_logic_vector(7 downto 0);
         med: out std_logic_vector(7 downto 0));
end component;
signal med: std_logic_vector(7 downto 0);
signal clk: std_logic := '1';
signal a0, a1, a2, a3, a4, a5, a6, a7, a8: std_logic_vector(7 downto 0);
constant Tclk: time := 10ns;
begin
    clk_gen: clk <= not clk after Tclk/2;
    dut: odd_even_merge port map(clk => clk, a0 =>a0, a1=>a1, a2=>a2, a3=>a3, a4=>a4, a5=>a5, a6=>a6, a7=>a7, a8=>a8, med => med);
    stimulus: process is
    begin
        wait for 0.14*Tclk;
        a0 <= "01010010";
        a1 <= "10100010";
        a2 <= "11001100";
        a3 <= "10011111";
        a4 <= "00111100";
        a5 <= "10100011";
        a6 <= "11100011";
        a7 <= "01110001";
        a8 <= "10010101";
        wait for 3.11*Tclk;
        a0 <= "10010010";
        a1 <= "01100010";
        a2 <= "00101100";
        a3 <= "01011111";
        a4 <= "00011100";
        a5 <= "10000011";
        a6 <= "10100011";
        a7 <= "10110001";
        a8 <= "00110101";
    
    
    
    
    
    
        wait;
    end process;

end Behavioral;
