library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
library work;
use work.RAM_definitions_PK.all;

entity median_filter is
    port(
        clk : in std_logic;
        reset: in std_logic;
        izlaz : out std_logic_vector(7 downto 0)
    );
end median_filter;

architecture Behavioral of median_filter is
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
    
    component line_buffer is
        port (
        clk      : in std_logic;
        in_data  : in std_logic_vector(7 downto 0);
        out_data : out std_logic_vector(7 downto 0)
    );
    end component;
    
    signal counter : integer;
    
    type ram_type is array (0 to 256*256-1) of std_logic_vector (7 downto 0);
    signal ram_data : std_logic_vector(7 downto 0) ;
    signal a0, a1, a2, a3, a4, a5, a6, a7, a8 : std_logic_vector(7 downto 0);
    signal median : std_logic_vector(7 downto 0);
    signal addra : std_logic_vector(15 downto 0);
    signal addrb : std_logic_vector(15 downto 0);
    signal wea : std_logic;
    signal doutb : std_logic_vector(7 downto 0);
    
    
begin
 
    ODD_EVEN_MERGE_CONNECTION : odd_even_merge port map (clk => clk, a0 => a0, a1 => a1, a2 => a2, a3 => a3, a4 => a4, a5 => a5, a6 => a6, a7 => a7, a8 => a8, med => median);
    IM_RAM_CONNECTION : im_ram generic map (G_RAM_DEPTH => 256*256, G_RAM_WIDTH => 8, G_RAM_PERFORMANCE => "HIGH_PERFORMANCE") port map (addra => addra, addrb => addrb, wea => wea, doutb => doutb, dina => median, clk => clk, enb => '1', rstb => '0', regceb => '1');
    LINE_BUFFER_CONNECTION_1: line_buffer port map (clk => clk, in_data=>a2, out_data => a3);
    LINE_BUFFER_CONNECTION_2: line_buffer port map (clk => clk, in_data=>a5, out_data => a6);
    
    SHIFT_PROC: process(clk) is
    begin
        if rising_edge(clk) then
            if(reset = '0') then
                counter <= counter + 1;
                a0 <= doutb;
                a1 <= a0;
                a2 <= a1;
                a4 <= a3;
                a5 <= a4;
                a7 <= a6;
                a8 <= a7;
            else 
                counter <= 0;
            end if;
        end if;
    end process SHIFT_PROC;
    
    WRITE_PROC : process(clk) is
    begin
        if rising_edge(clk) then
            if (counter > 526 and counter < 65550 and counter mod 256 /= 15 and counter mod 256 /= 14) then
                wea <= '1';
                izlaz <= median;
                addra <= std_logic_vector(to_unsigned((counter - 269), 16));
            else
                wea <= '0';
            end if;
        end if;
    end process WRITE_PROC;
    
    addrb <= std_logic_vector(to_unsigned(counter, 16));
    
end Behavioral;
