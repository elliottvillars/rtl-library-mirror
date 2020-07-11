module shifter_32 (
	input wire i_CLK,
	input wire [31:0] i_INPUT,
	input wire [4:0] i_SHIFT_AMOUNT,
	output reg [31:0] o_RESULT
);

always@(posedge i_CLK)
begin
	o_RESULT <= i_INPUT << i_SHIFT_AMOUNT;
end

endmodule
