module stack #(parameter p_STACK_DEPTH = 2, parameter p_DATA_WIDTH = 8) (
	input wire i_CLK,
	input wire i_WRITE_REQUEST,
	input wire i_READ_REQUEST,
	output reg o_STACK_FULL,
	output reg o_STACK_EMPTY,
	input wire [p_DATA_WIDTH-1:0] i_INPUT,
	output reg [p_DATA_WIDTH-1:0] o_OUTPUT
);

reg [1:0] r_ADDRESS_POINTER = 0;
reg [p_DATA_WIDTH-1:0] r_MEMORY [0:p_STACK_DEPTH-1];
always@(posedge i_CLK)
begin
	if(i_WRITE_REQUEST == 1 && o_STACK_FULL == 0)
	begin
		r_MEMORY[r_ADDRESS_POINTER] <= i_INPUT;
		r_ADDRESS_POINTER <= r_ADDRESS_POINTER + 1'b1;
	end
	if(i_READ_REQUEST == 1 && o_STACK_EMPTY == 0)
	begin
		o_OUTPUT <= r_MEMORY[r_ADDRESS_POINTER];
		r_ADDRESS_POINTER <= r_ADDRESS_POINTER - 1'b1;
	end
	//TODO: finish and make good.
		

end

endmodule
