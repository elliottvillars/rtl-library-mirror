module cic_decimator (
	input wire i_CLK,
	input wire i_DATA_IN,
	output reg o_DATA_OUT
);

//TODO create program to generate filter.

reg [3:0] r_DEC_COUNT;
reg r_COMB_ENABLE;
reg r_DATA_IN;
reg r_INT_S1;
reg r_INT_S2;
reg r_COMB_S1;
reg r_COMB_S2;
reg r_C_DELAY_S1;
reg r_C_DELAY_S2;

//Integrator
always@(posedge i_CLK)
begin
	r_DATA_IN <= i_DATA_IN;
	r_INT_S1 <= r_DATA_IN + r_INT_S1;
	r_INT_S2 <= r_INT_S1 + r_INT_S2;
end



//Downsampler
always@(posedge i_CLK)
begin
	if(r_DEC_COUNT == 10)
	begin
		r_DEC_COUNT <= 0;
		r_COMB_ENABLE <= 1;
	end
	else
	begin
		r_DEC_COUNT <= r_DEC_COUNT + 1;
		r_COMB_ENABLE <= 0;
	end
end

//COMB
always@(posedge i_CLK)
begin
	if(r_COMB_ENABLE == 1)
	begin
		r_C_DELAY_S1 <= r_INT_S2;
		r_COMB_S1 <= r_INT_S2 - r_C_DELAY_S1;
		r_C_DELAY_S2 <= r_COMB_S1;
		r_COMB_S2 <= r_COMB_S1 - r_C_DELAY_S2;
		//r_adadada <= x - r_C_DELAY_S2;
		o_DATA_OUT <= r_COMB_S2;
	end
end
endmodule
