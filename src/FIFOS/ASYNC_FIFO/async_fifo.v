
module async_fifo #(parameter p_ADDRESS_WIDTH = 2, parameter p_DATA_WIDTH = 8)(
	input wire i_CLK_WRITE,
	input wire i_CLK_READ,
	input wire i_RESET,
	input wire i_WRITE_REQUEST,
	input wire i_READ_REQUEST,
	input wire [p_DATA_WIDTH-1:0] i_INPUT,
	output reg o_FIFO_EMPTY,
	output reg o_FIFO_FULL,
	output reg o_FIFO_ALMOST_EMPTY,
	output reg o_FIFO_ALMOST_FULL,
	output reg [p_DATA_WIDTH-1:0] o_OUTPUT
);

//TODO: Perform QA pass and reverify.
reg [p_ADDRESS_WIDTH-1:0] r_WRITE_POINTER;
reg [p_ADDRESS_WIDTH-1:0] r_READ_POINTER;
reg [p_DATA_WIDTH-1:0] r_MEMORY [0:2**p_ADDRESS_WIDTH-1];
reg [p_ADDRESS_WIDTH-1:0] r_QUANTITY;

reg [p_ADDRESS_WIDTH-1:0] r_WRITE_POINTER_SYNC_1;
reg [p_ADDRESS_WIDTH-1:0] r_WRITE_POINTER_SYNC_2;

reg [p_ADDRESS_WIDTH-1:0] r_READ_POINTER_SYNC_1;
reg [p_ADDRESS_WIDTH-1:0] r_READ_POINTER_SYNC_2;

reg [p_ADDRESS_WIDTH-1:0] r_WRITE_PTR_GRAY;
reg [p_ADDRESS_WIDTH-1:0] r_READ_PTR_GRAY;

parameter p_ALMOST_FULL_FLAG  = 1;
parameter p_ALMOST_EMPTY_FLAG = 1;

localparam lp_EMPTY = 0;

assign o_FIFO_EMPTY = r_READ_PTR_GRAY == r_WRITE_POINTER_SYNC_2 ? 1 : 0;
//assign o_FIFO_FULL = r_WRITE_POINTER == r_READ_POINTER_SYNC_2
initial 
begin
	r_WRITE_POINTER = 0;
	r_READ_POINTER 	= 0;
	r_QUANTITY 	= 0;
end

always@(posedge i_CLK_WRITE)
begin
	r_WRITE_POINTER <= r_WRITE_POINTER + i_WRITE_REQUEST;
	r_WRITE_PTR_GRAY <= r_WRITE_POINTER ^ (r_WRITE_POINTER >> 1);
	r_READ_POINTER_SYNC_1 <= r_READ_PTR_GRAY;
	r_READ_POINTER_SYNC_2 <= r_READ_POINTER_SYNC_1;
	r_MEMORY[r_WRITE_POINTER] <= i_INPUT;
end

always@(posedge i_CLK_READ)
begin
	r_READ_POINTER <= r_READ_POINTER + i_READ_REQUEST;
	r_READ_PTR_GRAY <= r_READ_POINTER ^ (r_READ_POINTER >> 1);
	r_WRITE_POINTER_SYNC_1 <= r_WRITE_PTR_GRAY;
	r_WRITE_POINTER_SYNC_2 <= r_WRITE_POINTER_SYNC_1;
	o_OUTPUT <= r_MEMORY[r_READ_POINTER];
end


endmodule
