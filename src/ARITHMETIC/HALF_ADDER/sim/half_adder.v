module half_adder (
	input wire i_A,
	input wire i_B,
	output reg o_S,
	output reg o_Cout
);

always@(*)
begin
	o_S = i_A ^ i_B;
	o_Cout = i_A & i_B;
end
endmodule
