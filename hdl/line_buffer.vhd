library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity line_buffer is
    port (
        clk      : in std_logic;
        in_data  : in std_logic_vector(7 downto 0);
        out_data : out std_logic_vector(7 downto 0)
    );
end line_buffer;

architecture Behavioral of line_buffer is
    type ram_type is array (0 to 252) of std_logic_vector (7 downto 0);
    signal data : ram_type := (others => (others => '0'));
begin
    process(clk) is
    begin
        if rising_edge(clk) then
            data(0) <= in_data;
            data(1 to 252) <= data(0 to 251);
            out_data <= data(252);
        end if;
    end process;

end Behavioral;
