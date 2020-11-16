package ha;

	interface HAInterface;
	(* prefix = "" *)
	method Action getInput(Bit#(1) i_A, Bit#(1) i_B);
	method Bit#(1) o_S();
	method Bit#(1) o_Cout();
endinterface

(* always_ready = "getInput" *)
(* always_enabled = "getInput" *)
(* always_ready = "o_S,o_Cout" *)
module halfadder(HAInterface);

	Wire#(Bit#(1)) w_A <- mkDWire(0);
	Wire#(Bit#(1)) w_B <- mkDWire(0);
	Wire#(Bit#(1)) w_S <- mkDWire(0);
	Wire#(Bit#(1)) w_C <- mkDWire(0);


	method Bit#(1) o_S();
		return w_A ^ w_B;
	endmethod

	method Bit#(1) o_Cout();
		return w_A & w_B;
	endmethod

	method Action getInput(i_A,i_B);
		w_A <= i_A;
		w_B <= i_B;
	endmethod
endmodule: halfadder
endpackage: ha
