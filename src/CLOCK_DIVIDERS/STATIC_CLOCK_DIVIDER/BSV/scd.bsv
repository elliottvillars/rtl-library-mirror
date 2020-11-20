package scd;

(* always_ready *)
interface ClockDiv;
(* enable = "i_EN" *)
method Action enable;
method Bit#(1) drive();
endinterface

module  static_clock_divider (ClockDiv);

Reg#(Bit#(32)) counter <- mkReg(0);
Reg#(Bit#(1)) en_OUT <- mkReg(0);

int dival = 3;

rule go;
if(counter == pack(dival - 1))
	begin
	en_OUT <= 1;
	end
else
	begin
	en_OUT <= 0;
	end
endrule

method Action enable;
if(counter == pack(dival - 1))
	begin
	counter <= 0;
	end
else
	begin
	counter <= counter + 1;
	end
endmethod

method Bit#(1) drive;
return en_OUT;
endmethod

endmodule

module mkTB(Empty);

endmodule
endpackage
