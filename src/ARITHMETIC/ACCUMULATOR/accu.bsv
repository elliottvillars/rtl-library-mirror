package accu;
	(* always_ready *)
	interface AccIFC#(type valType);
	(* prefix = "" *)
	(* enable = "i_ENABLE" *)
	(* result = "o_SUM" *)
	method Action write(valType i_DATA_IN);
	(* result = "o_SUM" *)
	method valType read;
endinterface

module accumulator (AccIFC#(valType)) 
	provisos (Bits#(valType,valTypeSz),Arith#(valType));

	Reg#(valType) total <- mkReg(0);

	method Action write(valType i_DATA_IN);
		total <= total + i_DATA_IN;
	endmethod

	method valType read;
		return total;
	endmethod

endmodule

(* doc = "Author: Elliott Villars" *)
(* doc = "Name: Accumulator" *)
(* doc = "Date: 11/21/2020:" *)
(* doc = "Description: A formally verified accumulator. Every clock cycle adds the summand to the total accumulation. Registered." *)
(* doc = "Ports:" *) 
(* doc = "i_CLK: System clock input. All module operation is predicated on a rising edge clock signal." *)
(* doc = "i_RESET_N: A 1-bit wide input for a reset signal. When asserted,the total accumulation will be set to zero. Active low assertion." *)
(* doc = "i_DATA_IN: A variable width signed input for an incoming signed value." *)
(* doc = "i_ENABLE: A 1-bit wide input for a clock enable signal to enable operation at a slower frequency. Active high assertion." *)
(* doc = "When i_ENABLE is asserted on the rising edge of the clock input, the summand input gets added to the accumulation output." *)
(* doc = "o_SUM: A 32-bit width output holding the signed accumulation. This port is registered." *)

(* default_clock_osc = "i_CLK" *)
(* default_reset = "i_RESET_N" *)
module mkAccumulator (AccIFC#(int));
	AccIFC#(int) acc <- accumulator;

	method Action write(int i_DATA_IN);
		acc.write(i_DATA_IN);
	endmethod

	method int read;
		return acc.read;
	endmethod

endmodule
endpackage
