`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/19/2018 05:39:21 PM
// Design Name: 
// Module Name: stopwatch_ssd_driver
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


module stopwatch_ssd_driver(
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 i_CLK CLK" *)
    input i_CLK, 
    input i_RESET,
    input i_CLK_EN,
    input i_SRST,
    output [3:0] o_Digit_1_val,
    output [3:0] o_Digit_2_val,
    output [3:0] o_Digit_3_val,
    output [3:0] o_Digit_4_val
    );
       parameter DISPLAY_MODE = 9;//Override with either 9 or 15 for decimal or hex mode respectively.
       reg [3:0] r_DISPLAY_MODE = 4'b0000;
       reg [3:0] r_Digit_1_val = 4'b0000;
       reg [3:0] r_Digit_2_val = 4'b0000;
       reg [3:0] r_Digit_3_val = 4'b0000;
       reg [3:0] r_Digit_4_val = 4'b0000;
       reg r_D3_EN = 1'd0;
       reg r_D2_EN = 1'd0;
       reg r_D1_EN = 1'd0;
       wire w_SUBCLK;
       wire w_RST;
       wire w_CLK_EN;
       wire w_SRST;
       assign w_SRST = i_SRST;
       assign w_CLK_EN = i_CLK_EN;
       assign o_Digit_1_val = r_Digit_1_val;
       assign o_Digit_2_val = r_Digit_2_val;
       assign o_Digit_3_val = r_Digit_3_val;
       assign o_Digit_4_val = r_Digit_4_val;
       
        
        
        
    always@(posedge i_CLK) 
    begin
        r_DISPLAY_MODE <= DISPLAY_MODE; //verilog bullshit.
         
        if(i_RESET == 1'b1 | w_SRST == 1'b1)
            begin
               r_Digit_1_val <= 4'd0;
               r_Digit_2_val <= 4'd0;
               r_Digit_3_val <= 4'd0;
               r_Digit_4_val <= 4'd0; 
            end               
        else
            begin
                if(w_CLK_EN == 1'd1)
                begin 
		//TODO:FINISH ME
                end
                else
                    begin
                    r_Digit_1_val <= r_Digit_1_val;
                    r_Digit_2_val <= r_Digit_2_val;
                    r_Digit_3_val <= r_Digit_3_val;
                    r_Digit_4_val <= r_Digit_4_val;         
                    end     
            end
   end
endmodule
