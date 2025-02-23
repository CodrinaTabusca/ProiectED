library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.NUMERIC_STD.all;
-----------------------------------------------
---------- ALU 2-bit VHDL ---------------------
-----------------------------------------------
entity ALU is
  
  
    Port (
    A, B     : in  STD_LOGIC_VECTOR(1 downto 0);  -- 2 inputs 2-bit
    ALU_Sel  : in  STD_LOGIC_VECTOR(1 downto 0);  -- 1 input 4-bit for selecting function
    
    LED_out : out STD_LOGIC_VECTOR (6 downto 0);
    an : out std_logic_vector(2 downto 0)      
    );
end ALU; 
architecture Behavioral of ALU is

signal ALU_Result : std_logic_vector (3 downto 0);
signal aa : std_logic_vector (3 downto 0);
signal bb : std_logic_vector (3 downto 0);
begin
an(0)<= '1';
an(1)<= '1';
an(2)<= '1';
   process(A,B,ALU_Sel)
 begin
 aa <= ("00") & (A);
 bb <= ("00") & (B);
  case(ALU_Sel) is
  when "00" => -- Addition
   ALU_Result <= (aa + bb) ; 
  when "01" => -- Subtraction
   ALU_Result <=   (aa - bb) ;
  when "10" => -- Multiplication
   ALU_Result <= (std_logic_vector(to_unsigned((to_integer(unsigned(aa)) * to_integer(unsigned(bb))),4))) ;
  when "11" => -- Division
   ALU_Result <= (std_logic_vector(to_unsigned(to_integer(unsigned(aa)) / to_integer(unsigned(bb)),4))) ;
  
   
  end case;
 end process;
  -- ALU out
 process(ALU_Result)
 begin
     case ALU_Result is
     when "0000" => LED_out <= "1000000"; -- "0"     
     when "0001" => LED_out <= "1111001"; -- "1" 
     when "0010" => LED_out <= "0100100"; -- "2" 
     when "0011" => LED_out <= "0110000"; -- "3" 
     when "0100" => LED_out <= "0011001"; -- "4" 
     when "0101" => LED_out <= "0010010"; -- "5" 
     when "0110" => LED_out <= "0000010"; -- "6" 
     when "0111" => LED_out <= "1111000"; -- "7" 
     when "1000" => LED_out <= "0000000"; -- "8"     
     when "1001" => LED_out <= "0010000"; -- "9"
     when others => LED_out <= "1111111";
     
     end case;
     end process;
end Behavioral;