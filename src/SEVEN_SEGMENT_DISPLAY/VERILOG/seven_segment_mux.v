`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Compo_Anodesy: 
// Engineer: 
// 
// Create Date: 10/09/2018 01:00:28 PM
// Design Name: 
// Module Name: ssd_mux
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

`default_nettype none
module seven_segment_mux(
	input wire i_CLK,
	input wire i_CLK_ENABLE,
	input wire [3:0] i_DIGIT_1,
	input wire [3:0] i_DIGIT_2,
	input wire [3:0] i_DIGIT_3,
	input wire [3:0] i_DIGIT_4,
	output reg [3:0] o_OUT,
	output reg [3:0] o_ANODES
);
reg [1:0] r_CURRENT_DIGIT; //A counter to mux between 4 seven segment digits

always@(posedge i_CLK)
begin
	if(i_CLK_ENABLE == 1'b1)
		r_CURRENT_DIGIT <= r_CURRENT_DIGIT + 1'b1;
	else
		r_CURRENT_DIGIT <= r_CURRENT_DIGIT;
end 
always@ (*)
begin
	case(r_CURRENT_DIGIT)
		2'b00: 
		begin
			o_OUT = i_DIGIT_1;
			o_ANODES = 4'b0111;
		end
		2'b01: 
		begin
			o_OUT = i_DIGIT_2;
			o_ANODES = 4'b1011;
		end
		2'b10: 
		begin
			o_OUT = i_DIGIT_3;
			o_ANODES = 4'b1101;
		end
		2'b11: 
		begin
			o_OUT = i_DIGIT_4;
			o_ANODES = 4'b1110;
		end
	endcase
end
endmodule
