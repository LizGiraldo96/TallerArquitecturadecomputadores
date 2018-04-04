--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:35:12 04/04/2018
-- Design Name:   
-- Module Name:   C:/Users/Liz/Desktop/TallerIse/Program_Counter/integracion_TB.vhd
-- Project Name:  Program_Counter
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: integracion
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
 
ENTITY integracion_TB IS
END integracion_TB;
 
ARCHITECTURE behavior OF integracion_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT integracion
    PORT(
         clock : IN  std_logic;
         reset : IN  std_logic;
         Resultado : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clock : std_logic := '0';
   signal reset : std_logic := '0';

 	--Outputs
   signal Resultado : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clock_period : time := 20 ns; --para impactar
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: integracion PORT MAP (
          clock => clock,
          reset => reset,
          Resultado => Resultado
        );

   -- Clock process definitions
   clock_process :process
   begin
		clock <= '0';
		wait for clock_period/2;
		clock <= '1';
		wait for clock_period/2;-- mitad del periodo se pone en cero
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 10 ns;-- ptimrt ciclo de subida
      reset<='1';
      		

      wait for 20 ns;
		reset<='0';

      -- insert stimulus here 

      wait;
   end process;

END;
