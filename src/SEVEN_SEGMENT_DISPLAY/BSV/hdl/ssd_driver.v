//
// Generated by Bluespec Compiler (build 0000000)
//
// On Sun Nov 22 18:35:36 PST 2020
//
//
// Ports:
// Name                         I/O  size props
// o_ANODES                       O     4 reg
// o_CATHODES                     O     7 reg
// i_CLK                          I     1 clock
// i_RESET_N                      I     1 reset
// i_SW_ENABLE                    I     1
// i_DRIVE_ENABLE                 I     1
//
// No combinational paths from inputs to outputs
//
//
// A seven segment display driver.
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

module ssd_driver(i_CLK,
		  i_RESET_N,

		  i_SW_ENABLE,
		  i_DRIVE_ENABLE,

		  o_ANODES,

		  o_CATHODES);
  input  i_CLK;
  input  i_RESET_N;

  // action method group_enable
  input  i_SW_ENABLE;
  input  i_DRIVE_ENABLE;

  // value method anode_value
  output [3 : 0] o_ANODES;

  // value method cathode_value
  output [6 : 0] o_CATHODES;

  // signals for module outputs
  wire [6 : 0] o_CATHODES;
  wire [3 : 0] o_ANODES;

  // register anodes
  reg [3 : 0] anodes;
  reg [3 : 0] anodes$D_IN;
  wire anodes$EN;

  // register cathodes
  reg [6 : 0] cathodes;
  reg [6 : 0] cathodes$D_IN;
  wire cathodes$EN;

  // register current_digit
  reg [3 : 0] current_digit;
  reg [3 : 0] current_digit$D_IN;
  wire current_digit$EN;

  // register d_switch
  reg [1 : 0] d_switch;
  wire [1 : 0] d_switch$D_IN;
  wire d_switch$EN;

  // register digits_0
  reg [3 : 0] digits_0;
  wire [3 : 0] digits_0$D_IN;
  wire digits_0$EN;

  // register digits_1
  reg [3 : 0] digits_1;
  wire [3 : 0] digits_1$D_IN;
  wire digits_1$EN;

  // register digits_2
  reg [3 : 0] digits_2;
  wire [3 : 0] digits_2$D_IN;
  wire digits_2$EN;

  // register digits_3
  reg [3 : 0] digits_3;
  wire [3 : 0] digits_3$D_IN;
  wire digits_3$EN;

  // value method anode_value
  assign o_ANODES = anodes ;

  // value method cathode_value
  assign o_CATHODES = cathodes ;

  // register anodes
  always@(d_switch)
  begin
    case (d_switch)
      2'd0: anodes$D_IN = 4'b1110;
      2'd1: anodes$D_IN = 4'b1101;
      2'd2: anodes$D_IN = 4'b1011;
      2'd3: anodes$D_IN = 4'b0111;
    endcase
  end
  assign anodes$EN = 1'b1 ;

  // register cathodes
  always@(current_digit)
  begin
    case (current_digit)
      4'h0: cathodes$D_IN = 7'b1000000;
      4'h1: cathodes$D_IN = 7'b1111001;
      4'h2: cathodes$D_IN = 7'b0100100;
      4'h3: cathodes$D_IN = 7'b0110000;
      4'h4: cathodes$D_IN = 7'b0011001;
      4'h5: cathodes$D_IN = 7'b0010010;
      4'h6: cathodes$D_IN = 7'b0000010;
      4'h7: cathodes$D_IN = 7'b1111000;
      4'h8: cathodes$D_IN = 7'b0;
      4'h9: cathodes$D_IN = 7'b0010000;
      4'hA: cathodes$D_IN = 7'b0001000;
      4'hB: cathodes$D_IN = 7'b0000011;
      4'hC: cathodes$D_IN = 7'b1000110;
      4'hD: cathodes$D_IN = 7'b0100001;
      4'hE: cathodes$D_IN = 7'b0000110;
      4'd15: cathodes$D_IN = 7'b0001110;
    endcase
  end
  assign cathodes$EN = 1'b1 ;

  // register current_digit
  always@(d_switch or digits_0 or digits_1 or digits_2 or digits_3)
  begin
    case (d_switch)
      2'd0: current_digit$D_IN = digits_0;
      2'd1: current_digit$D_IN = digits_1;
      2'd2: current_digit$D_IN = digits_2;
      2'd3: current_digit$D_IN = digits_3;
    endcase
  end
  assign current_digit$EN = 1'd1 ;

  // register d_switch
  assign d_switch$D_IN = d_switch + 2'd1 ;
  assign d_switch$EN = i_SW_ENABLE ;

  // register digits_0
  assign digits_0$D_IN = digits_0 + 4'd1 ;
  assign digits_0$EN = i_DRIVE_ENABLE ;

  // register digits_1
  assign digits_1$D_IN = digits_1 + 4'd1 ;
  assign digits_1$EN = digits_0 == 4'hF ;

  // register digits_2
  assign digits_2$D_IN = digits_2 + 4'd1 ;
  assign digits_2$EN = digits_1 == 4'hF ;

  // register digits_3
  assign digits_3$D_IN = digits_3 + 4'd1 ;
  assign digits_3$EN = digits_2 == 4'hF ;

  // handling of inlined registers

  always@(posedge i_CLK)
  begin
    if (i_RESET_N == `BSV_RESET_VALUE)
      begin
        anodes <= `BSV_ASSIGNMENT_DELAY 4'd0;
	cathodes <= `BSV_ASSIGNMENT_DELAY 7'd0;
	current_digit <= `BSV_ASSIGNMENT_DELAY 4'd0;
	d_switch <= `BSV_ASSIGNMENT_DELAY 2'd0;
	digits_0 <= `BSV_ASSIGNMENT_DELAY 4'd0;
	digits_1 <= `BSV_ASSIGNMENT_DELAY 4'd0;
	digits_2 <= `BSV_ASSIGNMENT_DELAY 4'd0;
	digits_3 <= `BSV_ASSIGNMENT_DELAY 4'd0;
      end
    else
      begin
        if (anodes$EN) anodes <= `BSV_ASSIGNMENT_DELAY anodes$D_IN;
	if (cathodes$EN) cathodes <= `BSV_ASSIGNMENT_DELAY cathodes$D_IN;
	if (current_digit$EN)
	  current_digit <= `BSV_ASSIGNMENT_DELAY current_digit$D_IN;
	if (d_switch$EN) d_switch <= `BSV_ASSIGNMENT_DELAY d_switch$D_IN;
	if (digits_0$EN) digits_0 <= `BSV_ASSIGNMENT_DELAY digits_0$D_IN;
	if (digits_1$EN) digits_1 <= `BSV_ASSIGNMENT_DELAY digits_1$D_IN;
	if (digits_2$EN) digits_2 <= `BSV_ASSIGNMENT_DELAY digits_2$D_IN;
	if (digits_3$EN) digits_3 <= `BSV_ASSIGNMENT_DELAY digits_3$D_IN;
      end
  end

  // synopsys translate_off
  `ifdef BSV_NO_INITIAL_BLOCKS
  `else // not BSV_NO_INITIAL_BLOCKS
  initial
  begin
    anodes = 4'hA;
    cathodes = 7'h2A;
    current_digit = 4'hA;
    d_switch = 2'h2;
    digits_0 = 4'hA;
    digits_1 = 4'hA;
    digits_2 = 4'hA;
    digits_3 = 4'hA;
  end
  `endif // BSV_NO_INITIAL_BLOCKS
  // synopsys translate_on
endmodule  // ssd_driver

