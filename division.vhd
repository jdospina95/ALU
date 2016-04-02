library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.ALL;

package divisionp is
	function division ( entA , entB : UNSIGNED ) return UNSIGNED ;
end;

package body divisionp is
	function  division( entA : UNSIGNED ; entB : unsigned ) return UNSIGNED is
		variable resl : unsigned(entA'length-1 downto 0):=entA;
		variable b1 : unsigned(entB'length-1 downto 0);
		variable p1 : unsigned(entB'length downto 0):= (others => '0');
		variable i : integer:=0;
	begin
	 b1:= entB;
	for i in 0 to entB'length-1 loop
		p1(entB'length-1 downto 1) := p1(entB'length-2 downto 0);
		p1(0) := resl(entA'length-1);
		resl(entA'length-1 downto 1) := resl(entA'length-2 downto 0);
		p1 := p1-b1;
	if(p1(entB'length-1) ='1') then
		resl(0) :='0';
		p1 := p1+b1;
	else
		resl(0) :='1';
	end if;
	end loop;
	return resl;
end division;
end divisionp;
