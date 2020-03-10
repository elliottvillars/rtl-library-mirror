`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/09/2018 12:05:58 AM
// Design Name: 
// Module Name: timer_ssd_driver
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


module timer_ssd_driver(
 input i_SUBCLK, 
   input i_RST,
   output [3:0] o_Digit_1_val,
   output [3:0] o_Digit_2_val,
   output [3:0] o_Digit_3_val,
   output [3:0] o_Digit_4_val
   );
      parameter c_HEX_DEC = 9;//Override with either 9 or 15 for decimal or hex mode respectively.
      reg [3:0] r_HEX_DEC;
      reg [3:0] r_Digit_1_val;
      reg [3:0] r_Digit_2_val;
      reg [3:0] r_Digit_3_val;
      reg [3:0] r_Digit_4_val;
      wire w_SUBCLK;
      wire w_RST;

      assign w_SUBCLK = i_SUBCLK;
      assign w_RST = i_RST;
      assign o_Digit_1_val = r_Digit_1_val;
      assign o_Digit_2_val = r_Digit_2_val;
      assign o_Digit_3_val = r_Digit_3_val;
      assign o_Digit_4_val = r_Digit_4_val;
      

   always@(posedge w_SUBCLK,posedge w_RST) 
   begin
       r_HEX_DEC <= c_HEX_DEC; //verilog bullshit.
       if(w_RST == 1'b1)
           begin
              r_Digit_1_val <= r_HEX_DEC;
              r_Digit_2_val <= r_HEX_DEC;
              r_Digit_3_val <= r_HEX_DEC;
              r_Digit_4_val <= r_HEX_DEC;
           end               
       else
           begin     
               if(r_Digit_4_val <= 4'd0)
                   begin
                       r_Digit_4_val <= r_HEX_DEC;
                       if(r_Digit_3_val <= 4'd0)
                           begin
                               r_Digit_3_val <= r_HEX_DEC;
                               if(r_Digit_2_val <= 4'd0)
                                   begin
                                       r_Digit_2_val <= r_HEX_DEC;
                                       if(r_Digit_1_val <= 4'd0)
                                           r_Digit_1_val <= r_HEX_DEC;
                                       else
                                           r_Digit_1_val <= r_Digit_1_val - 4'd1;
                                   end
                               else
                                   r_Digit_2_val <= r_Digit_2_val - 4'd1;
                           end
                       else
                           r_Digit_3_val <= r_Digit_3_val - 4'd1;  
                   end
               else
                   r_Digit_4_val <= r_Digit_4_val - 4'd1;             
           end     
   end

  
endmodule
