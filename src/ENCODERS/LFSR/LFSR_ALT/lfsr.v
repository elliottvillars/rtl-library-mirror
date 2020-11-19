module lfsr #(parameter p_BITS_PER_CLOCK = 16,
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

reg [(p_BITS_PER_CLOCK * 2) - 7:0] poly;
reg [(p_BITS_PER_CLOCK * 2) - 7:0] scram;
reg [(p_BITS_PER_CLOCK-1) : 0] tmp;
assign o_DATA_OUT = tmp;
reg bitt;
integer i;
always@(*)
begin
	poly = scram;
	for(i = 0; i < p_BITS_PER_CLOCK; i = i + 1)
	begin
		bitt = i_DATA_IN[i] ^ poly[15] ^ poly[4] ^ poly[3] ^ poly[2];
		poly = {poly[(p_BITS_PER_CLOCK * 2) - 8 : 0],bitt};
		tmp[i] = bitt;
	end
end

always@(posedge i_CLK)
begin
	if(i_RESET)
		scram <= 26'hffffff;
	else
		scram <= poly;
end
endmodule
