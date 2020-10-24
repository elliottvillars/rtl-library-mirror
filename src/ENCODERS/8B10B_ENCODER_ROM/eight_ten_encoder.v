module eight_ten_encoder (
	input wire i_CLK,
	input wire i_K,
	input wire [7:0] i_IN,
	output reg [9:0] o_DOUT,
	output reg [9:0] o_KOUT
);

reg r_CURRENT_RD;
reg r_NEXT_RD;

reg [9:0] r_ENCODED_POS;
reg [9:0] r_ENCODED_NEG;
reg [9:0] r_K_ENCODED_POS;
reg [9:0] r_K_ENCODED_NEG;

always@(posedge i_CLK)
begin
	r_CURRENT_RD <= r_NEXT_RD;
end

//ROM
always@(posedge i_CLK)
begin
	if(i_K)
	begin
		case(i_IN)
			8'h1C: 
			begin
				r_K_ENCODED_NEG <= 10'b001111_0100;
				r_K_ENCODED_POS <= 10'b110000_1011;
				r_NEXT_RD <= ~r_CURRENT_RD;
			end
			8'h3C:
			begin
				r_K_ENCODED_NEG <= 10'b001111_1001;
				r_K_ENCODED_POS <= 10'b110000_0110;
				r_NEXT_RD <= ~r_CURRENT_RD;
			end
			8'h5C:
			begin
				r_K_ENCODED_NEG <= 10'b001111_0101;
				r_K_ENCODED_POS <= 10'b110000_1010;
				r_NEXT_RD <= ~r_CURRENT_RD;
			end
			8'h7C:
			begin
				r_K_ENCODED_NEG <= 10'b001111_0011;
				r_K_ENCODED_POS <= 10'b110000_1100;
				r_NEXT_RD <= ~r_CURRENT_RD;
			end
			8'h9C:
			begin
				r_K_ENCODED_NEG <= 10'b001111_0010;
				r_K_ENCODED_POS <= 10'b110000_1101;
				r_NEXT_RD <= ~r_CURRENT_RD;
			end
			8'hBC:
			begin
				r_K_ENCODED_NEG <= 10'b001111_1010;
				r_K_ENCODED_POS <= 10'b110000_0101;
				r_NEXT_RD <= ~r_CURRENT_RD;
			end
			8'hDC:
			begin
				r_K_ENCODED_NEG <= 10'b001111_0110;
				r_K_ENCODED_POS <= 10'b110000_1001;
				r_NEXT_RD <= ~r_CURRENT_RD;
			end
			8'hF7:
			begin
				r_K_ENCODED_NEG <= 10'b111010_1000;
				r_K_ENCODED_POS <= 10'b000101_0111;
				r_NEXT_RD <= ~r_CURRENT_RD;
			end
			8'hFB:
			begin
				r_K_ENCODED_NEG <= 10'b110110_1000;
				r_K_ENCODED_POS <= 10'b001001_0111;
				r_NEXT_RD <= ~r_CURRENT_RD;
			end
			8'hFC:
			begin
				r_K_ENCODED_NEG <= 10'b001111_1000;
				r_K_ENCODED_POS <= 10'b110000_0111;
				r_NEXT_RD <= ~r_CURRENT_RD;
			end
			8'hFD:
			begin
				r_K_ENCODED_NEG <= 10'b101110_1000;
				r_K_ENCODED_POS <= 10'b010001_0111;
				r_NEXT_RD <= ~r_CURRENT_RD;
			end
			8'FE:
			begin
				r_K_ENCODED_NEG <= 10'b011110_1000;
				r_K_ENCODED_POS <= 10'b100001_0111;
				r_NEXT_RD <= ~r_CURRENT_RD;
			end
		endcase
	end
	else
	begin
	end
end


always@(posedge i_CLK)
begin
	//TODO: Add K Codes
	if(r_CURRENT_RD)
		o_OUT <= r_ENCODED_POS;
	else
		o_OUT <= r_ENCODED_NEG;
end


endmodule
