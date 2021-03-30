package bram;
	import Vector::*;
	interface BaseBramIfc#(numeric type n,numeric type k);
	method ActionValue#(Bit#(n)) readWrite(Bit#(n) i_DIN,Bit#(k) i_ADDR, Bool i_WREN);
endinterface

interface DualPortBRAMExtIfc#(numeric type n, numeric type k);
	method Action getAddrA(Bit#(k) i_ADDR_A);
	method Action getAddrB(Bit#(k) i_ADDR_B);
	method Bool getWriteError;
endinterface

module singlePortBRAM (BaseBramIfc#(n,k)) provisos (Literal#(_m__#(Reg#(Bit#(n)))));
	Vector#(TExp#(k),Reg#(Bit#(n))) mem <- replicateM('b0);

	method ActionValue#(Bit#(n)) readWrite(Bit#(n) i_DIN,Bit#(k) i_ADDR, Bool i_WREN);
		if(i_WREN)
			mem[i_ADDR] <= i_DIN;
		return (!i_WREN) ? mem[i_ADDR] : 0;
	endmethod
endmodule

module dualPortBRAM (DualPortBRAMExtIfc#(n,k)) provisos (Literal#(_m__#(Reg#(Bit#(n)))));
	Vector#(TExp#(k),Reg#(Bit#(n))) mem <- replicateM(0);
	Reg#(Bool) writeError <- mkReg(False);
	Wire#(Bit#(n)) dataA <- mkWire;
	Wire#(Bit#(n)) dataB <- mkWire;
	Wire#(Bit#(k)) addrA <- mkWire;
	Wire#(Bit#(k)) addrB <- mkWire;
	Wire#(Bool) wrenA <- mkWire;
	Wire#(Bool) wrenB <- mkWire;

	rule checkWriteError(wrenA == wrenB);
		writeError <= (addrA == addrB) ? True : False;
	endrule

	rule writeToMemA(!writeError && wrenA);
		mem[addrA] <= dataA;
	endrule

	rule writeToMemB(!writeError && wrenB);
		mem[addrB] <= dataB;
	endrule
	method Bool getWriteError;
		return writeError;
	endmethod


endmodule

endpackage
