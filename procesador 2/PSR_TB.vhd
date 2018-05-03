LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY PSR_TB IS
END PSR_TB;
 
ARCHITECTURE behavior OF PSR_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT PSR
    PORT(
         cwp : IN  std_logic;
         nzvcin : IN  std_logic_vector(3 downto 0);
         reset : IN  std_logic;
         clk : IN  std_logic;
         cout : OUT  std_logic;
         ncwp : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal cwp : std_logic := '0';
   signal nzvcin : std_logic_vector(3 downto 0) := (others => '0');
   signal reset : std_logic := '0';
   signal clk : std_logic := '0';

 	--Outputs
   signal cout : std_logic;
   signal ncwp : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: PSR PORT MAP (
          cwp => cwp,
          nzvcin => nzvcin,
          reset => reset,
          clk => clk,
          cout => cout,
          ncwp => ncwp
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      reset <= '1';
      wait for 100 ns;	
		reset <= '0';
		wait for 100 ns;
		cwp <= '0';
		nzvcin <= "1001";
      wait for clk_period*10;
		cwp <= '1';
		nzvcin <= "1010";

      -- insert stimulus here 

      wait;
   end process;

END;