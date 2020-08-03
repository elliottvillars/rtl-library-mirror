//from Fig 3 of : https://sci-hub.tw/10.2478/jee-2015-0054
`default_nettype none
module boundary_nibble_encoder (
	input wire [7:0] i_ZEROED_NIBBLES,
	output wire o_INVALID,
	output wire [2:0] o_Y
);

wire w_N0,w_N1,w_N2,w_N3,w_N4,w_N5,w_N6,w_N7,w_N8,w_N9,w_N10,w_N11;

assign w_N0 = ~(i_ZEROED_NIBBLES[0] & i_ZEROED_NIBBLES[1]); 
assign w_N1 = ~(i_ZEROED_NIBBLES[2] & i_ZEROED_NIBBLES[3]); 
assign w_N2 = ~(w_N0 | w_N1); 

assign w_N3 = ~(i_ZEROED_NIBBLES[4] & i_ZEROED_NIBBLES[5]); 
assign w_N4 = ~(i_ZEROED_NIBBLES[6] & i_ZEROED_NIBBLES[7]); 
assign w_N5 = ~(w_N3 | w_N4); 

assign o_INVALID = (w_N2 & w_N5);

assign w_N6 = ~(~i_ZEROED_NIBBLES[6] & i_ZEROED_NIBBLES[5]);
assign w_N7 = (i_ZEROED_NIBBLES[0] & i_ZEROED_NIBBLES[2] & i_ZEROED_NIBBLES[4]); 
assign w_N8 = ~(w_N6 & w_N7); 

assign w_N9 = ~(~i_ZEROED_NIBBLES[2] & i_ZEROED_NIBBLES[1]); 
assign w_N10 = ~(i_ZEROED_NIBBLES[3] & i_ZEROED_NIBBLES[1]); 
assign w_N11 = ~(i_ZEROED_NIBBLES[0] & w_N9 & w_N10); 

assign o_Y[2] = w_N2; 
assign o_Y[1] = ~((~w_N1 & w_N3) | w_N0); 
assign o_Y[0] = ~(w_N8 & w_N11); 

`ifdef FORMAL
	always@(*)
	begin
		if(i_ZEROED_NIBBLES == 8'd255)
		begin
			assert(o_INVALID == 1'b1);
			assert(o_Y == 3'b111);
		end
		else
		begin
			assert(o_INVALID == 1'b0);
			//Equivalence check to the equations described in the
			//linked paper.
			if(i_ZEROED_NIBBLES[3:0] == 4'b1111)
				assert(o_Y[2] == 1'b1);
			else
				assert(o_Y[2] == 1'b0);
			if(i_ZEROED_NIBBLES[0] & i_ZEROED_NIBBLES[1] &
				(~i_ZEROED_NIBBLES[2] | ~i_ZEROED_NIBBLES[3] | 
				(i_ZEROED_NIBBLES[4] & i_ZEROED_NIBBLES[5])) == 1'b1)
				assert(o_Y[1] == 1'b1);
			else
				assert(o_Y[1] == 1'b0);
			if(i_ZEROED_NIBBLES[0] & 
				(~i_ZEROED_NIBBLES[1] | i_ZEROED_NIBBLES[2] & ~i_ZEROED_NIBBLES[3]) |
				(i_ZEROED_NIBBLES[0] & i_ZEROED_NIBBLES[2] & i_ZEROED_NIBBLES[4] &
				(~i_ZEROED_NIBBLES[5] | i_ZEROED_NIBBLES[6])))
				assert(o_Y[0] == 1'b1);
			else
				assert(o_Y[0] == 1'b0); 

		end
	end
`endif
endmodule
