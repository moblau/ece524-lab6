library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity shift_right_mult_tb is
--  Port ( );
end shift_right_mult_tb;

architecture Behavioral of shift_right_mult_tb is

component shift_right_mult is
    Port ( a : in STD_LOGIC_VECTOR (7 downto 0);
           x : in STD_LOGIC_VECTOR (7 downto 0);
           p : out STD_LOGIC_VECTOR (15 downto 0));
end component shift_right_mult;

signal a_tb: std_logic_vector (7 downto 0);
signal x_tb: std_logic_vector (7 downto 0);
signal p_tb: std_logic_vector (15 downto 0);

begin

UUT: shift_right_mult port map (a => a_tb, x => x_tb, p => p_tb);

process
begin
    a_tb <= "00001010";
    x_tb <= "00001011";
    wait for 10 ns;
    a_tb <= "00000111";
    x_tb <= "00001111";
    wait for 10 ns;
    a_tb <= "00001100";
    x_tb <= "00000011";
    wait for 10 ns;
    a_tb <= "00001101";
    x_tb <= "00001011";
wait;
end process;

end Behavioral;
