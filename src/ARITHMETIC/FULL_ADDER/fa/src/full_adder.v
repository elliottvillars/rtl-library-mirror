module full_adder (
	input wire i_A,
	input wire i_B,
	input wire i_Cin,
	output reg o_S,
	output reg o_Cout
);

always@(*)
begin
	o_S = i_A ^ i_B ^ i_Cin;
	o_Cout = (i_A & i_B) | (i_A ^ i_B) & i_Cin;
end

`ifdef FORMAL

	wire [2:0] fw_incat;
	assign fw_incat = {i_A,i_B,i_Cin};
	always@(*)
	begin
		if(fw_incat == 1 || fw_incat == 2 || fw_incat == 4 || fw_incat == 7)
			assert(o_S);
		else
			assert(~o_S);
		if(fw_incat == 6 || fw_incat == 5 || fw_incat == 3 || fw_incat == 7)
			assert(o_Cout);
		else
			assert(~o_Cout);
	end
`endif
endmodule
