`default_nettype none
module shifter #(parameter p_DATA_WIDTH = 4) (
	input wire [p_DATA_WIDTH-1:0] i_INPUT,
	input wire [p_SFT_AMT_WIDTH:0] i_SHIFT_AMOUNT,
	output reg [p_DATA_WIDTH-1:0] o_RESULT
);

localparam p_SFT_AMT_WIDTH = $clog2(p_DATA_WIDTH);

always@(*)
begin
	o_RESULT = i_INPUT << i_SHIFT_AMOUNT;
end

`ifdef FORMAL
`endif
endmodule
