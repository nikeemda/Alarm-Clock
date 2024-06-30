library ieee; 
use ieee.std_logic_signed.all;
use ieee.std_logic_1164.all;

entity DisplayCkt is
	port(Input: in std_logic_vector(3 downto 0); 
		SevenSeg : out std_logic_vector(6 downto 0)); 

end DisplayCkt;

Architecture behav_display of DisplayCkt is
begin
process (Input)
Begin
 case Input is
 	when"0000"=> SevenSeg <= "0000001"; -- 0 --change all these around
 	when"0001"=> SevenSeg <= "1001111"; -- 1
	when"0010"=> SevenSeg <= "0010010"; -- 2
	when"0011"=> SevenSeg <= "0000110"; -- 3
	when"0100"=> SevenSeg <= "1001100"; -- 4
	when"0101"=> SevenSeg <= "0100100"; -- 5
 	when"0110"=> SevenSeg <= "0100000"; -- 6
	when"0111"=> SevenSeg <= "0001111"; -- 7
	when"1000"=> SevenSeg <= "0000000"; -- 8
	when"1001"=> SevenSeg <= "0000100"; -- 9
	--when"1010"=> SevenSeg <= "0001000"; -- 10 A
 	--when"1011"=> SevenSeg <= "1100000"; -- 11 b
	--when"1100"=> SevenSeg <= "0110001"; -- 12 c
	--when"1101"=> SevenSeg <= "1000010"; -- 13 d
	--when"1110"=> SevenSeg <= "0110000"; -- 14 e
	--when"1111"=> SevenSeg <= "0111000"; -- 15 f
 	when others => SevenSeg <= "0000000";
end case;
end process;
end behav_display;
