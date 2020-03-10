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


module Accumuator(
    input i_CLK,
    input i_CLK_EN,
    input i_RST,
    input [13:0] i_DATA,
    output [13:0] o_OUT
    );
    
    wire w_CLK;
    wire w_CLK_EN;
    wire w_RST;
    wire [13:0] w_DATA;
    reg [13:0] r_OUT = 14'd0;
    
    assign w_CLK = i_CLK;
    assign w_CLK_EN = i_CLK_EN;
    assign w_RST = i_RST;
    assign w_DATA = i_DATA;
    assign o_OUT = r_OUT;
    
    always@(posedge w_CLK or posedge w_RST)
    begin
        if(w_RST == 1'b1) begin
            r_OUT <= 14'd0;
            end
        else if(w_CLK_EN == 1'b1)
            begin
            r_OUT <= r_OUT + w_DATA;
            end
        else
            begin
            r_OUT <= r_OUT; 
            end           
    end
    
endmodule
