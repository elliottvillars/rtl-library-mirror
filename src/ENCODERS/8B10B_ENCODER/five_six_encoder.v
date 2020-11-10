module five_six_encoder (
	input wire [4:0] i_EDCBA,
	input wire i_RD_IN,
	input wire i_K_IN,
	output reg o_USE_ALT_POS,
	output reg o_USE_ALT_NEG,
	output reg o_RD_OUT,
	output reg [5:0] o_ABCDEI
);

reg [5:0] w_INTERIM_NEG;
reg [5:0] w_INTERIM_POS;

always@(*)
begin
	if(i_K_IN) 
	begin
		case(i_EDCBA)
			5'd23:
			begin
				o_RD_OUT = ~i_RD_IN;
				w_INTERIM_NEG = 6'b111010;
				w_INTERIM_POS = 6'b000101;
			end
			5'd27:
			begin
				o_RD_OUT = ~i_RD_IN;
				w_INTERIM_NEG = 6'b110110;
				w_INTERIM_POS = 6'b001001;
			end
			5'd28:
			begin
				o_RD_OUT = ~i_RD_IN;
				w_INTERIM_NEG = 6'b001111;
				w_INTERIM_POS = 6'b110000;
			end
			5'd29:
			begin
				o_RD_OUT = ~i_RD_IN;
				w_INTERIM_NEG = 6'b101110;
				w_INTERIM_POS = 6'b010001;
			end
			5'd30:
			begin
				o_RD_OUT = ~i_RD_IN;
				w_INTERIM_NEG = 6'b011110;
				w_INTERIM_POS = 6'b100001;
			end
			default:
			begin
				w_INTERIM_NEG = 6'd0;
				w_INTERIM_POS = 6'b0;
			end

		endcase
	end
	else
	begin
		case(i_EDCBA)
			5'd0:
			begin
				o_RD_OUT = ~i_RD_IN;
				w_INTERIM_NEG = 6'b100111;
				w_INTERIM_POS = 6'b011000;
			end
			5'd1:
			begin
				o_RD_OUT = ~i_RD_IN;
				w_INTERIM_NEG = 6'b011101;
				w_INTERIM_POS = 6'b100010;
			end
			5'd2:
			begin
				o_RD_OUT = ~i_RD_IN;
				w_INTERIM_NEG = 6'b100111;
				w_INTERIM_NEG = 6'b011000;
			end
			5'd3:
			begin
				o_RD_OUT = i_RD_IN;
				w_INTERIM_NEG = 6'b110001;
				w_INTERIM_POS = 6'b110001;
			end
			5'd4:
			begin
				o_RD_OUT = ~i_RD_IN;
				w_INTERIM_NEG = 6'b110101;
				w_INTERIM_POS = 6'b001010;
			end
			5'd5:
			begin
				o_RD_OUT = i_RD_IN;
				w_INTERIM_NEG = 6'b101001;
				w_INTERIM_POS = 6'b101001;
			end
			5'd6:
			begin
				o_RD_OUT = i_RD_IN;
				w_INTERIM_NEG = 6'b011001;
				w_INTERIM_POS = 6'b011001;
			end
			5'd7:
			begin
				o_RD_OUT = ~i_RD_IN;
				w_INTERIM_NEG = 6'b111000;
				w_INTERIM_POS = 6'b000111;
			end
			5'd8:
			begin
				o_RD_OUT = ~i_RD_IN;
				w_INTERIM_NEG = 6'b111001;
				w_INTERIM_POS = 6'b000110;
			end
			5'd9:
			begin
				o_RD_OUT = i_RD_IN;
				w_INTERIM_NEG = 6'b100101;
				w_INTERIM_POS = 6'b100101;
			end
			5'd10:
			begin
				o_RD_OUT = i_RD_IN;
				w_INTERIM_NEG = 6'b010101;
				w_INTERIM_POS = 6'b010101;
			end
			5'd11:
			begin
				o_RD_OUT = i_RD_IN;
				w_INTERIM_NEG = 6'b110100;
				w_INTERIM_POS = 6'b110100;
			end
			5'd12:
			begin
				o_RD_OUT = i_RD_IN;
				w_INTERIM_NEG = 6'b001101;
				w_INTERIM_POS = 6'b001101;
			end
			5'd13:
			begin
				o_RD_OUT = i_RD_IN;
				w_INTERIM_NEG = 6'b101100;
				w_INTERIM_POS = 6'b101100;
			end
			5'd14:
			begin
				o_RD_OUT = i_RD_IN;
				w_INTERIM_NEG = 6'b011100;
				w_INTERIM_POS = 6'b011100;
			end
			5'd15:
			begin
				o_RD_OUT = ~i_RD_IN;
				w_INTERIM_NEG = 6'b010111;
				w_INTERIM_POS = 6'b101000;
			end
			5'd16:
			begin
				o_RD_OUT = ~i_RD_IN;
				w_INTERIM_NEG = 6'b011011;
				w_INTERIM_POS = 6'b100100;
			end
			5'd17:
			begin
				o_RD_OUT = i_RD_IN;
				w_INTERIM_NEG = 6'b100011;
				w_INTERIM_POS = 6'b100011;
			end
			5'd18:
			begin
				o_RD_OUT = i_RD_IN;
				w_INTERIM_NEG = 6'b010011;
				w_INTERIM_POS = 6'b010011;
			end	
			5'd19:
			begin
				o_RD_OUT = i_RD_IN;
				w_INTERIM_NEG = 6'b110010;
				w_INTERIM_POS = 6'b110010;
			end
			5'd20:
			begin
				o_RD_OUT = i_RD_IN;
				w_INTERIM_NEG = 6'b001011;
				w_INTERIM_POS = 6'b001011;
			end
			5'd21:
			begin
				o_RD_OUT = i_RD_IN;
				w_INTERIM_NEG = 6'b101010;
				w_INTERIM_POS = 6'b101010;
			end
			5'd22:
			begin
				o_RD_OUT = i_RD_IN;
				w_INTERIM_NEG = 6'b011010;
				w_INTERIM_POS = 6'b011010;
			end
			5'd23:
			begin
				o_RD_OUT = ~i_RD_IN;
				w_INTERIM_NEG = 6'b111010;
				w_INTERIM_POS = 6'b000101;
			end
			5'd24:
			begin
				o_RD_OUT = ~i_RD_IN;
				w_INTERIM_NEG = 6'b110011;
				w_INTERIM_POS = 6'b001100;
			end
			5'd25:
			begin
				o_RD_OUT = i_RD_IN;
				w_INTERIM_NEG = 6'b100110;
				w_INTERIM_POS = 6'b100110;
			end
			5'd26:
			begin
				o_RD_OUT = i_RD_IN;
				w_INTERIM_NEG = 6'b010110;
				w_INTERIM_POS = 6'b010110;
			end
			5'd27:
			begin
				o_RD_OUT = ~i_RD_IN;
				w_INTERIM_NEG = 6'b110110;
				w_INTERIM_POS = 6'b001001;
			end
			5'd28:
			begin
				o_RD_OUT = i_RD_IN;
				w_INTERIM_NEG = 6'b001110;
				w_INTERIM_POS = 6'b001110;
			end
			5'd29:
			begin
				o_RD_OUT = ~i_RD_IN;
				w_INTERIM_NEG = 6'b101110;
				w_INTERIM_POS = 6'b010001;
			end
			5'd30:
			begin
				o_RD_OUT = ~i_RD_IN;
				w_INTERIM_NEG = 6'b011110;
				w_INTERIM_POS = 6'b100001;
			end
			5'd31:
			begin
				o_RD_OUT = ~i_RD_IN;
				w_INTERIM_NEG = 6'b101011;
				w_INTERIM_POS = 6'b010100;
			end
		endcase
	end
	o_ABCDEI = (~i_RD_IN) ? w_INTERIM_NEG : w_INTERIM_POS;
end
always@(*)
begin
	case(i_EDCBA)
		5'd11:
		begin
			o_USE_ALT_NEG = 0;
			o_USE_ALT_POS = 1;
		end
		5'd13:
		begin
			o_USE_ALT_NEG = 0;
			o_USE_ALT_POS = 1;
		end
		5'd14:
		begin
			o_USE_ALT_NEG = 0;
			o_USE_ALT_POS = 1;
		end
		5'd17:
		begin
			o_USE_ALT_NEG = 1;
			o_USE_ALT_POS = 0;
		end
		5'd18:
		begin
			o_USE_ALT_NEG = 1;
			o_USE_ALT_POS = 0;
		end
		5'd20:
		begin
			o_USE_ALT_NEG = 1;
			o_USE_ALT_POS = 0;
		end
		default:
		begin
			o_USE_ALT_NEG = 0;
			o_USE_ALT_POS = 0;
		end
	endcase
end
endmodule
