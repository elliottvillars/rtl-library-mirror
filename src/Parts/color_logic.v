`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/01/2018 08:45:12 PM
// Design Name: 
// Module Name: color_logic
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


module color_logic(
input i_CLK,
input [1:0] i_SEL,
input i_VDE,
input [9:0] i_X_COORD,
input [9:0] i_Y_COORD,
output [7:0] o_RED,
output [7:0] o_GREEN,
output [7:0] o_BLUE

    );
    parameter v_HA_START = 0;
    parameter v_VA_START = 0;
    parameter v_HA_END = 640;
    parameter v_VA_END = 480;
    
    wire w_CLK;
    wire [1:0] w_SEL;
    wire [9:0] w_X_COORD;
    wire [9:0] w_Y_COORD;
    reg [7:0] r_RED = 8'b00000000;
    reg [7:0] r_GREEN = 8'b00000000;
    reg [7:0] r_BLUE = 8'b00000000;
    reg [9:0] r_SHIFT = 10'd0;
    reg [7:0] r_RENDER = 8'd0;
    
    assign w_CLK = i_CLK;
    assign w_SEL = i_SEL;
    assign w_X_COORD = i_X_COORD;
    assign w_Y_COORD = i_Y_COORD;
    assign o_RED = r_RED;
    assign o_GREEN = r_GREEN;
    assign o_BLUE = r_BLUE;
    
    always@(posedge w_CLK)
    begin
    if(i_VDE == 1'b1)
        begin
            case(i_SEL)
                2'b00: 
                    begin
                        r_RED = 8'b00001111;
                        r_GREEN = 8'b00001101;
                        r_BLUE = 8 'b00001010;
                    end
                2'b01:
                    begin
                        r_RED = (((w_X_COORD >= 310 && w_X_COORD <= 330) && (w_Y_COORD >= 0 && w_Y_COORD <= v_VA_END)) ||
                         (w_X_COORD >= v_HA_START && w_X_COORD <= v_HA_END && w_Y_COORD >= 230 && w_Y_COORD <= 250)) ? 4'b1111 : 4'd0;
                        r_GREEN = 8'd0;
                        r_BLUE = 8'd0;
                    end
                 2'b10:
                    begin
                     r_RED = 8'd0;
                     r_GREEN = (w_X_COORD >= 0 + r_SHIFT && w_X_COORD <= 5 + r_SHIFT && w_Y_COORD >= 230 && w_Y_COORD <= 235 ) ? 4'b1111 : 4'd0;
                    end
                default:
                    begin
                        r_RED = 8'b00000000;  
                        r_GREEN = 8'b00000000;
                        r_BLUE = 8 'b00000000;
                    end
            endcase 
            
        end 
     else
        begin
            r_RED = 8'b00000000;
            r_GREEN = 8'b00000000;
            r_BLUE = 8 'b00000000;
            
        end       
    end  
    
    always@(negedge i_VDE)
    begin
        if(r_RENDER == 255) 
            begin
                r_RENDER = 8'd0;
                if (r_SHIFT <= 639)
                    r_SHIFT = r_SHIFT + 1'b1;
                else
                    r_SHIFT = 10'd0;
            end
        else
            r_RENDER = r_RENDER + 1'b1;
    end
//         2'b01: begin
//                if((w_X_COORD >= v_HA_START + 200 && w_X_COORD <= v_HA_END - 400))begin //|(w_X_COORD >= v_HA_START + 400 && w_X_COORD <= v_HA_END - 400))begin
//                    if(w_Y_COORD >= v_VA_START + 400 && w_Y_COORD <= v_VA_END-200)begin
//                    r_RED = 8'b00001111;
//                    r_BLUE = 8'b00001001;
//                    r_GREEN = 8'b00000100;
//                    end
//                end
//            else
//                begin
//                    r_RED = 8'b00000000;
//                    r_BLUE = 8'b00000000;
//                    r_GREEN = 8'b00000000;
//                end 
//                end  

endmodule
