module convround #(parameter p_WORD_WIDTH = 8)(
	input wire [p_WORD_WIDTH-1:0] i_INPUT,
	output reg [p_WORD_WIDTH/2 - 1:0] o_OUTPUT
);

localparam lp_LSB = p_WORD_WIDTH / 2;
wire w_GUARD_BIT;
wire w_STICKY_BIT;
//TODO: add more parameters
assign w_GUARD_BIT = i_INPUT[lp_LSB-1];
assign w_STICKY_BIT = |i_INPUT[lp_LSB-2:0];
assign w_ROUND_UP = w_GUARD_BIT & (i_INPUT[lp_LSB] | w_STICKY_BIT);

always@(*)
begin
	if(w_ROUND_UP)
		o_OUTPUT = i_INPUT[p_WORD_WIDTH-1:lp_LSB] + 1'b1; //round up
	else
		o_OUTPUT = i_INPUT[p_WORD_WIDTH-1:lp_LSB]; //round down / truncate
end
endmodule
