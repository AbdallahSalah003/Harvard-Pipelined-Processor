library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ALU_tb is
-- Testbench has no ports
end ALU_tb;

architecture Behavioral of ALU_tb is
    -- Component declaration for ALU
    component ALU
        Port (
            A         : in signed(15 downto 0);
            B         : in signed(15 downto 0);
            op        : in std_logic_vector(2 downto 0);
            result    : out std_logic_vector(15 downto 0);
            carry_out : out std_logic;
            zero_out  : out std_logic;
            neg_out   : out std_logic
        );
    end component;

    -- Testbench signals
    signal A         : signed(15 downto 0) := (others => '0');
    signal B         : signed(15 downto 0) := (others => '0');
    signal op        : std_logic_vector(2 downto 0) := "000";
    signal result    : std_logic_vector(15 downto 0);
    signal carry_out : std_logic;
    signal zero_out  : std_logic;
    signal neg_out   : std_logic;

    -- Clock generation process
    constant CLK_PERIOD : time := 100 ps;
begin
    -- Instantiate the ALU
    uut: ALU
        port map (
            A         => A,
            B         => B,
            op        => op,
            result    => result,
            carry_out => carry_out,
            zero_out  => zero_out,
            neg_out   => neg_out
        );

    -- Stimulus process
    stimulus_process: process
    begin
        -- Test Case 1: Pass A (op = "000")
        A <= to_signed(10, 16);
        B <= to_signed(-5, 16);
        op <= "000";
        wait for CLK_PERIOD;

        -- Test Case 2: Pass B (op = "001")
        op <= "001";
        wait for CLK_PERIOD;

        -- Test Case 3: Add A + B (op = "010")
        op <= "010";
        wait for CLK_PERIOD;

        -- Test Case 4: Subtract A - B (op = "011")
        op <= "011";
        wait for CLK_PERIOD;

        -- Test Case 5: Bitwise AND (op = "100")
        op <= "100";
        wait for CLK_PERIOD;

        -- Test Case 6: Pass A again (op = "101")
        op <= "101";
        wait for CLK_PERIOD;

        -- Test Case 7: NOT A (op = "110")
        op <= "110";
        wait for CLK_PERIOD;

        -- Test Case 8: Increment A (op = "111")
        op <= "111";
        wait for CLK_PERIOD;

        -- Additional edge case: Zero result
        A <= to_signed(0, 16);
        B <= to_signed(0, 16);
        op <= "010"; -- ADD
        wait for CLK_PERIOD;

        -- Additional edge case: Negative result
        A <= to_signed(-32768, 16);
        B <= to_signed(1, 16);
        op <= "011"; -- SUB
        wait for CLK_PERIOD;

        -- Stop simulation
        wait;
    end process;

end Behavioral;
