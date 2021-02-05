import accu::*;

(* synthesize *)
module mkOnesCompAcc (AccIFC#(Bit#(16)));
AccIFC#(Bit#(17)) acc <- accumulator;
 method ActionValue#(Bit#(16)) load(Bit#(16) i_DATA_IN);
        if (acc.)
		acc <= acc + 1;
	else
		acc <= acc + extend(i_DATA_IN);
	return truncate(acc);
 endmethod
endmodule

