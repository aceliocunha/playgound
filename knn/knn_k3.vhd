library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity knn_k3 is
    port (
        clk : in std_logic;
        sample : in unsigned(7 downto 0);
        class_out : out std_logic
    );
end knn_k3;

architecture rtl of knn_k3 is

    type data_array is array(0 to 4) of unsigned(7 downto 0);
    type class_array is array(0 to 4) of std_logic;

    constant x : data_array := (
        to_unsigned(10, 8), -- classe 0
        to_unsigned(30, 8), -- classe 0
        to_unsigned(60, 8), -- classe 1
        to_unsigned(100, 8), -- classe 1
        to_unsigned(110, 8) -- classe 1
    );

    constant c : class_array := (
        '0', '0', '1', '1', '1'
    );

    signal dist : array(0 to 4) of integer;
    signal vote_0, vote_1 : integer := 0;
begin

    process(clk)
    variable temp_d : array(0 to 4) of integer;
    variable idx : integer_vector(0 to 4) := (0,1,2,3,4);
    variable sorted : integer_vector(0 to 4);
    variable temp_c : std_logic_vector(0 to 4);
    begin
        if rising_edge(clk) then

            for i in 0 to 4 loop
                temp_d(i) := abs(to_integer(sample) - to_integer(x(i)));
                temp_c(i) := c(i);
            end loop;


            for i in 0 to 3 loop
                for j in 0 to 3 - i loop
                    if temp_d(j) > temp_d(j+1) then

                        variable tmpd : integer;
                        tmpd := temp_d(j);
                        temp_d(j) := temp_d(j+1);
                        temp_d(j+1) := tmpd;

                        variable tmpc : std_logic;
                        tmpc := temp_c(j);
                        temp_c(j) := temp_c(j+1);
                        temp_c(j+1) := tmpc;
                    end if;
                end loop;
            end loop;


            vote_0 <= 0;
            vote_1 <= 0;

            for i in 0 to 2 loop
                if temp_c(i) = '0' then
                    vote_0 <= vote_0 + 1;
                else
                    vote_1 <= vote_1 + 1;
                end if;
            end loop;


            if vote_0 > vote_1 then
                class_out <= '0';
            else
                class_out <= '1';
            end if;
        end if;
    end process;

end rtl;