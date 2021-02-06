import accu::*;

(* doc = "Name: OnesCompAccumulator" *)
(* doc = "Date: 11/21/2020:" *)
(* doc = "Description: A one complement accumulator. Every clock cycle adds the summand to the total accumulation.  If overflow occurs, adds the carry bit to the least significant bit. Registered." *)
(* doc = "Ports:" *) 
(* doc = "i_CLK: System clock input. All module operation is predicated on a rising edge clock signal." *)
(* doc = "i_RESET_N: A 1-bit wide input for a reset signal. When asserted,the total accumulation will be set to zero. Active low assertion." *)
(* doc = "i_DATA_IN: A variable width signed input for an incoming signed value." *)
(* doc = "i_ENABLE: A 1-bit wide input for a clock enable signal to enable operation at a slower frequency. Active high assertion." *)
(* doc = "When i_ENABLE is asserted on the rising edge of the clock input, the summand input gets added to the accumulation output." *)
(* doc = "o_SUM: An n-bit width output holding the signed accumulation. This port is registered." *)

(* default_clock_osc = "i_CLK" *)
(* default_reset = "i_RESET_N" *)
module mkOnesCompAcc #(parameter Int#(8) width) (AccIFC#(Bit#(width)));
AccIFC#(Bit#(TAdd#(1,width))) acc <- accumulator;
 method (Bit#(width)) read;
	return truncate(acc.read);
 endmethod
 method Action write (Bit#(width) i_DATA_IN);
        let carry = unpack(msb(acc.read));
	if (carry)
		acc.write(1);
	else
		acc.write(extend(i_DATA_IN));
 endmethod
endmodule

