package intsqrt;
	interface Isqrt32;
	method Action load(Bit#(32) i_WORD);
	method Bit#(1) valid_input();
	method int res();
endinterface: Isqrt32

(* always_ready = "load,valid_input,res" *)
(* always_enabled = "load,valid_input,res" *)
module sqrt(Isqrt32);
	Reg#(UInt#(32)) value <- mkReg(0);
	Reg#(UInt#(32)) bitmask <- mkReg('h8000);
	Reg#(Bit#(32)) data <- mkReg(0);
	Reg#(Bit#(32)) del_a <- mkReg(0);
	Reg#(Bit#(32)) del_b <- mkReg('h8000 * 'h8000);
	Wire#(Bit#(1)) valid <- mkDWire(0);
	
	rule no_imag;
		if(unpack(data[31]))
			valid <= 0;
		else
			valid <= 1;
	endrule
	rule calc;
		while (bitmask != 0) 
		begin
			int temp = unpack (data - (del_a | del_b));
			del_a >>= 1;
			if(temp >= 0) 
			begin

			end
		end
	endrule
	method Action load(i_WORD);
		data <= i_WORD;
	endmethod
	method Bit#(1) valid_input();
		return valid;
	endmethod
	method int res();
		return unpack(data);
	endmethod

endmodule
endpackage
