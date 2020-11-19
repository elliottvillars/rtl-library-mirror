//
// Generated by Bluespec Compiler (build 0000000)
//
// On Sun Nov 15 21:06:06 PST 2020
//
//
// Ports:
// Name                         I/O  size props
// o_A                            O    32
// o_B                            O    32
// CLK                            I     1 unused
// RST_N                          I     1 unused
// i_A                            I    32
// i_B                            I    32
//
// Combinational paths from inputs to outputs:
//   i_A -> o_B
//   i_B -> o_A
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

module swap_uncond(CLK,
		   RST_N,

		   i_A,
		   i_B,

		   o_A,

		   o_B);
  input  CLK;
  input  RST_N;

  // action method put
  input  [31 : 0] i_A;
  input  [31 : 0] i_B;

  // value method getA
  output [31 : 0] o_A;

  // value method getB
  output [31 : 0] o_B;

  // signals for module outputs
  wire [31 : 0] o_A, o_B;

  // value method getA
  assign o_A = i_B ;

  // value method getB
  assign o_B = i_A ;
endmodule  // swap_uncond
