library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity top_level is
 Port (  clk     : in std_logic;
         rst     : in std_logic;
         output_p : out STD_LOGIC_VECTOR (15 downto 0));
end top_level;

architecture Behavioral of top_level is
COMPONENT blk_mem_gen_0
  PORT (
    clka : IN STD_LOGIC;
    ena : IN STD_LOGIC;
    wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    addra : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
    dina : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    clkb : IN STD_LOGIC;
    enb : IN STD_LOGIC;
    web : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    addrb : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
    dinb : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    doutb : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
  );
END COMPONENT;

component shift_right_mult is
    Port ( a : in STD_LOGIC_VECTOR (7 downto 0);
           x : in STD_LOGIC_VECTOR (7 downto 0);
           p : out STD_LOGIC_VECTOR (15 downto 0));
end component;

signal clka, ena, clkb,  enb : STD_LOGIC;
signal wea, web : STD_LOGIC_VECTOR(0 DOWNTO 0);
signal dina, douta, dinb, doutb, a, x : STD_LOGIC_VECTOR(7 DOWNTO 0);
signal addra, addrb : STD_LOGIC_VECTOR(10 DOWNTO 0);
signal p : STD_LOGIC_VECTOR (15 downto 0);

signal index : integer := 0;
signal rega : integer := 0;
signal regb : integer := 0;

begin

bram : blk_mem_gen_0
  PORT MAP (
    clka => clk,
    ena => ena,
    wea => wea,
    addra => addra,
    dina => dina,
    douta => douta,
    clkb => clk,
    enb => enb,
    web => web,
    addrb => addrb,
    dinb => dinb,
    doutb => doutb
  );
  
ena <= '1';
enb <= '1';
wea <= "0";
web <= "0"; 

addra <= std_logic_vector(to_unsigned(index, addra'length));
addrb <= std_logic_vector(to_unsigned(783 + index, addrb'length));

srm: shift_right_mult 
    Port map( 
        a => a,
        x => x,
        p => p
    );

process(clk)
begin
if rising_edge(clk) then
    if index < 782 then
        index <= index+1;
    end if;
end if;
end process;

process(clk)
begin
    if rising_edge(clk) then
        rega <= to_integer(unsigned(douta));
        regb <= to_integer(unsigned(doutb));
    end if;
end process;

a <= std_logic_vector(to_unsigned(rega, a'length));
x <= std_logic_vector(to_unsigned(regb, x'length));

output_p <= p;

end Behavioral;
