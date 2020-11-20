package scd;

	(* always_ready *)
	(* always_enabled *)
	interface ClockDiv;

	(* prefix = "" *)
	method Action en(Bool i_ENABLE);

	(* result = "o_ENOUT"  *)
	method Bit#(1) out();
endinterface

(* default_clock_osc = "i_CLK" *)
(* default_reset = "i_RESET_N" *)
(* doc = "A static clock divider that generates an enable pulse every N clock cycles" *)
(* doc = "NOTE: Do not forget to set the dival parameter, it defaults to zero" *)
module static_clock_divider #(parameter UInt#(32) dival) (ClockDiv);

	Reg#(UInt#(32)) counter <- mkReg(0);
	Reg#(Bit#(1)) en_OUT <- mkReg(0);
	Wire#(Bool) r_EN <- mkWire();

	rule run (r_EN == True);
		if(counter == (dival - 1))
		begin
			counter <= 0;
			en_OUT <= 1;
		end
		else
		begin
			counter <= (counter + 1);
			en_OUT <= 0;
		end
	endrule

	method Action en(i_ENABLE);
		r_EN <= i_ENABLE;
	endmethod

	method Bit#(1) out();
		return en_OUT;
	endmethod
endmodule
endpackage
