----------------------------------------------------------------------------------
-- Company: Universidad Complutense de Madrid
-- Engineer: Hortensia Mecha
-- 
-- Design Name: divisor 
-- Module Name:    divisor - divisor_arch 
-- Project Name: 
-- Target Devices: 
-- Description: Creaci�n de un reloj de 1Hz a partir de
--		un clk de 100 MHz
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
USE IEEE.std_logic_unsigned.ALL;

entity divisor_pantalla is
    port (
        reset: in STD_LOGIC;
        clk_entrada: in STD_LOGIC; -- reloj de entrada de la entity superior
        clk_salida: out STD_LOGIC -- reloj que se utiliza en los process del programa principal
    );
end divisor_pantalla;

architecture divisor_arch of divisor_pantalla is
 SIGNAL cuenta, division: std_logic_vector(20 downto 0);
 SIGNAL clk_aux, clk: std_logic;
 signal aumentar: std_logic_vector(2 downto 0);

  begin

clk <= clk_entrada; 
clk_salida <= clk_aux;
  contador:
  PROCESS(reset, clk)
  BEGIN
    IF (reset = '1') THEN
      cuenta <= (OTHERS=>'0');
		division <= "000111111111111111111";
		aumentar <= "000";
		
    ELSIF(clk'EVENT AND clk = '1') THEN
      IF (cuenta = division) THEN 
			clk_aux <= not clk_aux;
			cuenta <= (OTHERS=>'0');
			aumentar <= aumentar + 1;
			if aumentar = 7 then
				division <= division - 100;
			end if;
			
      ELSE
        cuenta <= cuenta + '1';
      END IF;
    END IF;
  END PROCESS contador;

end divisor_arch;
