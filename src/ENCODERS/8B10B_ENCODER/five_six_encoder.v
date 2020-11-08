module five_six_encoder (
	input wire [4:0] i_EDCBA,
	input wire i_RD_IN,
	output reg o_USE_ALT,
	output reg o_RD_OUT,
	output reg [5:0] o_ABCDEI
);

reg [5:0] w_INTERIM_NEG;
reg [5:0] w_INTERIM_POS;

always@(*)
begin
	case(i_EDCBA)
		5'b00000:
		begin
			o_RD_OUT = ~i_RD_IN;
			w_INTERIM_NEG = 6'b100111;
			w_INTERIM_POS = 6'b011000;
		end
		5'b00001:
		begin
			o_RD_OUT = ~i_RD_IN;
			w_INTERIM_NEG = 6'b011101;
			w_INTERIM_POS = 6'b100010;
		end
		5'b00010:
		begin
			o_RD_OUT = ~i_RD_IN;
			w_INTERIM_NEG = 6'b100111;
			w_INTERIM_NEG = 6'b011000;
		end
		5'b00011:
		begin
			o_RD_OUT = i_RD_IN;
			w_INTERIM_NEG = 6'b110001;
			w_INTERIM_POS = 6'b110001;
		end
		5'b00100:
		begin
			o_RD_OUT = ~i_RD_IN;
			w_INTERIM_NEG = 6'b110101;
			w_INTERIM_POS = 6'b001010;
		end
		5'b00101:
		begin
			o_RD_OUT = i_RD_IN;
			w_INTERIM_NEG = 6'b101001;
			w_INTERIM_POS = 6'b101001;
		end
		5'b00110:
		begin
			o_RD_OUT = i_RD_IN;
			w_INTERIM_NEG = 6'b011001;
			w_INTERIM_POS = 6'b011001;
		end
		5'b00111:
		begin
			o_RD_OUT = ~i_RD_IN;
			w_INTERIM_NEG = 6'b111000;
			w_INTERIM_POS = 6'b000111;
		end
		5'b01000:
		begin
			o_RD_OUT = ~i_RD_IN;
			w_INTERIM_NEG = 6'b111001;
			w_INTERIM_POS = 6'b000110;
		end
	endcase
	o_ABCDEI = (~i_RD_IN) ? w_INTERIM_NEG : w_INTERIM_POS;
end
endmodule
