
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Program_Counter is
    Port ( clock : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           input : in  STD_LOGIC_VECTOR (31 downto 0);
           output : out  STD_LOGIC_VECTOR (31 downto 0));
end Program_Counter;

architecture Behavioral of Program_Counter is

begin
process (clock,reset,input)
begin

   if reset='1' then
      output <= "00000000000000000000000000000000";
   elsif rising_edge(clock) then
      output <= input;
   end if;

end process;


end Behavioral;

