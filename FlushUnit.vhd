LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY FlushUnit IS
    PORT (
        -- Inputs
        clk : IN STD_LOGIC; -- Clock signal
        branch : IN STD_LOGIC; -- branching exist or not
        stage : IN STD_LOGIC; -- branching stage 0=Excute, 1=Memory
        -- Outputs
        flush_if_id : OUT STD_LOGIC; -- Reset FetchDecode Register
        flush_id_ie : OUT STD_LOGIC; -- Reset DecodeExcute Register
        flush_ie_mem : OUT STD_LOGIC -- Reset ExcuteMemory Register
    );
END FlushUnit;

ARCHITECTURE Combinational OF FlushUnit IS
BEGIN
    process (clk) begin
        if rising_edge(clk) then
            if branch = '1' then
                flush_if_id <= '1';
                flush_id_ie <= '1';
                if stage = '1' then
                    flush_ie_mem <= '1';
                end if;
            else
                flush_if_id <= '0';
                flush_id_ie <= '0';
                flush_ie_mem <= '0';
            end if;
        end if;
    end process;
END Combinational;