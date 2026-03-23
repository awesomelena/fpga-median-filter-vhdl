
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity min_max is
    port(a: in std_logic_vector(7 downto 0);
         b: in std_logic_vector(7 downto 0);
         min: out std_logic_vector(7 downto 0);
         max: out std_logic_vector(7 downto 0));
end min_max;

architecture Behavioral of min_max is

begin
    process(a, b) is
    begin
   
        if(a > b) then
            max <= a;
            min <= b;
        else
            max <= b;
            min <= a;
        end if;  
    end process;
end Behavioral;
