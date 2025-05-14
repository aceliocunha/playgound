LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY tb_knn_k3 IS
END tb_knn_k3;

ARCHITECTURE behavior OF tb_knn_k3 IS
    SIGNAL clk : STD_LOGIC := '0';
    SIGNAL sample : unsigned(7 DOWNTO 0) := (OTHERS => '0');
    SIGNAL class_out : STD_LOGIC;

    COMPONENT knn_k3
        PORT (
            clk : IN STD_LOGIC;
            sample : IN unsigned(7 DOWNTO 0);
            class_out : OUT STD_LOGIC
        );
    END COMPONENT;

BEGIN
    uut : knn_k3
    PORT MAP(
        clk => clk,
        sample => sample,
        class_out => class_out
    );
    clk_process : PROCESS
    BEGIN
        clk <= '0';
        WAIT FOR 5 ns;
        clk <= '1';
        WAIT FOR 5 ns;
    END PROCESS;
    stim_proc : PROCESS
    BEGIN
        WAIT FOR 20 ns;
        sample <= to_unsigned(20, 8); 
        WAIT FOR 20 ns;
        sample <= to_unsigned(45, 8); 
        WAIT FOR 20 ns;
        sample <= to_unsigned(90, 8);
        WAIT FOR 20 ns;
        sample <= to_unsigned(110, 8);
        WAIT FOR 40 ns;
        ASSERT false REPORT "SIMULATION FINISHED" SEVERITY note;
        WAIT;
    END PROCESS;

END behavior;
