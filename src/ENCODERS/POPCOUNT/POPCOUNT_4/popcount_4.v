module popcount_4 (
	input i_CLK,
	input wire i_INVERSE, //COUNT ZEROS INSTEAD
	input wire [3:0] i_INPUT,
	output reg [2:0] o_BITCOUNT
);

reg [2:0] r_POPCOUNT;
reg [2:0] r_INVERSE_POPCOUNT;
always@(posedge i_CLK)
begin
	case(i_INPUT)
		4'd0:
		begin
			r_POPCOUNT <= 3'd0;
			r_INVERSE_POPCOUNT <= 3'd4;
		end
		4'd1,4'd2,4'd4,4'd8:
		begin
			r_POPCOUNT <= 3'd1;
			r_INVERSE_POPCOUNT <= 3'd3;
		end
		4'd3,4'd5,4'd6,4'd9,4'd10,4'd12:
		begin
			r_POPCOUNT <= 3'd2;
			r_INVERSE_POPCOUNT <= 3'd2;
		end
		4'd7,4'd11,4'd13,4'd14:
		begin
			r_POPCOUNT <= 3'd3;
			r_INVERSE_POPCOUNT <= 3'd1;
		end
		4'd15:
		begin
			r_POPCOUNT <= 3'd4;
			r_INVERSE_POPCOUNT <= 3'd0;
		end
	endcase
end

always@(posedge i_CLK)
begin
	if(i_INVERSE == 1)
		o_BITCOUNT <= r_INVERSE_POPCOUNT;
	else
		o_BITCOUNT <= r_POPCOUNT;
end

`ifdef FORMAL
	reg r_PAST_VALID = 0;
	always@(posedge i_CLK)
	begin
		assume($changed(i_CLK));
		r_PAST_VALID <= 1;
		if($rose(i_CLK) && r_PAST_VALID)
		begin
			if($past(i_INVERSE) == 1)
				assert(o_BITCOUNT == $past(r_INVERSE_POPCOUNT));
			else
				assert(o_BITCOUNT == $past(r_POPCOUNT));

			case($past(i_INPUT))
				0: 
				begin
					assert(r_POPCOUNT == 0 && r_INVERSE_POPCOUNT == 4);
				end
				1:
				begin
					assert(r_POPCOUNT == 1 && r_INVERSE_POPCOUNT == 3);
				end
				2:
				begin
					assert(r_POPCOUNT == 1 && r_INVERSE_POPCOUNT == 3);
				end
				3:
				begin
					assert(r_POPCOUNT == 2 && r_INVERSE_POPCOUNT == 2);
				end
				4:
				begin
					assert(r_POPCOUNT == 1 && r_INVERSE_POPCOUNT == 3);
				end
				5:
				begin
					assert(r_POPCOUNT == 2 && r_INVERSE_POPCOUNT == 2);
				end
				6:
				begin
					assert(r_POPCOUNT == 2 && r_INVERSE_POPCOUNT == 2);
				end
				7:
				begin
					assert(r_POPCOUNT == 3 && r_INVERSE_POPCOUNT == 1);
				end
				8:
				begin
					assert(r_POPCOUNT == 1 && r_INVERSE_POPCOUNT == 3);
				end
				9:
				begin
					assert(r_POPCOUNT == 2 && r_INVERSE_POPCOUNT == 2);
				end
				10:
				begin
					assert(r_POPCOUNT == 2 && r_INVERSE_POPCOUNT == 2);
				end
				11:
				begin
					assert(r_POPCOUNT == 3 && r_INVERSE_POPCOUNT == 1);
				end
				12:
				begin
					assert(r_POPCOUNT == 2 && r_INVERSE_POPCOUNT == 2);
				end
				13:
				begin
					assert(r_POPCOUNT == 3 && r_INVERSE_POPCOUNT == 1);
				end
				14:
				begin
					assert(r_POPCOUNT == 3 && r_INVERSE_POPCOUNT == 1);
				end
				15:
				begin
					assert(r_POPCOUNT == 4 && r_INVERSE_POPCOUNT == 0);
				end

			endcase
		end
		else
		begin
			assume($stable(i_INVERSE));
			assume($stable(i_INPUT));
		end
	end
`endif
endmodule
