package scd;

	(* always_ready *)
	interface ClockDiv#(type cntType);

	(* enable = "i_EN" *)
	(* prefix = "" *)
	(* result = "o_ENOUT"  *)
	method ActionValue#(Bit#(1)) start;
endinterface

(* default_clock_osc = "i_CLK" *)
(* default_reset = "i_RESET_N" *)
(* doc = "Author: Elliott Villars" *)
(* doc = "Date: 11/23/2020" *)
(* doc = "Description: A static clock divider that generates an enable pulse every N clock cycles" *)
module static_clock_divider #(parameter cntType dival) (ClockDiv#(cntType)) 
	provisos (Bits#(cntType,cntTypeSz), Eq#(cntType),Arith#(cntType));

	Reg#(cntType) counter <- mkReg(0);
	Reg#(Bit#(1)) en_OUT <- mkReg(0);

	method ActionValue#(Bit#(1)) start;
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
		return en_OUT;
	endmethod
endmodule

(* synthesize *)
module mkStaticClockDivider (ClockDiv#(UInt#(32)));
	ClockDiv#(UInt#(32)) cntr <- static_clock_divider(1000);

	method start;
		return cntr.start;
	endmethod
endmodule
endpackage
