------- ROM creada automaticamente por ppm2rom -----------
------- Felipe Machado -----------------------------------
------- Departamento de Tecnologia Electronica -----------
------- Universidad Rey Juan Carlos ----------------------
------- http://gtebim.es ---------------------------------
----------------------------------------------------------
--------Datos de la imagen -------------------------------
--- Fichero original    : pacman10x10.pgm 
--- Filas    : 10 
--- Columnas : 10 
--- Color    :  8 bits



------ Puertos -------------------------------------------
-- Entradas ----------------------------------------------
--    clk  :  senal de reloj
--    addr :  direccion de la memoria
-- Salidas  ----------------------------------------------
--    dout :  dato de 8 bits de la direccion addr (un ciclo despues)


library IEEE;
  use IEEE.STD_LOGIC_1164.ALL;
  use IEEE.NUMERIC_STD.ALL;


entity ROM8b_pacman10x10 is
  port (
    clk  : in  std_logic;   -- reloj
    addr : in  std_logic_vector(7-1 downto 0);
    dout : out std_logic_vector(8-1 downto 0) 
  );
end ROM8b_pacman10x10;


architecture BEHAVIORAL of ROM8b_pacman10x10 is
  signal addr_int  : natural range 0 to 2**7-1;
  type memostruct is array (natural range<>) of std_logic_vector(8-1 downto 0);
  constant FilaImg : memostruct := (
   "00000111", "00001000", "01001011", "10011110", "11011011", "11100111", "11000010",
   "01111111", "00011101", "00001001", "00001000", "01111101", "11010100", "11101010",
   "11011110", "11001111", "11100110", "11101000", "10111010", "00111101", "01000110",
   "11010110", "11101011", "11101000", "11100111", "11100100", "11101011", "11100100",
   "11110010", "10111001", "10100111", "11101011", "11100011", "11010011", "11100111",
   "11101001", "11100100", "11000000", "01010010", "00010110", "11011111", "11100010",
   "11100011", "11100011", "11100101", "11000010", "01101010", "00100010", "00011110",
   "00000011", "11100011", "11010111", "11100000", "11100011", "11100111", "11000111",
   "01011010", "00001101", "00000101", "00000100", "10101010", "11101001", "11101000",
   "11011100", "11100101", "11100111", "11100000", "11011100", "01110111", "00011001",
   "01001000", "11100011", "11101000", "11010111", "11100110", "11100101", "11100111",
   "11011110", "11011111", "10111001", "00001000", "01100111", "11011000", "11101010",
   "11010110", "11011001", "11101001", "11011101", "10111100", "00111001", "00000101",
   "00010100", "01001001", "10011110", "11010010", "11100101", "11001101", "01110110",
   "00110011", "00000111");
begin

  addr_int <= TO_INTEGER(unsigned(addr));

  P_ROM: process (clk)
  begin
    if clk'event and clk='1' then
      dout <= FilaImg(addr_int);
    end if;
  end process;

end BEHAVIORAL;

