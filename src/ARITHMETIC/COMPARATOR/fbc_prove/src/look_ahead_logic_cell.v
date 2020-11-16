//Fig 4 for this paper:
//https://sci-hub.tw/10.1109/eait.2012.6408016
module look_ahead_logic_cell (
	input wire [3:0] i_OPERAND_A,
	input wire [3:0] i_OPERAND_B,
	output wire [3:0] o_CMP_RESULT
);

wire w_TEMP_WIRE_3;
wire w_TEMP_WIRE_2;
wire w_TEMP_WIRE_1;
wire w_TEMP_WIRE_0;

assign w_TEMP_WIRE_3 = i_OPERAND_A[3] ^ i_OPERAND_B[3];
assign w_TEMP_WIRE_2 = i_OPERAND_A[2] ^ i_OPERAND_B[2];
assign w_TEMP_WIRE_1 = i_OPERAND_A[1] ^ i_OPERAND_B[1];
assign w_TEMP_WIRE_0 = i_OPERAND_A[0] ^ i_OPERAND_B[0];

assign o_CMP_RESULT[3] = w_TEMP_WIRE_3;
assign o_CMP_RESULT[2] = ~w_TEMP_WIRE_3 & w_TEMP_WIRE_2;
assign o_CMP_RESULT[1] = ~w_TEMP_WIRE_3 & ~w_TEMP_WIRE_2 & w_TEMP_WIRE_1;
assign o_CMP_RESULT[0] = ~w_TEMP_WIRE_3 & ~w_TEMP_WIRE_2 & ~w_TEMP_WIRE_1 & w_TEMP_WIRE_0;

`ifdef FORMAL
	always@(*)
	begin
		if(i_OPERAND_A[3] ^ i_OPERAND_B[3] == 1'b1)
			assert(o_CMP_RESULT[3]);
		else
			assert(~o_CMP_RESULT[3]);
		if(i_OPERAND_A[3] == i_OPERAND_B[3] && i_OPERAND_A[2] != i_OPERAND_B[2])
			assert(o_CMP_RESULT[2]);
		else
			assert(~o_CMP_RESULT[2]);
		if(i_OPERAND_A[3] == i_OPERAND_B[3] && i_OPERAND_A[2] == i_OPERAND_B[2] && i_OPERAND_A[1] != i_OPERAND_B[1])
			assert(o_CMP_RESULT[1]);
		else
			assert(~o_CMP_RESULT[1]);
		if(i_OPERAND_A[3] == i_OPERAND_B[3] && i_OPERAND_A[2] == i_OPERAND_B[2] && 
			i_OPERAND_A[1] == i_OPERAND_B[1] && i_OPERAND_A[0] != i_OPERAND_B[0])
			assert(o_CMP_RESULT[0]);
		else
			assert(~o_CMP_RESULT[0]);

		//if(i_OPERAND_A[3] == i_OPERAND_B[3] && i_OPERAND_A[2] != i_OPERAND_B[2])
			//assert(o_CMP_RESULT[2]);
		//if(i_OPERAND_A[3] == i_OPERAND_B[3] && i_OPERAND_A[1] != i_OPERAND_B[1])
			//assert(o_CMP_RESULT[1]);
		//if(i_OPERAND_A[3] == i_OPERAND_B[3] && i_OPERAND_A[0] != i_OPERAND_B[0])
			//assert(o_CMP_RESULT[0]);
	end
`endif
endmodule
