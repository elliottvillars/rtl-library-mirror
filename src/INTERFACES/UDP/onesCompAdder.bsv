package onesCompAdder;
	interface AdderWithOverflow#(numeric type n);
	method Action putData (Bit#(n) i_A, Bit#(n) i_B);
	method Bit#(n) getResult;
	method Bool getOverflow;
endinterface

module mkOnesCompAdder (AdderWithOverflow#(n)) provisos (Literal#(Bool), Add#(_,1,n));
	Reg#(Bit#(TAdd#(1,n))) sum <- mkReg(0);
	Reg#(Bool) ovf <- mkReg(0);

	Wire#(Bit#(n)) w_A <- mkWire;
	Wire#(Bit#(n)) w_B <- mkWire;

	rule checkOverflow;
		ovf <= unpack(msb(sum));
	endrule

	rule addOrReset;
		if(ovf)
			sum <= sum + {1'b1,zeroExtend(1'b1)};
		else
			sum <= sum + zeroExtend(w_A) + zeroExtend(w_B);
	endrule

	method Action putData (Bit#(n) i_A, Bit#(n) i_B);
		w_A <= i_A;
		w_B <= i_B;
	endmethod

	method Bit#(n) getResult;
		return truncate(sum);
	endmethod

	method Bool getOverflow;
		return ovf;
	endmethod
endmodule
endpackage
