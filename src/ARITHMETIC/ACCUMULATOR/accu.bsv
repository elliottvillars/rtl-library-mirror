package accu;
	(* always_ready *)
	interface AccIFC#(numeric type sz);
	(* prefix = "" *)
	(* enable = "i_ENABLE" *)
	method Action write(Bit#(sz) i_DATA_IN);
	(* result = "o_SUM" *)
	method Bit#(sz) read;
endinterface

interface AccIFCWithOverflowCarry#(numeric type sz);
	interface AccIFC#(sz) base;
	(* result = "o_OVERFLOW" *)
	method bit getOverflow;
endinterface
module accumulator (AccIFC#(sz));

	Reg#(Bit#(sz)) total <- mkReg(0);

	method Action write(Bit#(sz) i_DATA_IN);
		total <= total + i_DATA_IN;
	endmethod

	method Bit#(sz) read;
		return total;
	endmethod

endmodule

module accumulatorWithOverflowCarry (AccIFCWithOverflowCarry#(sz)) provisos (Add#(_,1,sz));

	Reg#(Bit#(TAdd#(1,sz))) total <- mkReg(0);

	Reg#(bit) ovf <- mkReg(0);


	rule checkOverflow;
		ovf <= msb(total);
	endrule

	rule resetOverflow (ovf == 1);
		total <= total + {1'b1,zeroExtend(1'b1)};
	endrule

	interface AccIFC base;
		method Action write(Bit#(sz) i_DATA_IN);
			total <= total + extend(i_DATA_IN);
		endmethod

		method Bit#(sz) read;
			return truncate(total);
		endmethod
	endinterface

	method bit getOverflow;
		return ovf;
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
module mkAccumulator (AccIFC#(sz));
	AccIFC#(sz) acc <- accumulator;

	method Action write(Bit#(sz) i_DATA_IN);
		acc.write(i_DATA_IN);
	endmethod

	method Bit#(sz) read;
		return acc.read;
	endmethod

endmodule

module mkAccumulatorWithOverflowCarry (AccIFCWithOverflow#(sz));
	AccIFCWithOverflow#(sz) acc <- mkAccumulatorWithOverflow;
	method bit getOverflow;
		return acc.getOverflow;
	endmethod

	interface AccIFC base;
		method Bit#(sz) read;
			return acc.base.read;
		endmethod
		method Action write(Bit#(sz) i_DATA_IN);
			acc.base.write(i_DATA_IN);
		endmethod
	endinterface
endmodule
endpackage
