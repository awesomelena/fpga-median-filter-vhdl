library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
Use STD.TEXTIO.all;
use IEEE.NUMERIC_STD.ALL;
entity tb_median_filter is 
end tb_median_filter;

architecture Behavioral of tb_median_filter is
component median_filter is
    port(
        clk : in std_logic;
        reset : in std_logic;
        izlaz: out std_logic_vector(7 downto 0)
    );
end component;
signal clk: std_logic := '0';
signal reset: std_logic := '0';
constant Tclk : time := 10 ns;
file my_output : TEXT open WRITE_MODE is "output_signal.txt"; 
signal Dout : std_logic_vector(7 downto 0);
signal output_ready : std_logic; 
signal counter : integer; 
begin
    reset <= '1', '0' after 21 ns; 
    clk_gen: clk <= not clk after Tclk/2;
    dut : median_filter port map(clk => clk, reset => reset, izlaz => Dout);
    
    process(clk) is
    begin
        if reset = '1' then
            counter <= 0;
        else
            if rising_edge(clk) then
                counter <= counter + 1;
                if (counter > 526 and counter < 65550 and counter mod 256 /= 15 and counter mod 256 /= 14) then
                    output_ready <= '1';
                else
                    output_ready <= '0';
                end if;
            end if;
        end if;
    
    end process;
    
    process(clk)  
        variable my_output_line : LINE;  
    begin  
        if falling_edge(clk) then
            if output_ready = '1' then   
                write(my_output_line, to_integer(unsigned(Dout)));  
                writeline(my_output,my_output_line);
            end if;  
        end if;  
    end process;

end Behavioral;