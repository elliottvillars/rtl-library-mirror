module cla (
	input wire [3:0] i_INPUT_A,
	input wire [3:0] i_INPUT_B,
	input wire i_CIN,
	output wire o_COUT,
	output reg [3:0] o_RESULT
);
reg [3:0] r_PROPAGATE;
reg [3:0] r_GENERATE;
reg [3:0] r_CARRY;


always@(*)
begin
	r_PROPAGATE[0] = i_INPUT_A[0] ^ i_INPUT_B[0];
	r_PROPAGATE[1] = i_INPUT_A[1] ^ i_INPUT_B[1];
	r_PROPAGATE[2] = i_INPUT_A[2] ^ i_INPUT_B[2];
	r_PROPAGATE[3] = i_INPUT_A[3] ^ i_INPUT_B[3];

	r_GENERATE[0] = i_INPUT_A[0] & i_INPUT_B[0];
	r_GENERATE[1] = i_INPUT_A[1] & i_INPUT_B[1];
	r_GENERATE[2] = i_INPUT_A[2] & i_INPUT_B[2];
	r_GENERATE[3] = i_INPUT_A[3] & i_INPUT_B[3];

	r_CARRY[0] = r_GENERATE[0] | r_PROPAGATE[0] & i_CIN;
	r_CARRY[1] = r_GENERATE[1] | r_PROPAGATE[1] & r_CARRY[0];
	r_CARRY[2] = r_GENERATE[2] | r_PROPAGATE[2] & r_CARRY[1];
	r_CARRY[3] = r_GENERATE[3] | r_PROPAGATE[3] & r_CARRY[2];

	o_COUT = r_CARRY[3];

	o_RESULT = r_PROPAGATE ^ r_CARRY;

end
endmodule
