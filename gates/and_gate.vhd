LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY and_gate IS
    PORT (
        a, b : IN STD_LOGIC;
        y : OUT STD_LOGIC

    );
END ENTITY and_gate;

ARCHITECTURE rtl OF and_gate IS
BEGIN
    y <= a AND b;
END rtl;
