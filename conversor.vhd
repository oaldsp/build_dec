Library ieee;
use ieee.std_logic_1164.all;

entity conversor_gate is
	port(
		EA0: in std_logic;
		EA1: in std_logic;
		EA2: in std_logic;
		EA3: in std_logic;
		a: out std_logic;
		b: out std_logic;
		c: out std_logic;
		d: out std_logic;
		e: out std_logic;
		f: out std_logic;
		g: out std_logic 
	);
	end conversor_gate;
	
architecture conversor_arch of conversor_gate is
		begin
			a<= not(((not EA3) and EA2 and EA0) or ((not EA2) and (not EA0)) or (EA1 and (EA2 or (not EA3))) or (EA3 and (((not EA1) and (not EA0)) or ((not EA2)and(not EA1)))));
			b<= not(((not EA3) and (not(EA1 xor EA0))) or ((not EA1) and (not(EA3 xor EA0))) or ((not EA2) and ((not EA0) or (not EA3))));
			c<= not(((EA3) and (not EA2)) or ((not EA1) and (EA0)) or ((not EA3) and ((EA2) or (not EA1) or (EA0))));
			d<= not(((not EA1) and ((EA3) or (EA2 and EA0))) or ((not EA2)and(not(EA1 xor EA0))) or ((EA1) and (not EA0) and ((not EA3) or (EA2))));
			e<= not(((not EA0)and ((not EA2) or (EA1))) or ((EA3) and (EA2 or EA1)));
			f<= not(((not EA3) and (EA2) and (not EA1)) or ((EA3) and ((not EA2) or (EA1))) or ((not EA0) and ((EA2) or (not EA1))));
			g<= not(((EA3) and ((not EA2) or (EA0))) or ((EA1) and ((not EA2) or (not EA0))) or ((not EA3) and (EA2) and (not EA1)));
		end conversor_arch;