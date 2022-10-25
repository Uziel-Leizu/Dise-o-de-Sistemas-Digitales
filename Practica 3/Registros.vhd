library ieee;
use ieee.std_logic_1164.all;

entity PRegistros is port
{
	d : in std_logic_vector(6 downto 0);
	es, clk, clr : in std_logic;
	oper : in std_logic_vector(1 downto 0);
	q : out std_logic_vector(6 downto 0)
};
end PRegistros

architecture ARegistros of PRegistros is
begin
	process(clk, clr)
	begin
		if(clr = '1') then
			q <= "0000000";
		elsif (rising_edge(clk)) then
			if(oper="00") then --retencion
				q<=q;
			elsif(oper = "01") then --carga
				q <= d;
			elsif(oper = "10") then --corrimiento ala izquierda
				for i in 0 to 6 loop
					if(i > 0) then
						q(i)=q(i-1);
					end if;
				end loop;
			elsif(oper = "11") then --corrimiento a la derecha
				for i in 0 to 6 loop
					if(i < 5)then
						q(i) <= q(i+1);
					else
						q(i) <= es;
					end if
				end loop;
		end if
	end process;
end ARegistros;