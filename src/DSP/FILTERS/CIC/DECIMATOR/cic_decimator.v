//THIS IS AN AUTO GENERATED FILE.
module cic_decimator (
	input wire i_CLK,
	input signed [1:0] i_DATA_IN,
	input wire i_CLK_EN,
	output reg signed [23:0] o_DATA_OUT
);

//UP/DOWNSAMPLE COUNTER
reg [6:0] r_COUNTER;
reg r_COMB_ENABLE;

//INTEGRATOR REGISTERS
reg signed [23:0] r_INT_S0;
reg signed [23:0] r_INT_S1;
reg signed [23:0] r_INT_S2;
reg signed [23:0] r_INT_S3;

//COMB REGISTERS
reg signed [23:0] r_COMB_S0;
reg signed [23:0] r_COMB_S1;
reg signed [23:0] r_COMB_S2;
reg signed [23:0] r_COMB_S3;

//COMB DELAY REGISTERS
reg signed [23:0] r_C_DELAY_S0;
reg signed [23:0] r_C_DELAY_S1;
reg signed [23:0] r_C_DELAY_S2;

//INTEGRATOR
always@(posedge i_CLK)
begin
	if(i_CLK_EN == 1)
	begin
		r_INT_S0 <= {{22{i_DATA_IN[1]}},i_DATA_IN};
		r_INT_S1 <= r_INT_S0 + r_INT_S1;
		r_INT_S2 <= r_INT_S1 + r_INT_S2;
		r_INT_S3 <= r_INT_S2 + r_INT_S3;
	end
end

//DOWNSAMPLER
always@(posedge i_CLK)
begin
	if(i_CLK_EN == 1)
	begin
		if(r_COUNTER == 62)
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
end

//COMB
always@(posedge i_CLK)
begin
	if(i_CLK_EN == 1) 
	begin
		if(r_COMB_ENABLE == 1)
		begin
			r_COMB_S0 <= r_INT_S3;
			r_C_DELAY_S0 <= r_COMB_S0;
			r_COMB_S1 <= r_COMB_S0 - r_C_DELAY_S0;
			r_C_DELAY_S1 <= r_COMB_S1;
			r_COMB_S2 <= r_COMB_S1 - r_C_DELAY_S1;
			r_C_DELAY_S2 <= r_COMB_S2;
			r_COMB_S3 <= r_COMB_S2 - r_C_DELAY_S2;
			o_DATA_OUT <= r_COMB_S3;
		end
	end
end

endmodule
