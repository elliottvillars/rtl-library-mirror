`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/02/2019 12:45:04 AM
// Design Name: 
// Module Name: BCD_Counter
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


module BCD_Counter #(parameter DISPLAY_MODE = "DECIMAL")(
    input i_CLK,
    input i_RST,
    input i_CLK_EN,
    output [3:0] o_OUT,
    output o_NEXT_CLK_EN
    );
    
    localparam MAX_VALUE = (DISPLAY_MODE == "DECIMAL") ? 4'd9 : 
                           (DISPLAY_MODE == "HEXEDECIMAL") ? 4'd15 : 4'd9; //Set mode
    wire w_CLK;
    wire w_RST;
    wire  w_CLK_EN;
    reg [3:0] r_OUT = 4'b0000;
    reg r_NEXT_CLK_EN = 1'b0;
   
   assign w_CLK = i_CLK;
   assign w_RST = i_RST;
   assign w_CLK_EN = i_CLK_EN;
   assign o_OUT = r_OUT;
   assign o_NEXT_CLK_EN = r_NEXT_CLK_EN;
   
   
    always@(posedge w_CLK,posedge w_RST)
    begin
        if(w_RST == 1'b1)
            begin
                r_OUT <= 4'b0000;
            end
        else if(r_OUT >= MAX_VALUE)
            begin
                r_OUT <= 4'b0000;
            end
        else if(w_CLK_EN == 1'b1)
            begin
                r_OUT <= r_OUT + 1'b1;
            end
        else
           begin
                r_OUT <= r_OUT;
           end 
    end 
    
    always@(posedge i_CLK)
    begin
        if((r_OUT == (MAX_VALUE - 1) && (w_CLK_EN == 1'b1))) //Issue next clk enable 1 clk cycle earlier and only when clk en is high.
            r_NEXT_CLK_EN <= 1'b1;
        else
            r_NEXT_CLK_EN <= 1'b0;    
    end
endmodule
