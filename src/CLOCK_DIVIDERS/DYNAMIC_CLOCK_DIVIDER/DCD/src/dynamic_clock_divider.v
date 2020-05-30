`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/09/2018 12:15:35 PM
// Design Name: 
// Module Name: HZ_Counter
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


module dynamic_clock_divider(
	input wire i_CLK,
	input wire i_RESET,
	input wire i_ENABLE,
	input wire [31:0] i_DIV_VALUE,
	output reg o_ENABLE_OUT
);


reg [31:0] r_Count = 0;
always @ (posedge(i_CLK)) //Counter
begin
	if (i_RESET == 1'b1)
	begin
		r_Count <= 32'b0;
	end
	else
	begin
		if(i_ENABLE == 1'b1) 
		begin
			if (r_Count == i_DIV_VALUE)
				r_Count <= 32'b0;
			else
				r_Count <= r_Count + 1'b1;
		end
		else
		begin
			r_Count <= 32'd0;
		end
	end
end

always @ (posedge(i_CLK)) //FF with comparator
begin
	if (i_RESET == 1'b1)
	begin
		o_ENABLE_OUT <= 1'b0;
	end
	else 
	begin
		if (r_Count == i_DIV_VALUE && i_ENABLE == 1) // if r_Count = 49999999 flip output
		begin
			o_ENABLE_OUT <= 1'b1;
		end
		else
		begin
			o_ENABLE_OUT <= 1'b0;
		end
	end
end

`ifdef FORMAL
	//FIXME:Not passing BMC
	reg r_PAST_VALID = 0;
	always@(posedge i_CLK)
	begin
		assume($changed(i_CLK));
		assume($stable(i_DIV_VALUE));
		r_PAST_VALID <= 1;
		if(r_PAST_VALID == 1 && $rose(i_CLK))
		begin
			if($past(i_RESET) == 1 && $past(i_ENABLE) == 1)
			begin
				assert(r_Count == 0);
				assert(o_ENABLE_OUT == 0);
			end
			else
			begin
				if($past(i_ENABLE) == 0)
					assert(r_Count == 0);
				if($past(r_Count) == $past(i_DIV_VALUE) && $past(i_ENABLE) == 1)
					assert(o_ENABLE_OUT == 1'b1);
				else
					assert(o_ENABLE_OUT == 1'b0);
			end
		end
		if(!$rose(i_CLK))
		begin
			assume($stable(i_ENABLE));
			assume($stable(i_RESET));
		end
	end
`endif
endmodule
