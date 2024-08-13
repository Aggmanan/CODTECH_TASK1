-- TESTBENCH FOR THE MAIN CODE OF FINITE STATE MACHINE 

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_sqdet1 is
end tb_sqdet1;

architecture test of tb_sqdet1 is

    -- Component declaration for the unit under test (UUT)
    component sqdet1
        port(
            din    : in std_logic;
            clk    : in std_logic;
            reset  : in std_logic;
            detect : out std_logic;
	    state  : out std_logic_vector(2 downto 0)
        );
    end component;

    -- Signals to connect to the UUT
    signal din    : std_logic := '0';
    signal clk    : std_logic := '0';
    signal reset  : std_logic := '0';
    signal detect : std_logic;
    signal state  : std_logic_vector(2 downto 0);

    -- Clock period definition
    constant clk_period : time := 10 ns;

begin

    -- Instantiate the Unit Under Test (UUT)
    uut: sqdet1
        port map (
            din    => din,
            clk    => clk,
            reset  => reset,
            detect => detect,
	    state => state
        );

    -- Clock process definitions
    clk_process :process
    begin
        clk <= '0';
        wait for clk_period / 2;
        clk <= '1';
        wait for clk_period / 2;
    end process;

    -- Stimulus process
    stim_proc: process
    begin
        -- Initialize Inputs
        reset <= '1';
        wait for clk_period*2;
        reset <= '0';
        wait for clk_period*2;
        
        -- Apply input sequence and observe detect signal
        din <= '1'; wait for clk_period;
        din <= '0'; wait for clk_period;
        din <= '1'; wait for clk_period;
        din <= '0'; wait for clk_period;
        
        din <= '1'; wait for clk_period;
        din <= '0'; wait for clk_period;
        din <= '1'; wait for clk_period;
        din <= '0'; wait for clk_period;
        
        din <= '1'; wait for clk_period;
        din <= '0'; wait for clk_period;

	reset <= '1';
        wait for clk_period*2;
        reset <= '0';
        wait for clk_period*2;

	din <= '1'; wait for clk_period;
        din <= '0'; wait for clk_period;
        din <= '1'; wait for clk_period;
        din <= '0'; wait for clk_period;
        
        din <= '1'; wait for clk_period;
        din <= '0'; wait for clk_period;
        din <= '1'; wait for clk_period;
        din <= '0'; wait for clk_period;
        
        din <= '1'; wait for clk_period;
        din <= '0'; wait for clk_period;
        
        -- End of test
        wait;
    end process;

end test;
