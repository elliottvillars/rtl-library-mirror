package swap;
	(* always_ready *)
	(* always_enabled *)
	interface SwapIFC#(type valType);

	(* prefix = "" *)
	method Action put(valType i_A, valType i_B);

	(* result = "o_A" *)
	method valType getA;
	
	(* result = "o_B" *)
	method valType getB;

endinterface : SwapIFC

module swap(SwapIFC#(valType)) 
	provisos (Bits#(valType,valTypeSz), Ord#(valType));

	Reg#(valType) w_A <- mkRegU;
	Reg#(valType) w_B <- mkRegU;

	method Action put(i_A,i_B);
		if(i_A < i_B)
		begin
			w_A <= i_B;
			w_B <= i_A;
		end
		else
		begin
			w_A <= i_A;
			w_B <= i_B;
		end
	endmethod

	method valType getA;
		return w_A;
	endmethod

	method valType getB;
		return w_B;
	endmethod
endmodule

module swap_uncond (SwapIFC#(valType)) 
	provisos (Bits#(valType,valTypeSz));

	Reg#(valType) w_A <- mkRegU;
	Reg#(valType) w_B <- mkRegU;

	method Action put(i_A, i_B);
		w_B <= i_A;
		w_A <= i_B;
	endmethod

	method valType getA;
		return w_A;
	endmethod

	method valType getB;
		return w_B;
	endmethod
endmodule

(* doc = "Author: Elliott Villars" *)
(* doc = "Date: 11/23/2020" *)
(* doc = "Description: A conditional swap module. Swaps \"i_A\" and \"i_B\" if \"i_A\" is less than \"i_B\". Registered" *)
(* doc = "Ports: " *)
(* doc = "i_CLK: A 1-bit clock port" *)
(* doc = "i_A: A n-bit wide registered input" *)
(* doc = "i_B: A n-bit wide registered input" *)
(* doc = "o_A: A n-bit wide registered output. The larger of the two input numbers is driven here." *)
(* doc = "o_B: A n-bit wide registered output. The smaller of the two input numbers is driven here." *)
(* no_default_reset *)
(* default_clock_osc = "i_CLK" *)
(* synthesize *)
module mkSwap ( SwapIFC#(int) );

	SwapIFC#(int) entity1 <- swap;

	method Action put (i_A,i_B);
		entity1.put(i_A,i_B);
	endmethod

	method getA;
		return entity1.getA;
	endmethod

	method getB;
		return entity1.getB;
	endmethod
endmodule

(* doc = "Author: Elliott Villars" *)
(* doc = "Date: 11/23/2020" *)
(* doc = "Description: A unconditional swap module. Always swaps the \"i_A\" and \"i_B\" input. Registered" *)
(* doc = "Ports: " *)
(* doc = "i_CLK: A 1-bit clock port" *)
(* doc = "i_A: A n-bit wide registered input" *)
(* doc = "i_B: A n-bit wide registered input" *)
(* doc = "o_A: A n-bit wide registered output. The \"i_B\" input is driven here." *)
(* doc = "o_B: A n-bit wide registered output. The \"i_A\" input is driven here." *)
(* no_default_reset *)
(* default_clock_osc = "i_CLK" *)
module mkUSwap ( SwapIFC#(int) );

	SwapIFC#(int) entity1 <- swap_uncond;

	method Action put (i_A,i_B);
		entity1.put(i_A,i_B);
	endmethod

	method getA;
		return entity1.getA;
	endmethod

	method getB;
		return entity1.getB;
	endmethod
endmodule
endpackage
