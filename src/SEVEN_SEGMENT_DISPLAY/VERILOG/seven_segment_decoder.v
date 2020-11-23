`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/07/2018 03:32:01 PM
// Design Name: 
// Module Name: ssd_dec
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
module seven_segment_decoder(
    input wire [3:0] i_NUM,
    output reg [6:0] o_CATHODES
    );
    
  
always@(*)
begin
    case(i_NUM)
         4'b0000://0
         begin 
             o_CATHODES = 7'b1000000;
         end
         4'b0001://1
         begin 
             o_CATHODES = 7'b1111001;
         end
         4'b0010://2
         begin 
             o_CATHODES = 7'b0100100;
         end
         4'b0011://3
         begin  
             o_CATHODES = 7'b0110000;
         end
         4'b0100://4
         begin 
             o_CATHODES = 7'b0011001;
         end
         4'b0101://5
         begin   
             o_CATHODES = 7'b0010010;
         end
         4'b0110://6
         begin                         
             o_CATHODES = 7'b0000010;
         end
         4'b0111://7
         begin 
             o_CATHODES = 7'b1111000;
         end
         4'b1000://8
         begin 
             o_CATHODES = 7'b0000000;
         end
         4'b1001://9
         begin 
             o_CATHODES = 7'b0010000;
         end
         4'b1010://A
         begin   
             o_CATHODES = 7'b0001000;
         end
         4'b1011://B
         begin  
             o_CATHODES = 7'b0000011;
         end
         4'b1100://C
         begin 
             o_CATHODES = 7'b1000110;
         end
         4'b1101://D
         begin    
             o_CATHODES = 7'b0100001;
         end
         4'b1110://E
         begin       
             o_CATHODES = 7'b0000110;
         end
         4'b1111://F
         begin                     
             o_CATHODES = 7'b0001110;
         end 
    endcase  
end     
endmodule
