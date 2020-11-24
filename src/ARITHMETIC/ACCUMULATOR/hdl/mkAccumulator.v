//
// Generated by Bluespec Compiler (build 0000000)
//
// On Mon Nov 23 15:32:54 PST 2020
//
//
// Ports:
// Name                         I/O  size props
// o_SUM                          O    32 reg
// i_CLK                          I     1 clock
// i_RESET_N                      I     1 reset
// i_DATA_IN                      I    32
// i_ENABLE                       I     1
//
// No combinational paths from inputs to outputs
//
//
// Author: Elliott Villars
// Name: Accumulator
// Date: 11/21/2020:
// Description: A formally verified accumulator. Every clock cycle adds the summand to the total accumulation. Registered.
// Ports:
// i_CLK: System clock input. All module operation is predicated on a rising edge clock signal.
// i_RESET_N: A 1-bit wide input for a reset signal. When asserted,the total accumulation will be set to zero. Active low assertion.
// i_DATA_IN: A variable width signed input for an incoming signed value.
// i_ENABLE: A 1-bit wide input for a clock enable signal to enable operation at a slower frequency. Active high assertion.
// When i_ENABLE is asserted on the rising edge of the clock input, the summand input gets added to the accumulation output.
// o_SUM: A 32-bit width output holding the signed accumulation. This port is registered.
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

module mkAccumulator(i_CLK,
		     i_RESET_N,

		     i_DATA_IN,
		     i_ENABLE,
		     o_SUM);
  input  i_CLK;
  input  i_RESET_N;

  // actionvalue method load
  input  [31 : 0] i_DATA_IN;
  input  i_ENABLE;
  output [31 : 0] o_SUM;

  // signals for module outputs
  wire [31 : 0] o_SUM;

  // register acc_total
  reg [31 : 0] acc_total;
  wire [31 : 0] acc_total$D_IN;
  wire acc_total$EN;

  // actionvalue method load
  assign o_SUM = acc_total ;

  // register acc_total
  assign acc_total$D_IN = acc_total + i_DATA_IN ;
  assign acc_total$EN = i_ENABLE ;

  // handling of inlined registers

  always@(posedge i_CLK)
  begin
    if (i_RESET_N == `BSV_RESET_VALUE)
      begin
        acc_total <= `BSV_ASSIGNMENT_DELAY 32'd0;
      end
    else
      begin
        if (acc_total$EN) acc_total <= `BSV_ASSIGNMENT_DELAY acc_total$D_IN;
      end
  end

  // synopsys translate_off
  `ifdef BSV_NO_INITIAL_BLOCKS
  `else // not BSV_NO_INITIAL_BLOCKS
  initial
  begin
    acc_total = 32'hAAAAAAAA;
  end
  `endif // BSV_NO_INITIAL_BLOCKS
  // synopsys translate_on
endmodule  // mkAccumulator
