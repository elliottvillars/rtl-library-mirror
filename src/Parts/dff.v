`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/26/2018 11:31:27 AM
// Design Name: 
// Module Name: dff
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


module dff(
    input i_CLK,
    input i_RST,
    input i_D,
    output o_Q
    );
    reg w_Q;
    assign o_Q = w_Q;
    always@(posedge(i_CLK),posedge(i_RST)) //DONT FORGET THE RESET SIGNAL IN SENSITIVITY LIST.
    begin
        if(i_RST == 1)
            w_Q <= 1'b0;
        else
           w_Q <= i_D;
    end
endmodule
