library ieee;
use ieee.std_logic_1164.all;

entity db_contador is
end db_contador;

architecture sim of db_contador is
  signal clk : std_logic := '0';
  signal leds : std_logic_vector(3 downto 0);
  signal ovf : std_logic;
begin
uut: entity work.contador
 port map (
  clk_50MHz => clk,
  leds_bin => leds,
  led_max => ovf
);

  clk_process: process
  begin
    clk <= '0';
    wait for 10 ns;
    clk <= '1';
    wait for 10 ns;
  end process;
end sim;