//THIS IS AN AUTO GENERATED FILE.
module cic_decimator (
	input wire i_CLK,
	input signed [63:0] i_DATA_IN,
	output reg signed [63:0] o_DATA_OUT
);

//UP/DOWNSAMPLE COUNTER
reg [7:0] r_COUNTER;
reg r_COMB_ENABLE;

//INTEGRATOR REGISTERS
reg signed [63:0] r_INT_S0;
reg signed [63:0] r_INT_S1;
reg signed [63:0] r_INT_S2;
reg signed [63:0] r_INT_S3;
reg signed [63:0] r_INT_S4;
reg signed [63:0] r_INT_S5;
reg signed [63:0] r_INT_S6;
reg signed [63:0] r_INT_S7;
reg signed [63:0] r_INT_S8;
reg signed [63:0] r_INT_S9;

//COMB REGISTERS
reg signed [63:0] r_COMB_S0;
reg signed [63:0] r_COMB_S1;
reg signed [63:0] r_COMB_S2;
reg signed [63:0] r_COMB_S3;
reg signed [63:0] r_COMB_S4;
reg signed [63:0] r_COMB_S5;
reg signed [63:0] r_COMB_S6;
reg signed [63:0] r_COMB_S7;
reg signed [63:0] r_COMB_S8;
reg signed [63:0] r_COMB_S9;

//COMB DELAY REGISTERS
reg signed [63:0] r_C_DELAY_S0;
reg signed [63:0] r_C_DELAY_S1;
reg signed [63:0] r_C_DELAY_S2;
reg signed [63:0] r_C_DELAY_S3;
reg signed [63:0] r_C_DELAY_S4;
reg signed [63:0] r_C_DELAY_S5;
reg signed [63:0] r_C_DELAY_S6;
reg signed [63:0] r_C_DELAY_S7;
reg signed [63:0] r_C_DELAY_S8;

//INTEGRATOR
always@(posedge i_CLK)
begin
	r_INT_S0 <= i_DATA_IN;
	r_INT_S1 <= r_INT_S0 + r_INT_S1;
	r_INT_S2 <= r_INT_S1 + r_INT_S2;
	r_INT_S3 <= r_INT_S2 + r_INT_S3;
	r_INT_S4 <= r_INT_S3 + r_INT_S4;
	r_INT_S5 <= r_INT_S4 + r_INT_S5;
	r_INT_S6 <= r_INT_S5 + r_INT_S6;
	r_INT_S7 <= r_INT_S6 + r_INT_S7;
	r_INT_S8 <= r_INT_S7 + r_INT_S8;
	r_INT_S9 <= r_INT_S8 + r_INT_S9;
end

//DOWNSAMPLER
always@(posedge i_CLK)
begin
	if(r_COUNTER == 126)
	begin
		r_COUNTER <= 0;
		r_COMB_ENABLE <= 1;
	end
	else
	begin
		r_COUNTER <= r_COUNTER + 1'b1;
		r_COMB_ENABLE <= 0;
	end
end

//COMB
always@(posedge i_CLK)
begin
	if(r_COMB_ENABLE == 1)
	begin
		r_COMB_S0 <= r_INT_S9;
		r_C_DELAY_S0 <= r_COMB_S0;
		r_COMB_S1 <= r_COMB_S0 - r_C_DELAY_S0;
		r_C_DELAY_S1 <= r_COMB_S1;
		r_COMB_S2 <= r_COMB_S1 - r_C_DELAY_S1;
		r_C_DELAY_S2 <= r_COMB_S2;
		r_COMB_S3 <= r_COMB_S2 - r_C_DELAY_S2;
		r_C_DELAY_S3 <= r_COMB_S3;
		r_COMB_S4 <= r_COMB_S3 - r_C_DELAY_S3;
		r_C_DELAY_S4 <= r_COMB_S4;
		r_COMB_S5 <= r_COMB_S4 - r_C_DELAY_S4;
		r_C_DELAY_S5 <= r_COMB_S5;
		r_COMB_S6 <= r_COMB_S5 - r_C_DELAY_S5;
		r_C_DELAY_S6 <= r_COMB_S6;
		r_COMB_S7 <= r_COMB_S6 - r_C_DELAY_S6;
		r_C_DELAY_S7 <= r_COMB_S7;
		r_COMB_S8 <= r_COMB_S7 - r_C_DELAY_S7;
		r_C_DELAY_S8 <= r_COMB_S8;
		r_COMB_S9 <= r_COMB_S8 - r_C_DELAY_S8;
		o_DATA_OUT <= r_COMB_S9;
	end
end
endmodule
