module rad4_booth_32 (
	input wire signed [31:0] i_X, //MULTIPLICAND
	input wire signed [31:0] i_Y, //MULTIPLIER
	output reg signed [63:0] o_P0,
	output reg signed [63:0] o_P1,
	output reg signed [63:0] o_P2,
	output reg signed [63:0] o_P3,
	output reg signed [63:0] o_P4,
	output reg signed [63:0] o_P5,
	output reg signed [63:0] o_P6,
	output reg signed [63:0] o_P7,
	output reg signed [63:0] o_P8,
	output reg signed [63:0] o_P9,
	output reg signed [63:0] o_P10,
	output reg signed [63:0] o_P11,
	output reg signed [63:0] o_P12,
	output reg signed [63:0] o_P13
);

wire signed [32:0] w_EXTENDED_Y;
//Maybe make 64 bits?
wire signed [63:0] w_Z;
wire signed [63:0] w_M;
wire signed [63:0] w_2M;
wire signed [63:0] w_NOT_M;
wire signed [63:0] w_NOT_2M;

wire [2:0] w_SWITCH_BITS [0:13];

assign w_EXTENDED_Y = {i_Y,1'b0};
assign w_Z = 64'd0;
assign w_M = {{32{i_X[0]}},i_X};
assign w_2M = w_M << 1;
assign w_NOT_M = ~w_M + 1'b1;
assign w_NOT_2M = w_NOT_M << 1;


genvar i;
generate
	for(i = 1; i < 32; i = i + 2)
	begin
		assign w_SWITCH_BITS[i-1] = {w_EXTENDED_Y[i+1],w_EXTENDED_Y[i],w_EXTENDED_Y[i-1]};
	end
endgenerate

always@(*)
begin
	case(w_SWITCH_BITS[0])
		3'b000: o_P0 = w_Z;
		3'b001: o_P0 = w_M;
		3'b010: o_P0 = w_M;
		3'b011: o_P0 = w_2M;
		3'b100: o_P0 = w_NOT_2M;
		3'b101: o_P0 = w_NOT_M;
		3'b110: o_P0 = w_M;
		3'b111: o_P0 = w_Z;
	endcase
end
always@(*)
begin
	case(w_SWITCH_BITS[1])
		3'b000: o_P1 = w_Z;
		3'b001: o_P1 = w_M;
		3'b010: o_P1 = w_M;
		3'b011: o_P1 = w_2M;
		3'b100: o_P1 = w_NOT_2M;
		3'b101: o_P1 = w_NOT_M;
		3'b110: o_P1 = w_M;
		3'b111: o_P1 = w_Z;
	endcase
end
always@(*)
begin
	case(w_SWITCH_BITS[2])
		3'b000: o_P2 = w_Z;
		3'b001: o_P2 = w_M;
		3'b010: o_P2 = w_M;
		3'b011: o_P2 = w_2M;
		3'b100: o_P2 = w_NOT_2M;
		3'b101: o_P2 = w_NOT_M;
		3'b110: o_P2 = w_M;
		3'b111: o_P2 = w_Z;
	endcase
end
always@(*) 
begin 
	case(w_SWITCH_BITS[3]) 
		3'b000: o_P3 = w_Z;
		3'b001: o_P3 = w_M;
		3'b010: o_P3 = w_M;
		3'b011: o_P3 = w_2M;
		3'b100: o_P3 = w_NOT_2M;
		3'b101: o_P3 = w_NOT_M;
		3'b110: o_P3 = w_M;
		3'b111: o_P3 = w_Z;
	endcase
end

always@(*) 
begin 
	case(w_SWITCH_BITS[4]) 
		3'b000: o_P4 = w_Z;
		3'b001: o_P4 = w_M;
		3'b010: o_P4 = w_M;
		3'b011: o_P4 = w_2M;
		3'b100: o_P4 = w_NOT_2M;
		3'b101: o_P4 = w_NOT_M;
		3'b110: o_P4 = w_M;
		3'b111: o_P4 = w_Z;
	endcase
end
always@(*) 
begin 
	case(w_SWITCH_BITS[5]) 
		3'b000: o_P5 = w_Z;
		3'b001: o_P5 = w_M;
		3'b010: o_P5 = w_M;
		3'b011: o_P5 = w_2M;
		3'b100: o_P5 = w_NOT_2M;
		3'b101: o_P5 = w_NOT_M;
		3'b110: o_P5 = w_M;
		3'b111: o_P5 = w_Z;
	endcase
end
always@(*) 
begin 
	case(w_SWITCH_BITS[6]) 
		3'b000: o_P6 = w_Z;
		3'b001: o_P6 = w_M;
		3'b010: o_P6 = w_M;
		3'b011: o_P6 = w_2M;
		3'b100: o_P6 = w_NOT_2M;
		3'b101: o_P6 = w_NOT_M;
		3'b110: o_P6 = w_M;
		3'b111: o_P6 = w_Z;
	endcase
end
always@(*) 
begin 
	case(w_SWITCH_BITS[7]) 
		3'b000: o_P7 = w_Z;
		3'b001: o_P7 = w_M;
		3'b010: o_P7 = w_M;
		3'b011: o_P7 = w_2M;
		3'b100: o_P7 = w_NOT_2M;
		3'b101: o_P7 = w_NOT_M;
		3'b110: o_P7 = w_M;
		3'b111: o_P7 = w_Z;
	endcase
end
always@(*) 
begin 
	case(w_SWITCH_BITS[8]) 
		3'b000: o_P8 = w_Z;
		3'b001: o_P8 = w_M;
		3'b010: o_P8 = w_M;
		3'b011: o_P8 = w_2M;
		3'b100: o_P8 = w_NOT_2M;
		3'b101: o_P8 = w_NOT_M;
		3'b110: o_P8 = w_M;
		3'b111: o_P8 = w_Z;
	endcase
end
always@(*) 
begin 
	case(w_SWITCH_BITS[9]) 
		3'b000: o_P9 = w_Z;
		3'b001: o_P9 = w_M;
		3'b010: o_P9 = w_M;
		3'b011: o_P9 = w_2M;
		3'b100: o_P9 = w_NOT_2M;
		3'b101: o_P9 = w_NOT_M;
		3'b110: o_P9 = w_M;
		3'b111: o_P9 = w_Z;
	endcase
end
always@(*) 
begin 
	case(w_SWITCH_BITS[10]) 
		3'b000: o_P10 = w_Z;
		3'b001: o_P10 = w_M;
		3'b010: o_P10 = w_M;
		3'b011: o_P10 = w_2M;
		3'b100: o_P10 = w_NOT_2M;
		3'b101: o_P10 = w_NOT_M;
		3'b110: o_P10 = w_M;
		3'b111: o_P10 = w_Z;
	endcase
end
always@(*) 
begin 
	case(w_SWITCH_BITS[11]) 
		3'b000: o_P11 = w_Z;
		3'b001: o_P11 = w_M;
		3'b010: o_P11 = w_M;
		3'b011: o_P11 = w_2M;
		3'b100: o_P11 = w_NOT_2M;
		3'b101: o_P11 = w_NOT_M;
		3'b110: o_P11 = w_M;
		3'b111: o_P11 = w_Z;
	endcase
end
always@(*) 
begin 
	case(w_SWITCH_BITS[12]) 
		3'b000: o_P12 = w_Z;
		3'b001: o_P12 = w_M;
		3'b010: o_P12 = w_M;
		3'b011: o_P12 = w_2M;
		3'b100: o_P12 = w_NOT_2M;
		3'b101: o_P12 = w_NOT_M;
		3'b110: o_P12 = w_M;
		3'b111: o_P12 = w_Z;
	endcase
end
always@(*) 
begin 
	case(w_SWITCH_BITS[13]) 
		3'b000: o_P13 = w_Z;
		3'b001: o_P13 = w_M;
		3'b010: o_P13 = w_M;
		3'b011: o_P13 = w_2M;
		3'b100: o_P13 = w_NOT_2M;
		3'b101: o_P13 = w_NOT_M;
		3'b110: o_P13 = w_M;
		3'b111: o_P13 = w_Z;
	endcase
end
endmodule
