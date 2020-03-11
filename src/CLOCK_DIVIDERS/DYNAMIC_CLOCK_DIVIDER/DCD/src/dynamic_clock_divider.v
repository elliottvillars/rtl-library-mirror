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
	input wire i_RST,
	input wire i_ENABLE,
	input wire [31:0] i_DIV_VALUE,
	output reg o_ENABLE_OUT
);


reg [31:0] r_Count;
always @ (posedge(i_CLK)) //Counter
begin
	if (i_RST == 1'b1)
	begin
		r_Count <= 32'b0;
	end
	else
	begin
		if(i_ENABLE == 1'b1) 
		begin
			if (r_Count >= i_DIV_VALUE)
				r_Count <= 32'b0;
			else
				r_Count <= r_Count + 1;
		end
		else
		begin
			r_Count <= 32'd0;
		end
	end
end

always @ (posedge(i_CLK)) //FF with comparator
begin
	if (i_RST == 1'b1)
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
	reg r_PAST_VALID;
	initial begin
		assume(r_Count == 0);
		assume(i_CLK == 0);
		assume(i_RST == 1);
	end

	always@(posedge i_CLK)
	begin
		r_PAST_VALID = 1;
		assume(i_CLK != $past(i_CLK));
		assume($stable(i_DIV_VALUE));
		if(r_PAST_VALID == 1 && $rose(i_CLK))
		begin
			if($past(i_RST) == 1)
			begin
				assert(r_Count == 0);
				assert(o_ENABLE_OUT == 0);
			end
			else
			begin
				if($stable(i_RST) && $past(i_RST) == 0)
				begin
					if($stable(i_ENABLE) && $past(i_ENABLE) == 1)
					begin
						if(i_ENABLE == 1)
							assert($past(r_Count) == r_Count + 1);
						if($past(r_Count) != i_DIV_VALUE)
							assert(o_ENABLE_OUT == 0);
						else
							assert(o_ENABLE_OUT == 1);
					end
				end
			end
		end
	end
`endif
endmodule
