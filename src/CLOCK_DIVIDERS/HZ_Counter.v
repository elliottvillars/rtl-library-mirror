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


module HZ_Counter(
    input wire i_CLK,
    input wire i_RST,
    input wire i_EN,
    input wire [31:0] i_DIV_VALUE,
    output reg o_ENABLE_OUT
    );
    
    //parameter c_NUM = 0; //Overide via parameter
    genvar i;

    reg [31:0] r_Count;
    always @ (posedge(i_CLK)) //Counter
    begin
        if (i_RST == 1'b1)
        begin
            r_Count <= 32'b0;
        end
        else
            begin
                if(i_EN) 
                begin
                    if (r_Count == i_DIV_VALUE - 1)
                        r_Count <= 32'b0;
                    else
                        r_Count <= r_Count + 1;
                end
                else
                    r_Count <= r_Count;
            end
    end
    
    always @ (posedge(i_CLK)) //FF with comparator
    begin
        if (i_RST == 1'b1)
            o_ENABLE_OUT <= 1'b0;
        else if (r_Count == i_DIV_VALUE - 1) // if r_Count = 49999999 flip output
            o_ENABLE_OUT <= ~o_ENABLE_OUT;
        else
            o_ENABLE_OUT <= o_ENABLE_OUT;
        end
endmodule
