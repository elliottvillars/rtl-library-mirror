module fp_mult_sp (
       input wire i_CLK,
       input wire signed [31:0] i_A,
       input wire signed [31:0] i_B,
       output reg signed [31:0] o_RES
);

localparam lp_MANT_LSB = 26;
localparam lp_BIAS = 127;
reg r_SIGN_0;
reg r_SIGN_1;
reg r_SIGN_2;

reg [7:0] r_EXPONENT_0;
reg [7:0] r_EXPONENT_1;
reg [7:0] r_EXPONENT_2;

reg [47:0] r_MANTISSA_0;
reg [47:0] r_MANTISSA_1;
reg [22:0] r_MANTISSA_2;
always@(posedge i_CLK)
begin
	r_SIGN_0 <= i_A[31] ^ i_B[31];
	r_SIGN_1 <= r_SIGN_0;
	r_SIGN_2 <= r_SIGN_1;

	r_EXPONENT_0 <= i_A[30:23] + i_B[30:23];
	r_EXPONENT_1 <= r_EXPONENT_0 - lp_BIAS;

	r_MANTISSA_0 <= {1'b1,i_A[22:0]} * {1'b1,i_B[22:0]}; //
	
	//NORMALIZE
	if(r_MANTISSA_0[47] == 1)
	begin
		r_MANTISSA_1 <= r_MANTISSA_0 >> 1;
		r_EXPONENT_2 <= r_EXPONENT_1 + 1;
	end
	else
	begin
		r_MANTISSA_1 <= r_MANTISSA_0;
		r_EXPONENT_2 <= r_EXPONENT_1;
	end
	//GUARD & (LSB | ROUND | STICKY)
	if(r_MANTISSA_1[22] && (r_MANTISSA_1[23] || |r_MANTISSA_1[21:0]))
		r_MANTISSA_2 <= r_MANTISSA_1[45:23] + 1'b1;
	else
		r_MANTISSA_2 <= r_MANTISSA_1[45:23];


	o_RES <= {r_SIGN_2,r_EXPONENT_2,r_MANTISSA_2};

	//TODO: Test
	////TODO: handle round propagation and add signals


end
endmodule
