LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY InstructionMemory IS
    PORT (
        addr : IN STD_LOGIC_VECTOR(11 DOWNTO 0); -- 12-bit address input (4K = 2^12)
        data_out : OUT STD_LOGIC_VECTOR(15 DOWNTO 0) -- 16-bit data output
    );
END InstructionMemory;

ARCHITECTURE Behavioral OF InstructionMemory IS

    -- Memory declaration: 4K locations of 16 bits each
    TYPE memory_array IS ARRAY (0 TO 4095) OF STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL memory : memory_array := (
        0 => "0111000000000001", -- INT 2
        1 => "0000000000001000", -- Example instruction 1 IMM
        2 => "1010000000000000", -- Example instruction 2 INT 5
        3 => "0000000000000101", -- Example instruction 3 IMM
        4 => "1010000000000000", -- Example instruction 4 JMP R1 
        5 => "1010100000000000", -- Example instruction 5 CALL R1
        6 => "1100000000000000", -- Example instruction RTI
        7 => "0110000000000000", -- Example instruction 7 PUSH R1
        8 => "0110100001000000", -- Example instruction 8 POP R3
        OTHERS => (OTHERS => '0') -- Initialize remaining locations to 0
    );
BEGIN
    data_out <= memory(to_integer(unsigned(addr)));
END Behavioral;