LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY pr IS
  PORT (a, b, c : IN BIT;
  x, y : OUT BIT);
END pr;

ARCHITECTURE teste OF pr IS
BEGIN
 x <= a AND b;
 y <= c OR b;
END teste;