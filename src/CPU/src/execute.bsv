package execute;
	typedef Bit#(8) Byte;
	(* prefix = "" *)
	interface CPUExec;
	method Action getData(Byte i_A, Byte i_B);
	method ActionValue#(Byte) exec(OPCODE i_OPCODE);
endinterface

typedef enum {NOP,ADD,SUB,MUL,DIV,AND,ORR,XOR,NOT} OPCODE deriving (Bits,Eq);

(* doc = "Author: Elliott Villars" *)
(* doc = "Date: 11/28/2020" *)
(* doc = "Description: A 8-bit ALU. Designed to utilize FPGA DSP slices." *)
(* synthesize *)
module alu (CPUExec);
	Reg#(Byte) r_OP1 <- mkReg(0);
	Reg#(Byte) r_OP2 <- mkReg(0);
	Reg#(Byte) r_RES <- mkReg(0);

	method Action getData(i_A,i_B);
		r_OP1 <= i_A;
		r_OP2 <= i_B;
	endmethod

	method ActionValue#(Byte) exec(OPCODE i_OPCODE);
		case (i_OPCODE) matches
			NOP: r_RES <= r_RES;
			ADD: r_RES <= r_OP1 + r_OP2;
			SUB: r_RES <= r_OP1 - r_OP2;
			MUL: r_RES <= r_OP1 * r_OP2;
			DIV: r_RES <= r_RES;
			AND: r_RES <= r_OP1 & r_OP2;
			ORR: r_RES <= r_OP1 | r_OP2;
			XOR: r_RES <= r_OP1 ^ r_OP2;
			NOT: r_RES <= ~r_OP1;
		endcase
		return r_RES;
	endmethod

endmodule
endpackage
