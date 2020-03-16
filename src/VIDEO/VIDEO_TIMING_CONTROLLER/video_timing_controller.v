`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/23/2018 10:44:21 PM
// Design Name: 
// Module Name: VGA_controller
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


module video_timing_controller(
	input wire i_CLK,
	output reg o_HSYNC,
	output reg o_VSYNC,
	output reg o_VIDEO_DATA_ENABLE,
	output reg [11:0] o_X_COORD,
	output reg [11:0] o_Y_COORD
);


parameter p_END_OF_LINE = 800;
parameter p_END_OF_SCREEN = 525;
parameter p_HORIZONTAL_ACTIVE_START = 0;
parameter p_VERTICAL_ACTIVE_START = 0;
parameter p_HA_END = 640;
parameter p_VA_END = 480;
parameter p_HORIZONTAL_FRONT_PORCH = 16;
parameter p_HORIZONTAL_BACK_PORCH = 48;
parameter p_HORIZONTAL_SYNC_WIDTH = 96;
parameter p_VERTICAL_FRONT_PORCH = 10;
parameter p_VERTICAL_BACK_PORCH = 33;
parameter p_VERTICAL_SYNC_WIDTH = 2;

reg [11:0] r_HORIZ_COUNT;
reg [11:0] r_VERT_COUNT;

//
//TODO: Set compiler directives to create parameter sets.
//

always@(posedge i_CLK) begin: X_COORDINATES
	if(r_HORIZ_COUNT <= p_HA_END)
		o_X_COORD <= r_HORIZ_COUNT;
	else
		o_X_COORD <= p_HA_END;
end

always@(posedge i_CLK) begin: Y_COORDINATES
	if(r_VERT_COUNT <= p_VA_END)
		o_Y_COORD <= r_VERT_COUNT;
	else
		o_Y_COORD <= p_VA_END;
end

always@(posedge i_CLK) begin: PIXEL_COUNT
	if(r_HORIZ_COUNT == p_END_OF_LINE) 
		r_HORIZ_COUNT <= 12'd0;
	else
		r_HORIZ_COUNT <= r_HORIZ_COUNT + 1'b1;
end

always@(posedge i_CLK) begin: LINE_COUNT
	if(r_VERT_COUNT == p_END_OF_SCREEN) 
	begin
		r_VERT_COUNT <= 12'd0;
	end
	else if (r_HORIZ_COUNT == p_END_OF_LINE)
	begin
		r_VERT_COUNT <= r_VERT_COUNT + 1'b1;
	end
	else
	begin
		r_VERT_COUNT <= r_VERT_COUNT;
	end
end

always@(posedge i_CLK) begin: HSYNC
	if((r_HORIZ_COUNT >= p_HA_END + p_HORIZONTAL_FRONT_PORCH) && (r_HORIZ_COUNT < p_HA_END + p_HORIZONTAL_FRONT_PORCH + p_HORIZONTAL_SYNC_WIDTH))
		o_HSYNC <= 1'b0;
	else
		o_HSYNC <= 1'b1;
end

always@(posedge i_CLK) begin: VSYNC
	if((r_VERT_COUNT >= p_VA_END + p_VERTICAL_FRONT_PORCH ) && (r_VERT_COUNT < p_VA_END + p_VERTICAL_FRONT_PORCH + p_VERTICAL_SYNC_WIDTH))
		o_VSYNC <= 1'b0;
	else
		o_VSYNC <= 1'b1;
end

always@(posedge i_CLK) begin: VIDEO_DATA_ENABLE
	if((r_HORIZ_COUNT > p_HA_END) || (r_VERT_COUNT > p_VA_END))
		o_VIDEO_DATA_ENABLE <= 1'b0;
	else
		o_VIDEO_DATA_ENABLE <= 1'b1;
end


`ifdef FORMAL
	reg r_PAST_VALID = 0;

	always@(posedge i_CLK)
	begin
		r_PAST_VALID <= 1;
		assume($changed(i_CLK));
		if(r_PAST_VALID == 1 && $rose(i_CLK))
		begin
			if($past(r_HORIZ_COUNT) <= p_HA_END || $past(r_HORIZ_COUNT) >= p_HA_END + p_HORIZONTAL_FRONT_PORCH + p_HORIZONTAL_SYNC_WIDTH)
			begin
				assert(o_HSYNC == 1);
			end
			else
			begin
				if(($past(r_HORIZ_COUNT) >= p_HA_END + p_HORIZONTAL_FRONT_PORCH) && ($past(r_HORIZ_COUNT) < p_HA_END + p_HORIZONTAL_FRONT_PORCH + p_HORIZONTAL_SYNC_WIDTH))
					assert(o_HSYNC == 0);
			end
			if($past(r_VERT_COUNT) <= p_VA_END || $past(r_VERT_COUNT) >= p_VA_END + p_VERTICAL_FRONT_PORCH + p_VERTICAL_SYNC_WIDTH)
			begin
				assert(o_VSYNC == 1);
			end
			else
			begin
				if($past(r_VERT_COUNT) >= p_VA_END + p_VERTICAL_FRONT_PORCH  && $past(r_VERT_COUNT) < p_VA_END + p_VERTICAL_FRONT_PORCH + p_VERTICAL_SYNC_WIDTH)
					assert(o_VSYNC == 0);
			end
			if($past(r_HORIZ_COUNT) <= p_HA_END && $past(r_VERT_COUNT) <= p_VA_END)
			begin
				assert(o_VIDEO_DATA_ENABLE == 1);
			end
			else
			begin
				assert(o_VIDEO_DATA_ENABLE == 0);
			end
			if($past(r_HORIZ_COUNT) <= p_HA_END)
				assert(o_X_COORD == $past(r_HORIZ_COUNT));
			if($past(r_VERT_COUNT) <= p_VA_END)
				assert(o_Y_COORD == $past(r_VERT_COUNT));
			if($past(r_VERT_COUNT) == p_END_OF_SCREEN)
				assert(r_VERT_COUNT == 0);
			if($past(r_HORIZ_COUNT) == p_END_OF_LINE)
				assert(r_HORIZ_COUNT == 0);

		end
	end
`endif
endmodule
