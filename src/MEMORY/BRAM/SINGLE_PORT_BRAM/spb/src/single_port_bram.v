module single_port_bram #(parameter p_ADDRESS_WIDTH = 4, parameter p_DATA_WIDTH = 8) (
	input wire i_CLK,
	input wire i_WRITE_ENABLE,
	input wire i_READ_ENABLE,
	input wire [p_ADDRESS_WIDTH-1:0] i_READ_ADDRESS,
	input wire [p_ADDRESS_WIDTH-1:0] i_WRITE_ADDRESS,
	input wire [p_DATA_WIDTH-1:0] i_WRITE_DATA,
	output reg [p_DATA_WIDTH-1:0] o_READ_DATA
);

reg [p_DATA_WIDTH-1:0] r_RAM [0:2**p_ADDRESS_WIDTH-1];

always@(posedge i_CLK) begin: READ_LOGIC
	if(i_READ_ENABLE == 1'b1)
		o_READ_DATA <= r_RAM[i_READ_ADDRESS];
	else
		o_READ_DATA <= {p_DATA_WIDTH{1'b0}};
end

always@(posedge i_CLK) begin: WRITE_LOGIC
	if(i_WRITE_ENABLE == 1'b1)
		r_RAM[i_WRITE_ADDRESS] <= i_WRITE_DATA;
	else
		r_RAM[i_WRITE_ADDRESS] <= r_RAM[i_WRITE_ADDRESS];
end

`ifdef FORMAL
	reg r_PAST_VALID = 0;
	always@(posedge i_CLK)
	begin
		r_PAST_VALID <= 1;
		assume($changed(i_CLK));
		assume(i_READ_ADDRESS != i_WRITE_ADDRESS);
		if(r_PAST_VALID == 1 && $rose(i_CLK))
		begin
			if($past(i_WRITE_ENABLE) == 1)
				assert(r_RAM[$past(i_WRITE_ADDRESS)] == $past(i_WRITE_DATA));
			else
				assert(r_RAM[i_WRITE_ADDRESS] == $past(r_RAM[i_WRITE_ADDRESS]));
			if($past(i_READ_ENABLE) == 1)
				assert(o_READ_DATA == r_RAM[$past(i_READ_ADDRESS)]);
			else
				assert(o_READ_DATA == 0);
		end

	end
`endif
endmodule
