library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_unsigned.all;

entity clockdiv is 
	port(
		orig_clk : in STD_LOGIC;
		new_clk : out std_logic
		);
end clockdiv;

architecture behav of clockdiv is 
	signal count: integer:= 0;
	
begin
	process(orig_clk, count)
	begin

		if (orig_clk'event and orig_clk ='1') then
				count <= count+ 1;
		
		if (count = 2) then
				count <= 0;
		end if;
		end if;
	
	end process;
	
	new_clk <= '0' when (count = 1) else '1' ;

end behav;

