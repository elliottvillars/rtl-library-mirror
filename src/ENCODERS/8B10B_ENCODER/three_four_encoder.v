module three_four_encoder (
	input wire i_RD_IN,
	input wire i_KIN,
	input wire i_USE_ALT_NEG,
	input wire i_USE_ALT_POS,
	input wire [2:0] i_HGF,
	output reg o_RD_OUT,
	output reg [3:0] o_FGHJ
);

//RDIN determins what word to go with
//RDOUT is determine by what word was selected

reg [3:0] r_INTERIM_NEG;
reg [3:0] r_INTERIM_POS;
wire w_USE_ALT;
assign w_USE_ALT = (i_RD_IN & i_USE_ALT_POS) | (~i_RD_IN & i_USE_ALT_NEG);
always@(*) 
begin
	if(i_KIN)
	begin
		case(i_HGF)
			3'd0:
			begin
				o_RD_OUT = ~i_RD_IN;
				r_INTERIM_NEG = 4'b1011;
				r_INTERIM_POS = 4'b0100;
			end
			3'd1:
			begin
				o_RD_OUT = ~i_RD_IN;
				r_INTERIM_NEG = 4'b0110;
				r_INTERIM_POS = 4'b1001;
			end
			3'd2:
			begin
				o_RD_OUT = ~i_RD_IN;
				r_INTERIM_NEG = 4'b1010;
				r_INTERIM_POS = 4'b0101;
			end
			3'd3:
			begin
				o_RD_OUT = ~i_RD_IN;
				r_INTERIM_NEG = 4'b1100;
				r_INTERIM_POS = 4'b0011;
			end
			3'd4:
			begin
				o_RD_OUT = ~i_RD_IN;
				r_INTERIM_NEG = 4'b1101;
				r_INTERIM_POS = 4'b0010;
			end
			3'd5:
			begin
				o_RD_OUT = ~i_RD_IN;
				r_INTERIM_NEG = 4'b0101;
				r_INTERIM_POS = 4'b1010;
			end
			3'd6:
			begin
				o_RD_OUT = ~i_RD_IN;
				r_INTERIM_NEG = 4'b1001;
				r_INTERIM_POS = 4'b0110;
			end
			3'd7:
			begin
				o_RD_OUT = ~i_RD_IN;
				r_INTERIM_NEG = 4'b0111;
				r_INTERIM_POS = 4'b1000;
			end
		endcase
	end
	else
	begin
		case(i_HGF)
			3'd0:
			begin
				o_RD_OUT = ~i_RD_IN;
				r_INTERIM_NEG = 4'b1011;
				r_INTERIM_POS = 4'b0100;
			end
			3'd1:
			begin
				o_RD_OUT = i_RD_IN;
				r_INTERIM_NEG = 4'b1001;
				r_INTERIM_POS = 4'b1001;
			end
			3'd2:
			begin
				o_RD_OUT = i_RD_IN;
				r_INTERIM_NEG = 4'b0101;
				r_INTERIM_POS = 4'b0101;
			end
			3'd3:
			begin
				o_RD_OUT = ~i_RD_IN;
				r_INTERIM_NEG = 4'b1100;
				r_INTERIM_POS = 4'b0011;
			end
			3'd4:
			begin
				o_RD_OUT = ~i_RD_IN;
				r_INTERIM_NEG = 4'b1101;
				r_INTERIM_POS = 4'b0010;
			end
			3'd5:
			begin
				o_RD_OUT = i_RD_IN;
				r_INTERIM_NEG = 4'b1010;
				r_INTERIM_POS = 4'b1010;
			end
			3'd6:
			begin
				o_RD_OUT = i_RD_IN;
				r_INTERIM_NEG = 4'b0110;
				r_INTERIM_POS = 4'b0110;
			end
			3'd7:
			begin
				if(w_USE_ALT) 
				begin
					o_RD_OUT = ~i_RD_IN;
					r_INTERIM_NEG = 4'b0111;
					r_INTERIM_POS = 4'b1000;
				end
				else
				begin
					o_RD_OUT = ~i_RD_IN;
					r_INTERIM_NEG = 4'b1110;
					r_INTERIM_POS = 4'b0001;
				end
			end
		endcase
	end

	o_FGHJ = (i_RD_IN) ? r_INTERIM_POS : r_INTERIM_NEG;
end
endmodule
