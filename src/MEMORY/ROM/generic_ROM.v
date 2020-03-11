
module generic_ROM #(parameter p_ADDR_WIDTH = 4,parameter p_DATA_WIDTH = 8)(
	input wire i_CLK,
	input wire i_READ_ENABLE,
	input wire [p_ADDR_WIDTH-1:0] i_ADDRESS,
	output reg [p_DATA_WIDTH-1:0] o_DATA
);

reg [p_DATA_WIDTH-1:0] r_ROM [0:2**p_ADDR_WIDTH-1];

initial $readmemh("ROM.bin",r_ROM);

always@(posedge i_CLK)
begin
	if(i_READ_ENABLE == 1'b1)
		o_DATA <= r_ROM[i_ADDRESS];
	else
		o_DATA <= {p_DATA_WIDTH{1'b0}};

end
endmodule
