library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity voting25 is
    port (
        votes  : in  STD_LOGIC_VECTOR(24 downto 0);
        passed : out STD_LOGIC
    );
end voting25;

architecture Behavioral of voting25 is
begin
    process(votes)
        variable count : integer range 0 to 25;
    begin
        count := 0;

        for i in votes'range loop
            if votes(i) = '1' then
                count := count + 1;
            end if;
        end loop;

        if count >= 13 then
            passed <= '1';
        else
            passed <= '0';
        end if;
    end process;
end Behavioral;