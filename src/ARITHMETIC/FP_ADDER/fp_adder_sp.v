module fp_adder_sp (
	input wire i_CLK,
	input wire [31:0] i_A,
	input wire [31:0] i_B,
	output reg [31:0] o_RES
);

reg [7:0] r_EXP_DIFF;
reg [7:0] r_EXP_A;
reg [7:0] r_EXP_B;
reg [23:0] r_MANT_A;
reg [23:0] r_MANT_B;

reg [24:0] r_ARITH_RESULT;
reg r_SUB;

always@(posedge i_CLK)
begin
	r_SUB <= i_A[31] ^ i_B[31];
	r_EXP_A <= i_A[30:23];
	r_EXP_B <= i_B[30:23];
	r_MANT_A <= {1'b1,i_A[22:0]};
	r_MANT_B <= {1'b1,i_B[22:0]};
	//TODO: USE LARGER/SMALLER MANT NOT A/B

	if(r_EXP_A > r_EXP_B)
		r_EXP_DIFF <= r_EXP_A - r_EXP_B;
	else if(r_EXP_B > r_EXP_A)
		r_EXP_DIFF <= r_EXP_B - r_EXP_B;
	else
		r_EXP_DIFF <= 0;

	if(r_MANT_A > r_MANT_B)
		r_MANT_B <= r_MANT_B >> r_EXP_DIFF;
	else
		r_MANT_A <= r_MANT_A >> r_EXP_DIFF;

	r_ARITH_RESULT <= (r_SUB) ? r_MANT_A + r_MANT_B : r_MANT_A - r_MANT_B;
	if(r_ARITH_RESULT[24])
		r_ARITH_RESULT <= r_ARITH_RESULT >> 1; //INC EXP AS WELL
	
	//ROUND




end
endmodule
