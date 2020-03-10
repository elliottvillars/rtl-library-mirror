`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/02/2019 01:43:14 AM
// Design Name: 
// Module Name: SVD_DRIVER
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


module SVD_DRIVER(
    input i_CLK,
    input i_RST,
    input i_CLK_EN,
    output [3:0] o_DIGIT_1,
    output [3:0] o_DIGIT_2,
    output [3:0] o_DIGIT_3,
    output [3:0] o_DIGIT_4
    );
    
    
    wire w_CLK;
    wire w_RST;
    wire w_CLK_EN;
    wire CLK_EN_INTERCONNECT1;
    wire CLK_EN_INTERCONNECT2;
    wire CLK_EN_INTERCONNECT3;
    wire [3:0] w_DIGIT_1;
    wire [3:0] w_DIGIT_2;
    wire [3:0] w_DIGIT_3;
    wire [3:0] w_DIGIT_4;
    
    assign w_CLK = i_CLK;
    assign w_RST = i_RST;
    assign w_CLK_EN = i_CLK_EN;
    assign o_DIGIT_1 = w_DIGIT_1;
    assign o_DIGIT_2 = w_DIGIT_2;
    assign o_DIGIT_3 = w_DIGIT_3;
    assign o_DIGIT_4 = w_DIGIT_4;
    
    BCD_Counter #(.DISPLAY_MODE("DECIMAL"))DG4(
    .i_CLK(w_CLK),
    .i_RST(w_RST),
    .i_CLK_EN(w_CLK_EN),
    .o_OUT(w_DIGIT_4),
    .o_NEXT_CLK_EN(CLK_EN_INTERCONNECT1)
    );
    
    BCD_Counter #(.DISPLAY_MODE("DECIMAL"))DG3(
    .i_CLK(w_CLK),
    .i_RST(w_RST),
    .i_CLK_EN(CLK_EN_INTERCONNECT1),
    .o_OUT(w_DIGIT_3),
    .o_NEXT_CLK_EN(CLK_EN_INTERCONNECT2)
    );
        BCD_Counter #(.DISPLAY_MODE("DECIMAL"))DG2(
    .i_CLK(w_CLK),
    .i_RST(w_RST),
    .i_CLK_EN(CLK_EN_INTERCONNECT2),
    .o_OUT(w_DIGIT_2),
    .o_NEXT_CLK_EN(CLK_EN_INTERCONNECT3)
    );
        BCD_Counter #(.DISPLAY_MODE("DECIMAL"))DG1(
    .i_CLK(w_CLK),
    .i_RST(w_RST),
    .i_CLK_EN(CLK_EN_INTERCONNECT3),
    .o_OUT(w_DIGIT_1),
    .o_NEXT_CLK_EN()
    );
    
    
    
endmodule
