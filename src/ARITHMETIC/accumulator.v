`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/20/2018 04:51:42 PM
// Design Name: 
// Module Name: Accumuator
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


module accumulator #(parameter p_DATA_WIDTH = 8)(
	input wire i_CLK,
	input wire i_CLK_EN,
	input wire i_RST,
	input wire [p_DATA_WIDTH-1:0] i_SUMMAND,
	output reg [p_DATA_WIDTH-1:0] o_ACCUMULATION
);

//TODO: protect against overflow
always@(posedge i_CLK)
begin
	if(i_RST == 1'b1)
		o_ACCUMULATION <= {p_DATA_WIDTH{1'b0}};
	else
	begin
		if(i_CLK_EN == 1'b1)
			o_ACCUMULATION <= o_ACCUMULATION + i_SUMMAND;
		else
			o_ACCUMULATION <= o_ACCUMULATION;
	end
end
`ifdef FORMAL
	reg r_PAST_VALID = 0;
	always@(posedge i_CLK)
	begin
		assume($changed(i_CLK));
		r_PAST_VALID <= 1;
		if(r_PAST_VALID == 1 && $rose(i_CLK))
		begin
			if($past(i_RST) == 1)
				assert(o_ACCUMULATION == 0);
			else
			begin
				if($past(i_CLK_EN) == 1 && o_ACCUMULATION >= $past(o_ACCUMULATION) + $past(i_SUMMAND))
					assert(o_ACCUMULATION == $past(o_ACCUMULATION) + $past(i_SUMMAND));
				if($past(i_CLK_EN) == 0)
					assert(o_ACCUMULATION == $past(o_ACCUMULATION));
			end
		end
	end
`endif
endmodule
