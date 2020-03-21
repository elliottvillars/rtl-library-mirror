
module lattice_ecp5_8k_sp_bram_wrapper(
	input wire i_CLK,
	input wire i_CLK_EN,
	input wire i_WRITE_EN,
	input wire [2:0] i_CHIP_SELECT,
	input wire i_RESET,
	input wire [17:0] i_DATA_IN,
	input wire [12:0] i_ADDRESS_IN,
	output reg [17:0] o_DATA_OUT
);


SP8KA ram_unit(
	.CE(i_CLK_EN),
	.CLK(i_CLK),
	.WE(i_WRITE_EN),
	.CS(i_CHIP_SELECT),
	.DI(i_DATA_IN),
	.AD(i_ADDRESS_IN),
	.DO(o_DATA_OUT)
);
endmodule
