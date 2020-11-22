module lfsr #(parameter p_BITS_PER_CLOCK = 8,
	      parameter p_RESET_SEED = 16'hFFFF,
	      parameter p_POLYNOMIAL = 16'b1000_0000_0001_1100)
(
	input wire i_CLK,
	input wire i_RESET,
	input wire [p_BITS_PER_CLOCK-1:0] i_DATA_IN, //Data to be scrambled, if applicable
	output wire [lp_POLY_SIZE-1:0] o_STATE_OUT,
	output reg [p_BITS_PER_CLOCK-1:0] o_DATA_OUT
);

// verilator lint_off UNOPTFLAT
localparam lp_POLY_SIZE = 16;

reg [lp_POLY_SIZE+p_BITS_PER_CLOCK-2:0] r_LFSR;

wire [lp_POLY_SIZE-1:0] w_TAP_VECTOR [0:p_BITS_PER_CLOCK-1];

wire [lp_POLY_SIZE+p_BITS_PER_CLOCK-2:0] w_RESET_VECTOR;

assign o_STATE_OUT = r_LFSR[lp_POLY_SIZE-1:0];

initial 
begin
	r_LFSR = w_RESET_VECTOR;
end

genvar i;
assign w_TAP_VECTOR[0] = p_POLYNOMIAL;
generate
	for(i = 1; i < p_BITS_PER_CLOCK; i = i + 1)
	begin
		assign  w_TAP_VECTOR[i] = (w_TAP_VECTOR[i-1] << 1) ^ (w_TAP_VECTOR[i-1][lp_POLY_SIZE-1] ? p_POLYNOMIAL : 0);
	end
endgenerate

assign w_RESET_VECTOR[lp_POLY_SIZE-1:0] = p_RESET_SEED;
generate 
	for (i = 0; i < p_BITS_PER_CLOCK - 1; i = i + 1)
	begin
		assign w_RESET_VECTOR[lp_POLY_SIZE+i] = ^(w_RESET_VECTOR[i +: lp_POLY_SIZE] & p_POLYNOMIAL);
	end
endgenerate


always@(posedge i_CLK)
begin
	if(i_RESET)
		r_LFSR[lp_POLY_SIZE-2:0] <= w_RESET_VECTOR[lp_POLY_SIZE-2:0];
	else
		r_LFSR[lp_POLY_SIZE-2:0] <= r_LFSR[lp_POLY_SIZE+p_BITS_PER_CLOCK-2:p_BITS_PER_CLOCK];
end

generate
	for (i = 0; i < p_BITS_PER_CLOCK; i = i + 1)
	begin
		always@(posedge i_CLK)
		begin
			if(i_RESET)
				r_LFSR[lp_POLY_SIZE+i-1] <= w_RESET_VECTOR[lp_POLY_SIZE+i-1];
			else
				r_LFSR[lp_POLY_SIZE+i-1] <= ^(r_LFSR[lp_POLY_SIZE+p_BITS_PER_CLOCK-2:p_BITS_PER_CLOCK-1] & w_TAP_VECTOR[i]);
		end
	end
endgenerate

always@(*)
	o_DATA_OUT = i_DATA_IN ^ r_LFSR[22:15];

endmodule
