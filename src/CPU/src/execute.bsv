package execute;
	typedef Bit#(16) DWord;
	typedef Bit#(8) Word;
	typedef Bit#(4) HWord;
	interface CPUExec;
	(* prefix = "" *)
	method Action getData(Word i_A, Word i_B);
	(* prefix = "" *)
	method ActionValue#(Word) exec(OPCODE i_OPCODE);
	(* prefix = "" *)
	method HWord getStat;
endinterface

typedef enum {NOP,ADD,SUB,MUL,DIV,AND,ORR,XOR,NOT,MOV,SRL,SLL} OPCODE deriving (Bits,Eq);

(* doc = "Author: Elliott Villars" *)
(* doc = "Date: 11/28/2020" *)
(* doc = "Description: A 8-bit ALU. Designed to utilize FPGA DSP slices." *)
(* default_clock_osc = "i_CLK" *)
(* default_reset = "i_RESET_N" *)
(* synthesize *)
module alu (CPUExec);
	Reg#(Word) r_OP1    <- mkReg(0);
	Reg#(Word) r_OP2    <- mkReg(0);
	Reg#(DWord) r_RES    <- mkReg(0);
	Reg#(bit) carry     <- mkReg(0);
	Reg#(HWord) status <- mkReg(0);

	rule setFlags;
		status[0] <= pack(r_RES == 0); //Z
		status[1] <= r_RES[8]; //C
		status[2] <= r_RES[7] & ~|r_RES[16:8]; //N
		status[3] <= |r_RES[16:8]; //O
	endrule

	method Action getData(i_A,i_B);
		r_OP1 <= i_A;
		r_OP2 <= i_B;
	endmethod

	method ActionValue#(Word) exec(OPCODE i_OPCODE);
		case (i_OPCODE) matches
			NOP: r_RES <= r_RES;
			ADD: r_RES <= extend(r_OP1 + r_OP2);
			SUB: r_RES <= extend(r_OP1 - r_OP2);
			MUL: r_RES <= extend(r_OP1 * r_OP2);
			DIV: r_RES <= r_RES;
			AND: r_RES <= extend(r_OP1 & r_OP2);
			ORR: r_RES <= extend(r_OP1 | r_OP2);
			XOR: r_RES <= extend(r_OP1 ^ r_OP2);
			NOT: r_RES <= extend(~r_OP1);
			MOV: r_RES <= extend(r_OP2);
			SRL: r_RES <= extend(r_OP1 >> r_OP2);
			SLL: r_RES <= extend(r_OP1 << r_OP2);
		endcase
		return truncate(r_RES);
	endmethod

	method getStat;
		return status;
	endmethod

endmodule
endpackage
