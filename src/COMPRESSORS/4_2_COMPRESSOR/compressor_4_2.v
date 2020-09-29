//Implemented from here
//https://guest.iis.ee.ethz.ch/~zimmi/publications/adder_arch.pdf

module compressor_4_2 (
	input wire i_A,
	input wire i_B,
	input wire i_C,
	input wire i_D,
	input wire i_Cin,
	output wire o_Cout,
	output reg o_Carry,
	output reg o_S
);

wire w_X1; 
wire w_X2;
wire w_X3; 

//
assign w_X1 = i_A ^ i_B;
assign w_X2 = i_C ^ i_D;
assign w_X3 = w_X1 ^ w_X2;

assign o_Cout = (w_X1) ? i_A : i_C;
assign o_S = w_X3 ^ i_Cin;
assign o_Carry = (w_X3) ? i_Cin : i_D;


endmodule
