module dual_port_bram #(parameter p_ADDRESS_WIDTH = 4, parameter p_DATA_WIDTH = 8)(
	input wire i_CLK,
	input wire i_WRITE_ENABLE_A,
	input wire i_READ_ENABLE_A,
	input wire i_WRITE_ENABLE_B,
	input wire i_READ_ENABLE_B,
	input wire [p_ADDRESS_WIDTH-1:0] i_READ_ADDRESS_A,
	input wire [p_ADDRESS_WIDTH-1:0] i_WRITE_ADDRESS_A,
	input wire [p_ADDRESS_WIDTH-1:0] i_READ_ADDRESS_B,
	input wire [p_ADDRESS_WIDTH-1:0] i_WRITE_ADDRESS_B,
	input wire [p_DATA_WIDTH-1:0] i_WRITE_DATA_A,
	output reg [p_DATA_WIDTH-1:0] o_READ_DATA_A,
	input wire [p_DATA_WIDTH-1:0] i_WRITE_DATA_B,
	output reg [p_DATA_WIDTH-1:0] o_READ_DATA_B
);

reg [p_DATA_WIDTH-1:0] r_RAM [0:2**p_ADDRESS_WIDTH-1];
always@(posedge i_CLK)
begin
	if(i_READ_ENABLE_A == 1'b1)
		o_READ_DATA_A <= r_RAM[i_READ_ADDRESS_A];
	else
		o_READ_DATA_A <= {p_DATA_WIDTH{1'b0}};
	if(i_READ_ENABLE_B == 1'b1)
		o_READ_DATA_B <= r_RAM[i_READ_ADDRESS_B];
	else
		o_READ_DATA_B <= {p_DATA_WIDTH{1'b0}};
end

always@(posedge i_CLK)
begin
	if(i_WRITE_ENABLE_A == 1'b1)
		r_RAM[i_WRITE_ADDRESS_A] <= i_WRITE_DATA_A;
	else
		r_RAM[i_WRITE_ADDRESS_A] <= r_RAM[i_WRITE_ADDRESS_A];
	if(i_WRITE_ENABLE_B == 1'b1)
		r_RAM[i_WRITE_ADDRESS_B] <= i_WRITE_DATA_B;
	else
		r_RAM[i_WRITE_ADDRESS_B] <= r_RAM[i_WRITE_ADDRESS_B];
end

`ifdef FORMAL
	reg r_PAST_VALID = 0;
	initial 
	begin	
	assume(i_CLK == 0);
	assume(i_WRITE_ENABLE_A == 0);
	assume(i_WRITE_ENABLE_B == 0);
end

always@(posedge i_CLK)
begin
	r_PAST_VALID <= 1;
	assume($changed(i_CLK));
	assume(i_READ_ADDRESS_A != i_WRITE_ADDRESS_A);
	assume(i_READ_ADDRESS_B != i_WRITE_ADDRESS_B);
	assume(i_WRITE_ADDRESS_A != i_READ_ADDRESS_B);
	assume(i_WRITE_ADDRESS_B != i_READ_ADDRESS_A);
	assume(i_WRITE_ADDRESS_A != i_WRITE_ADDRESS_B);

	if(r_PAST_VALID == 1 && $rose(i_CLK))
	begin
		if($past(i_READ_ENABLE_A) == 1)
			assert(o_READ_DATA_A == r_RAM[$past(i_READ_ADDRESS_A)]);
		else
			assert(o_READ_DATA_A == 0);
		if($past(i_READ_ENABLE_B) == 1)
			assert(o_READ_DATA_B == r_RAM[$past(i_READ_ADDRESS_B)]);
		else
			assert(o_READ_DATA_B == 0);
		if($past(i_WRITE_ENABLE_A) == 1)//FIXME
			assert(r_RAM[$past(i_WRITE_ADDRESS_A)] == $past(i_WRITE_DATA_A));
		if($past(i_WRITE_ENABLE_B) == 1)
		assert(r_RAM[$past(i_WRITE_ADDRESS_B)] == $past(i_WRITE_DATA_B));
	end

end
`endif
endmodule
