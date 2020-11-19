package swap;
	interface SwapIFC;

	(* prefix = "" *)
	method Action put(int i_A, int i_B);

	(* prefix = "" *)
	(* result = "o_A" *)
	method Bit#(32) getA;
	
	(* prefix = "" *)
	(* result = "o_B" *)
	method Bit#(32) getB;

endinterface : SwapIFC

(* always_ready = "put,getA,getB" *)
(* always_enabled = "put,getA,getB" *)
module swap(SwapIFC);

	Wire#(int) w_A <- mkDWire(0);
	Wire#(int) w_B <- mkDWire(0);

	method Action put(int i_A,int i_B);
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

	method Bit#(32) getA;
		return pack(w_A);
	endmethod

	method Bit#(32) getB;
		return pack(w_B);
	endmethod
endmodule

(* always_ready = "put,getA,getB" *)
(* always_enabled = "put,getA,getB" *)
module swap_uncond (SwapIFC);

	Wire#(int) w_A <- mkDWire(0);
	Wire#(int) w_B <- mkDWire(0);

	method Action put(int i_A, int i_B);
		w_B <= i_A;
		w_A <= i_B;
	endmethod

	method Bit#(32) getA;
		return pack(w_A);
	endmethod

	method Bit#(32) getB;
		return pack(w_B);
	endmethod
endmodule
endpackage
