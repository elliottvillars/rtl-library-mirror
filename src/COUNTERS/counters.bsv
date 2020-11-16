package counters;

interface Counter;
        (* result = "o_value" *)
	method Bit#(8) out();

	(* enable = "i_enable" *)
	method Action  clk_en();
endinterface: Counter

(* synthesize *)
(* always_ready = "out,clk_en" *) 

module mkBinCounter(Counter);

Reg#(Bit#(8)) val  <- mkReg (0);

method Bit#(8) out();
return val;
endmethod

method Action clk_en();
val <= val + 1;
endmethod

endmodule: mkBinCounter

(* always_ready = "out,clk_en" *) 
module mkGreyCounter(Counter);
Counter binCnt <- mkBinCounter();
Reg#(Bit#(8)) val <- mkReg(0);

method Bit#(8) out();
return val;
endmethod

method Action clk_en();
binCnt.clk_en();
val <= binCnt.out() ^ (binCnt.out() >> 1);
endmethod


endmodule: mkGreyCounter
module binCounterTB();

Counter cnt <- mkBinCounter();
Reg#(Bit#(3)) st <- mkReg(0);
Reg#(Bit#(8)) v1 <- mkReg(0);
Reg#(Bit#(8)) v2 <- mkReg(0);
Reg#(Bit#(8)) cyc <- mkReg(0);

rule init (st == 0);
st <= 1;
$display("Beginning counter simulation");
v1 <= 0;
v2 <= 0;
cyc <= 0;
cnt.clk_en();
endrule: init

rule getval(st == 1);
cnt.clk_en();
v1 <= cnt.out();
if(cyc == 255)
	begin 
	st <= 3;
	end
else if(v1 < v2)
	begin
	$display("Something went wrong");
	st <= 4;
	end
else
	begin
	$display("Current counter value: %d",v1);
	st <= 2;
	end
endrule: getval

rule run (st == 2);
v2 <= v1;
cyc <= cyc + 1;
st <= 1;
endrule: run

rule done (st == 3);
$display("Counter simulation completed");
$display("Cycles completed: %d",cyc);
$finish();
endrule: done

rule err (st == 4);
$display("Counter error");
$display("V1: %d",v1);
$display("V2: %d",v2);
$display("Current cycle : %d",cyc);
$finish();
endrule: err

endmodule: binCounterTB

module grayCounterTB();
Counter gcnt <- mkGreyCounter();
Reg#(Bit#(8)) cyc <- mkReg(0);
Reg#(Bit#(8)) v1 <- mkReg(0);
Reg#(Bit#(8)) v2 <- mkReg(0);

rule init(cyc == 0);
v1 <= 0;
v2 <= 0;
endrule: init

rule go;
gcnt.clk_en();
cyc <= cyc + 1;
endrule: go

rule run(cyc < 255 && cyc >= 2);
$display("Current value: %b\nPast value: %b",v1,v2);

v2 <= v1;
v1 <= gcnt.out();

endrule: run

rule stop(cyc == 255);
$finish();
endrule: stop
endmodule: grayCounterTB
endpackage: counters
