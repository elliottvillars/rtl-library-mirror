module wishbone_slv_std_mm #(
	parameter p_DATA_WIDTH = 32,
	localparam lp_ADDR_WIDTH = $clog2(p_DATA_WIDTH)
        )
	(
	input wire i_CLK_I,
	input wire i_RST_I,
	input wire [lp_ADDR_WIDTH-1:0] i_ADR_I,
	input wire [p_DATA_WIDTH-1:0] i_DAT_I,
	output reg [p_DATA_WIDTH-1:0] o_DAT_O,
	input wire i_WE_I,
	input wire [p_DATA_WIDTH-1:0] i_SEL_I,
	input wire i_STB_I, //Selected Slave
	output reg o_ACK_O, //Indicates end of bus cycle
	input wire i_CYC_I, //Indicates start of bus cycle
	input wire [p_DATA_WIDTH-1:0] i_TAGN_I,
	output reg [p_DATA_WIDTH-1:0] o_TAGN_O,
	output reg o_ERR_O,
	output reg o_RTY_O
);

reg [31:0] r_MEM [0:31]; //Placeholder memory

always@(posedge i_CLK_I)
begin
	if(i_RST_I)
	begin
		o_DAT_O <= 0;
		o_ACK_O <= 0;
		o_RTY_O <= 0;
		o_ERR_O <= 0;
		o_TAGN_O <= 0;
	end
	else
	begin
		case({i_WE_I,i_CYC_I,i_STB_I})
			3'b011:
			begin
				o_ACK_O <= 1; //CHECK
				o_RTY_O <= 0;
				o_ERR_O <= 0;
				o_DAT_O <= r_MEM[i_ADR_I];
			end
			3'b111:
			begin
				o_ACK_O <= 1; //CHECK
				o_RTY_O <= 0;
				o_ERR_O <= 0;
				r_MEM[i_ADR_I] <= i_DAT_I & i_SEL_I;
			end
			default:
			begin
				o_DAT_O <= 0;
				o_ACK_O <= 0;
				o_RTY_O <= 0;
				o_ERR_O <= 0;
				o_TAGN_O <= 0;
			end
		endcase
	end
end

//USER LOGIC HERE
//
////////////////
endmodule
