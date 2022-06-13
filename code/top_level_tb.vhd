library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity top_level_tb is
--  Port ( );
end top_level_tb;

architecture Behavioral of top_level_tb is
component top_level is
 Port (  clk     : in std_logic;
         rst     : in std_logic;
         output_p : out STD_LOGIC_VECTOR (15 downto 0));
end component top_level;

signal clk_tb, rst_tb : std_logic;
signal output_p_tb : STD_LOGIC_VECTOR (15 downto 0);

begin
UUT: top_level port map (clk => clk_tb, rst => rst_tb, output_p => output_p_tb);

process begin
clk_tb <= '1';
wait for 10ns;
clk_tb <= '0';
wait for 10ns;
end process;

process begin
rst_tb <= '1';
wait for 20ns;
rst_tb <= '0';
wait;
end process;

end Behavioral;
