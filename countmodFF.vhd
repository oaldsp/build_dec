library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;
 
entity contadorFF is
	port(
	clk , RSTN : in std_logic;
	Q : out std_logic_vector (7 downto 0)
	);
end contadorFF;

architecture contadorFF_arch of contadorFF is
--COMPONENT--
	component jkff is
		port (
		clk , J , K , PRN ,CLRN : in std_logic;
		Q : out std_logic
		);
	end component;
--COMPONENT--END--

--SIGNAL--
	signal Q_s , J_s , K_s , PRN_s , CLRN_s: std_logic_vector (7 downto 0);
	signal clk_s  , rstn_s : std_logic;
--SIGNAL--END--

--BEGIN--
	begin
	gen00: for i in 0 to 7 generate
	ffi0: jkff port map (
		clk=>clk_s , J=>J_s(i) , K=>K_s(i) , PRN=>PRN_s(i) , CLRN=>CLRN_s(i) ,
		Q=>Q_s(i)
		);
		PRN_s(i) <= '1';  
		CLRN_s(i) <= rstn_s;
		
	end generate;
	
	K_s(0)<= '1';
	J_s(0)<= '1';
	K_s(1)<=Q_s(0);
	J_s(1)<=Q_s(0);
	K_s(2)<=(Q_s(1) and Q_s(0));
	J_S(2)<=(Q_s(1) and Q_s(0));
	K_s(3)<=(Q_s(2) and Q_s(1) and Q_s(0));
	J_s(3)<=(Q_s(2) and Q_s(1) and Q_s(0));
	K_s(4)<=(Q_s(3) and Q_s(2) and Q_s(1) and Q_s(0));
	J_s(4)<=(Q_s(3) and Q_s(2) and Q_s(1) and Q_s(0));
	K_s(5)<=(Q_s(4) and Q_s(3) and Q_s(2) and Q_s(1) and Q_s(0));
	J_s(5)<=(Q_s(4) and Q_s(3) and Q_s(2) and Q_s(1) and Q_s(0));
	K_s(6)<=(Q_s(5) and Q_s(4) and Q_s(3) and Q_s(2) and Q_s(1) and Q_s(0));
	J_s(6)<=(Q_s(5) and Q_s(4) and Q_s(3) and Q_s(2) and Q_s(1) and Q_s(0));
	K_s(7)<=(Q_s(6) and Q_s(5) and Q_s(4) and Q_s(3) and Q_s(2) and Q_s(1) and Q_s(0));
	J_s(7)<=(Q_s(6) and Q_s(5) and Q_s(4) and Q_s(3) and Q_s(2) and Q_s(1) and Q_s(0));
	
	clk_s	<= clk;
	rstn_s<=RSTN;
	Q<=Q_s;
end contadorFF_arch;