//
// Generated by Bluespec Compiler (build 0000000)
//
// On Sat Nov  7 21:05:16 PST 2020
//
//
// Ports:
// Name                         I/O  size props
// o_S                            O     1
// o_Cout                         O     1
// CLK                            I     1 unused
// RST_N                          I     1 unused
// i_A                            I     1
// i_B                            I     1
//
// Combinational paths from inputs to outputs:
//   (i_A, i_B) -> o_S
//   (i_A, i_B) -> o_Cout
//
//

`ifdef BSV_ASSIGNMENT_DELAY
`else
  `define BSV_ASSIGNMENT_DELAY
`endif

`ifdef BSV_POSITIVE_RESET
  `define BSV_RESET_VALUE 1'b1
  `define BSV_RESET_EDGE posedge
`else
  `define BSV_RESET_VALUE 1'b0
  `define BSV_RESET_EDGE negedge
`endif

module halfadder_formal(CLK,
		 RST_N,

		 i_A,
		 i_B,

		 o_S,

		 o_Cout);
  input  CLK;
  input  RST_N;

  // action method getInput
  input  i_A;
  input  i_B;

  // value method o_S
  output o_S;

  // value method o_Cout
  output o_Cout;

  // signals for module outputs
  wire o_Cout, o_S;

  // value method o_S
  assign o_S = i_A ^ i_B ;

  // value method o_Cout
  assign o_Cout = i_A & i_B ;

 //Formal verification for use with Symbiyosys
 `ifdef FORMAL
 `endif
endmodule  // halfadder


