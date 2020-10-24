module lfsr #(parameter p_BITS_PER_CLOCK = 8,
	      parameter p_RESET_SEED = 16'hFFFF,
	      parameter p_POLYNOMIAL = 16'b1000_0000_0001_1100)
(
	input wire i_CLK,
	input wire i_RESET,
	input wire [p_BITS_PER_CLOCK-1:0] i_DATA_IN, //Data to be scrambled, if applicable
	output reg [p_BITS_PER_CLOCK-1:0] o_DATA_OUT
);

// verilator lint_off UNOPTFLAT
//

reg [15:0] data_next;
assign data_next = o_DATA_OUT;
genvar i;
generate
	for(i = 0; i < p_BITS_PER_CLOCK; i = i + 1)
	begin
	end
endgenerate


always@(posedge i_CLK)
begin
	if(i_RESET)
		o_DATA_OUT <= 16'hFFFF;
	else
		o_DATA_OUT <= data_next ^ i_DATA_IN;
end
endmodule
