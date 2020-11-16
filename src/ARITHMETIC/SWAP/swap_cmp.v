module swap_cmp #(parameter p_DATA_WIDTH = 32)(
	input wire i_CLK,
	input wire [p_DATA_WIDTH-1:0] i_A,
	input wire [p_DATA_WIDTH-1:0] i_B,
	output reg o_SWAPPED,
	output reg [p_DATA_WIDTH-1:0] o_A,
	output reg [p_DATA_WIDTH-1:0] o_B
);

always@(posedge i_CLK)
begin
	if(i_A >= i_B)
	begin
		o_SWAPPED <= 0;
		o_A <= i_A;
		o_B <= i_B;
	end
	else
	begin
		o_SWAPPED <= 1;
		o_A <= i_B;
		o_B <= i_A;
	end
end

endmodule
