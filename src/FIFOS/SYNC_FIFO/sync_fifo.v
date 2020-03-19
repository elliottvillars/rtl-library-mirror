module sync_fifo #(parameter p_FIFO_DEPTH = 8, parameter p_DATA_WIDTH = 8)(
	input wire i_CLK,
	input wire i_WRITE_REQUEST,
	input wire i_READ_REQUEST,
	input wire i_INPUT,
	output reg o_FIFO_EMPTY,
	input wire o_FIFO_FULL,
	output reg o_OUTPUT
);

reg r_WRITE_POINTER;
reg r_READ_POINTER;
reg r_MEMORY;

always@(posedge i_CLK)
begin
	if(i_READ_REQUEST == 1 && o_FIFO_EMPTY == 0)
	if(i_WRITE_REQUEST == 1 && o_FIFO_FULL == 0);
end
endmodule
