package skid_buf;
	(* always_ready,always_enabled *)
	interface Buffer#(numeric type n);	
	method Action  getDownstreamRDY (Bool i_READY);
	method Action  getUpstreamValid (Bool i_VALID);
	method Action  getUpstreamData  (Bit#(n) i_DATA);
	method Bool    putUpstreamRDY;
	method Bool    putDownstreamValid;
	method Bit#(n) putDownstreamData;
endinterface

//TODO: name these better
//TODO: Test with BlueCheck
//if !uprdy and ! dowrdy, ddata == udata
module mkSkidBuffer(Buffer#(n)) provisos (Literal#(Bool));
	Wire#(Bool) uvalid <- mkWire;
	Wire#(Bool) uprdy <- mkWire;
	Wire#(Bit#(n)) udata <- mkWire;
	Reg#(Bool) dwnrdy   <- mkReg(0);
	Reg#(Bit#(n)) ddata <- mkReg(0);
	Reg#(Bool) dvalid   <- mkReg(0);

	Reg#(Bit#(TAdd#(n,1))) buffer <- mkReg(0);

	rule copyToBuf (!dwnrdy && uprdy);
		buffer <= {pack(uvalid),udata};
	endrule

	rule writeThrough (dwnrdy && uprdy);
		ddata <= udata;
		dvalid <= uvalid;
	endrule

	rule recoverFromBuf (dwnrdy && !uprdy);
		dvalid <= unpack(msb(buffer));
		ddata <= buffer[valueOf(n)-1:0];
	endrule

	method Action getDownstreamRDY (Bool i_READY);
		dwnrdy <= i_READY;
	endmethod

	method Action getUpstreamValid (Bool i_VALID);
		uvalid <= i_VALID;
	endmethod

	method Action getUpstreamData (Bit#(n) i_DATA);
		udata <= i_DATA;
	endmethod

	method Bool putUpstreamRDY;
		return uprdy;
	endmethod	

	method Bool putDownstreamValid;
		return dvalid;
	endmethod

	method Bit#(n) putDownstreamData;
		return ddata;
	endmethod
endmodule
endpackage
