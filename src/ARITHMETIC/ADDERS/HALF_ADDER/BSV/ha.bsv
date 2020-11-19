package ha;
	(* always_ready *)
	(* always_enabled *)
	interface HAInterface;
	(* prefix = "" *)
	method Action drive(Bit#(1) i_A, Bit#(1) i_B);
	(* result = "o_S" *)
	method Bit#(1) sum;
	(* result = "o_Cout" *)
	method Bit#(1) carry;
endinterface

(* doc = "A half adder written in Bluespec SystemVerilog" *)
module halfadder(HAInterface);
	Wire#(Bit#(1)) w_S <- mkBypassWire();
	Wire#(Bit#(1)) w_C <- mkBypassWire();

	method Action drive(i_A,i_B);
		w_S <= i_A ^ i_B;
		w_C <= i_A & i_B;
	endmethod

	method sum;
		return w_S;
	endmethod

	method carry;
		return w_C;
	endmethod

endmodule: halfadder
endpackage: ha
