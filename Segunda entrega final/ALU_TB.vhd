
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 

 
ENTITY ALU_TB IS
END ALU_TB;
 
ARCHITECTURE behavior OF ALU_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALU
    PORT(
         CRS1 : IN  std_logic_vector(31 downto 0);
         CRS2 : IN  std_logic_vector(31 downto 0);
         OP : IN  std_logic_vector(5 downto 0);
         C : IN  std_logic;
         Result : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CRS1 : std_logic_vector(31 downto 0) := (others => '0');
   signal CRS2 : std_logic_vector(31 downto 0) := (others => '0');
   signal OP : std_logic_vector(5 downto 0) := (others => '0');
   signal C : std_logic := '0';

 	--Outputs
   signal Result : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALU PORT MAP (
          CRS1 => CRS1,
          CRS2 => CRS2,
          OP => OP,
          C => C,
          Result => Result
        );

   -- Stimulus process
   stim_proc: process
   begin		
		C <= '1';
      CRS1 <= "00000000000000000000000000000111";
		CRS2 <= "00000000000000000000000000000011";
		op <= "000000";--sumando
      wait for 50 ns;
		op <= "000001";
      wait for 50 ns;
		op <= "000010";
      wait for 50 ns;
		op <= "000011";
      wait for 50 ns;
		op <= "000100";
      wait for 50 ns;
		op <= "000101";
      wait for 50 ns;
		op <= "000110";
      wait for 50 ns;
		op <= "000111";
      wait for 50 ns;
		op <= "001000";
      wait for 50 ns;
		op <= "001001";
      wait for 50 ns;
		op <= "001100";
      wait for 50 ns;
		op <= "001101";
		
  

     
      wait;
   end process;

END;
