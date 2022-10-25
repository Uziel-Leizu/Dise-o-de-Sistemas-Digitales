library ieee;
use ieee.std_logic_1164.all;

entity Practica0 is
port(
	a,b,ref : in std_logic_vector(2 downto 0);
	sel : in std_logic;
	salida : out std_logic_vector(6 downto 0)
);
end Practica0;

architecture APractica0 of Practica0 is
signal sensor,condicion : std_logic_vector(2 downto 0);
	begin
		--mux
		sensor <= a when sel = '0' else b;
		--comparador
		condicion <= "001" when (sensor < ref) else
		"010" when (sensor = ref) else "100";
		--conv
		salida <= "0000111" when (condicion = "100") else
				   "0110001" when (condicion = "001") else
				   "0110111";
end APractica0;
