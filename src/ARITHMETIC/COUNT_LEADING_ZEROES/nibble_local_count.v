`default_nettype none
module nibble_local_count (
	input wire [3:0] i_INPUT_NIBBLE,
	output wire o_ALL_ZEROS, //this would be a_i 
	output wire [1:0] o_ZERO_COUNT //this would be Z_i
);

wire Z_0;
wire Z_1;
assign o_ALL_ZEROS = ~(i_INPUT_NIBBLE[3] | i_INPUT_NIBBLE[2] | i_INPUT_NIBBLE[1] | i_INPUT_NIBBLE[0]);
assign o_ZERO_COUNT = {Z_1,Z_0};
assign Z_1 = ~(i_INPUT_NIBBLE[3] | i_INPUT_NIBBLE[2]);
assign Z_0 = ~((~i_INPUT_NIBBLE[2] & i_INPUT_NIBBLE[1]) | i_INPUT_NIBBLE[3]);

`ifdef FORMAL
	always@(*)
	begin
		case(i_INPUT_NIBBLE)
			4'h0:
			begin
				assert(o_ALL_ZEROS == 1'b1);
				assert(o_ZERO_COUNT == 2'b11);
			end
			4'h1:
			begin
				assert(o_ALL_ZEROS == 1'b0);
				assert(o_ZERO_COUNT == 2'b11);
			end
			4'h2:
			begin
				assert(o_ALL_ZEROS == 1'b0);
				assert(o_ZERO_COUNT == 2'b10);
			end
			4'h3:
			begin
				assert(o_ALL_ZEROS == 1'b0);
				assert(o_ZERO_COUNT == 2'b10);
			end
			4'h4:
			begin
				assert(o_ALL_ZEROS == 1'b0);
				assert(o_ZERO_COUNT == 2'b01);
			end
			4'h5:
			begin
				assert(o_ALL_ZEROS == 1'b0);
				assert(o_ZERO_COUNT == 2'b01);
			end
			4'h6:
			begin
				assert(o_ALL_ZEROS == 1'b0);
				assert(o_ZERO_COUNT == 2'b01);
			end
			4'h7:
			begin
				assert(o_ALL_ZEROS == 1'b0);
				assert(o_ZERO_COUNT == 2'b01);
			end
			default:
			begin
				assert(o_ALL_ZEROS == 1'b0);
				assert(o_ZERO_COUNT == 2'b00);
			end
		endcase
	end
	
`endif
endmodule
