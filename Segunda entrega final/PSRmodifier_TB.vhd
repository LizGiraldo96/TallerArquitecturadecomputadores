--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   00:04:43 05/03/2018
-- Design Name:   
-- Module Name:   C:/Users/EQUIPO/Documents/UTP/Arquitectura/Procesador 2/PSRmodifier/PSRmodifier_TB.vhd
-- Project Name:  PSRmodifier
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: PSRmodifier
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY PSRmodifier_TB IS
END PSRmodifier_TB;
 
ARCHITECTURE behavior OF PSRmodifier_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT PSRmodifier
    PORT(
         ALUout : IN  std_logic_vector(31 downto 0);
         ALUop : IN  std_logic_vector(5 downto 0);
         CRS1 : IN  std_logic_vector(31 downto 0);
         MUXout : IN  std_logic_vector(31 downto 0);
         PSRout : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal ALUout : std_logic_vector(31 downto 0) := (others => '0');
   signal ALUop : std_logic_vector(5 downto 0) := (others => '0');
   signal CRS1 : std_logic_vector(31 downto 0) := (others => '0');
   signal MUXout : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal PSRout : std_logic_vector(3 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: PSRmodifier PORT MAP (
          ALUout => ALUout,
          ALUop => ALUop,
          CRS1 => CRS1,
          MUXout => MUXout,
          PSRout => PSRout
        );

 
   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		wait for 100 ns;
		ALUop <= "000001";
		CRS1 <="00000000000000000000000000000000";
		MUXout <="00000000000000000000000000000000";
		wait for 100 ns;
		ALUop <= "000001";
		CRS1 <="10000000000000000000000000000000";
		MUXout <="10000000000000000000000000000000";
      wait for 100 ns;
		ALUop <= "000010";
		CRS1 <="10000000000000000000000000000000";
		MUXout <="00000000000000000000000000000000";
		ALUout <="00000000000000000000000000000000";
      wait for 100 ns;
		ALUop <= "000111";
		CRS1 <="00000000000000000000000000000000";
		MUXout <="10000000000000000000000000000000";
      wait for 100 ns;
		ALUop <= "000111";
		CRS1 <="00000000000000000000000000000000";
		MUXout <="00000000000000000000000000000000";
      wait for 100 ns;
		ALUop <= "000101";
		CRS1 <="00000000000000000000000000000000";
		MUXout <="00000000000000000000000000000000";
		ALUout <="10000000000000000000000000000000";

      wait;
   end process;

END;
