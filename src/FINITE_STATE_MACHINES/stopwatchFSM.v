`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/06/2018 12:44:02 AM
// Design Name: 
// Module Name: stopwatchFSM
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
module stopwatchFSM(
	input wire i_START,
	input wire i_STOP,
	input wire i_INC,
	input wire i_RST,
	input wire i_CLK, //usually 1KHz
	output reg o_ENABLE
);
localparam s_RESET = 2'b00; //reset
localparam s_START = 2'b01;//start
localparam s_STOP = 2'b10; //stop
localparam s_INCREMENT = 2'b11; //inc

reg [1:0] r_CURRENT_STATE = s_RESET;
reg [1:0] r_NEXT_STATE;

always@(*)
begin
	case(r_CURRENT_STATE)
		s_RESET:
		begin
			if(i_START == 1'b1)
			begin
				r_NEXT_STATE = s_START;
			end
			else if(i_INC == 1'b1)
			begin
				r_NEXT_STATE = s_INCREMENT;
			end
			else
				r_NEXT_STATE = s_RESET;   
		end
		s_START:
		begin
			if(i_STOP == 1'b1)
			begin
				r_NEXT_STATE = s_STOP;
			end
			else
			begin
				r_NEXT_STATE = s_START;
			end   
		end
		s_STOP:
		begin
			if(i_START == 1'b1)
			begin
				r_NEXT_STATE = s_START;
			end
			else if(i_INC == 1'b1)
			begin
				r_NEXT_STATE = s_INCREMENT;
			end
			else
			begin
				r_NEXT_STATE = s_STOP;
			end                            
		end
		s_INCREMENT:
		begin
			if(i_INC == 1'b0)
				r_NEXT_STATE = s_STOP;
			else
			begin
				r_NEXT_STATE = s_INCREMENT;
			end
		end 
		default:
			r_NEXT_STATE = s_RESET;  
	endcase
end

always@(posedge i_CLK,posedge i_RST)
begin
	if(i_RST == 1'b1)
		r_CURRENT_STATE <= s_RESET;
	else
		r_CURRENT_STATE <= r_NEXT_STATE;
end

always@(posedge i_CLK)
begin
	if(r_CURRENT_STATE == s_START || r_CURRENT_STATE == s_INCREMENT)
		o_ENABLE <= 1'b1;
	else
		o_ENABLE <= 1'b0;
end
endmodule
