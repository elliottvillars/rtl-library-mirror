`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/23/2019 01:31:45 PM
// Design Name: 
// Module Name: Debounce_RTM
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


module Debounce_RTM(
    input i_CLK,
    input i_RST,
    input i_Signal,
    output o_Assert
    );
    localparam s_WAIT = 2'd0;
    localparam s_SAMPLING = 2'd1;
    localparam s_ASSERT = 2'd2;
    localparam s_TEARDOWN = 2'd3; //Get ready  for next input
    reg [1:0] r_SAMPLE = 2'd0;
    reg [1:0] r_NEXT_STATE = 2'd0;
    reg [1:0] r_CURRENT_STATE = 2'd0;
    reg r_Assert = 1'd0;
    wire w_CLK;
    wire w_RST;
    wire w_Signal;
    
    assign w_CLK = i_CLK;
    assign w_RST = i_RST;
    assign w_Signal = i_Signal;
    assign o_Assert = r_Assert;
    
    always@(*)
    begin
        case(r_CURRENT_STATE)
            s_WAIT:
                    begin
                        if(w_Signal == 1'd1)
                            r_NEXT_STATE <= s_SAMPLING;
                        else
                        begin
                            
                            r_NEXT_STATE <= s_WAIT;
                        end
                    end
            s_SAMPLING:
                    begin
                        if(w_Signal == 1'd1) 
                        begin
                            if(r_SAMPLE == 2'd3)
                                r_NEXT_STATE <= s_ASSERT;
                            else
                                r_NEXT_STATE <= s_SAMPLING;
                         end
                         else
                            r_NEXT_STATE <= s_WAIT;
                    end
            s_ASSERT:
                    begin
                        r_NEXT_STATE <= s_TEARDOWN;
                    end
            s_TEARDOWN:
                    begin
                        if(w_Signal == 1'd0) 
                        begin
                            if(r_SAMPLE == 2'd3)
                                r_NEXT_STATE <= s_WAIT;
                            else
                                r_NEXT_STATE <= s_TEARDOWN;
                        end
                        else
                            r_NEXT_STATE <= s_ASSERT;
                    end
             default: r_NEXT_STATE <= s_WAIT;
        endcase
    end
    //insert reset sometime.
    always@(posedge w_CLK)
    begin
        if((r_CURRENT_STATE == s_SAMPLING) || (r_CURRENT_STATE == s_TEARDOWN))
            r_SAMPLE <= r_SAMPLE + 1'd1;
        else
            r_SAMPLE <= 2'd0;    
    end
    always@(posedge w_CLK)
    begin
        if((r_CURRENT_STATE == s_ASSERT) || (r_CURRENT_STATE == s_TEARDOWN))
            r_Assert <= 1'd1;
        else
            r_Assert <= 1'd0;
    end
    
    always@(posedge w_CLK or posedge w_RST)
    begin
        if(w_RST == 1'd1)
            r_CURRENT_STATE <= s_WAIT;
        else
            r_CURRENT_STATE <= r_NEXT_STATE;
    end   
endmodule
