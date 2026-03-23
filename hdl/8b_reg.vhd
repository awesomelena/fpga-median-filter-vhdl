

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity reg8b is
    port(clk : in std_logic;
         data_in: in std_logic_vector(7 downto 0);
         data_out: out std_logic_vector(7 downto 0));
end reg8b;

architecture Behavioral of reg8b is

begin
    process(clk) is
    begin
        if(rising_edge(clk)) then
            data_out <= data_in;
        end if;
    end process;

end Behavioral;
