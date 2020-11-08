module three_four_encoder (
	input wire i_RD_IN,
	input wire i_KIN,
	input wire i_USE_ALT,
	input wire [2:0] i_HGF,
	output reg o_RD_OUT,
	output reg [3:0] o_FGHJ
);

//RDIN determins what word to go with
//RDOUT is determine by what word was selected

reg [3:0] w_PRERESULT;
always@(*) //Control 
begin
	//assume rd negative
	case(i_HGF)
		3'd0:
		begin	
		w_PRERESULT = 4'b0010;
		o_RD_OUT = ~i_RD_IN;
		end
		3'd1:
		begin
		w_PRERESULT = 4'b1001;
		o_RD_OUT = i_RD_IN;
		end
		3'd2:
		begin
		w_PRERESULT = 4'b0101;
		o_RD_OUT = i_RD_IN;
		end
	endcase

	o_FGHJ = (i_RD_IN) ? w_PRERESULT : ~w_PRERESULT;
end
endmodule
