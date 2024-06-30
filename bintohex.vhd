library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.std_logic_arith.all;
use IEEE.STD_LOGIC_unsigned.all;

entity bintohex is 
	port( input : in INTEGER;
		outmsd: out std_logic_vector (3 downto 0);
		outlsd: out std_logic_vector (3 downto 0)
		);
end bintohex;

architecture behav of bintohex is 
	signal input_int: integer := 0;
	signal msd: integer := 0;
	signal lsd: integer := 0;
	signal msdout: std_logic_vector (3 downto 0);
	signal lsdout: std_logic_vector (3 downto 0);
	signal ten: integer := 10;
begin
	process(input, input_int, msd, lsd)
	begin
		input_int <= input;
		msd <= input_int / ten ;
		lsd <= input_int - (msd * ten);
		msdout <= conv_std_logic_vector (msd, 4);
		lsdout <= conv_std_logic_vector (lsd, 4);
		
	end process;
	
	outmsd <= msdout;
	outlsd <= lsdout;

end behav;
