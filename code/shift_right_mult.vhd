library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity shift_right_mult is
    Port ( a : in STD_LOGIC_VECTOR (7 downto 0);
           x : in STD_LOGIC_VECTOR (7 downto 0);
           p : out STD_LOGIC_VECTOR (15 downto 0));
end shift_right_mult;

architecture Behavioral of shift_right_mult is

signal x0a: std_logic_vector(7 downto 0);
signal x1a: std_logic_vector(8 downto 0);
signal x2a: std_logic_vector(9 downto 0);
signal x3a: std_logic_vector(10 downto 0);
signal x4a: std_logic_vector(11 downto 0);
signal x5a: std_logic_vector(12 downto 0);
signal x6a: std_logic_vector(13 downto 0);
signal x7a: std_logic_vector(14 downto 0);

signal p1: std_logic_vector(8 downto 0);
signal p2: std_logic_vector(9 downto 0);
signal p3: std_logic_vector(10 downto 0);
signal p4: std_logic_vector(11 downto 0);
signal p5: std_logic_vector(12 downto 0);
signal p6: std_logic_vector(13 downto 0);
signal p7: std_logic_vector(14 downto 0);
signal p8: std_logic_vector(15 downto 0);

begin

x0a <= (a AND (7 downto 0 => x(0)));
x1a <= (a AND (7 downto 0 => x(1))) & '0';
x2a <= (a AND (7 downto 0 => x(2))) & "00";
x3a <= (a AND (7 downto 0 => x(3))) & "000";
x4a <= (a AND (7 downto 0 => x(4))) & "0000";
x5a <= (a AND (7 downto 0 => x(5))) & "00000";
x6a <= (a AND (7 downto 0 => x(6))) & "000000";
x7a <= (a AND (7 downto 0 => x(7))) & "0000000";

p1 <= '0' & x0a;
p2 <= '0' & (p1 + x1a);
p3 <= '0' & (p2 + x2a);
p4 <= '0' & (p3 + x3a);
p5 <= '0' & (p4 + x4a);
p6 <= '0' & (p5 + x5a);
p7 <= '0' & (p6 + x6a);
p8 <= '0' & (p7 + x7a);

p <= p8;

end Behavioral;
