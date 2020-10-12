module uart_transmitter (
	input wire i_CLK,
	input wire i_RESET,
	input wire i_TX_ENABLE,
	input wire [7:0] i_DATA_IN,
	output reg o_TX_BUSY,
	output reg o_TX
);

localparam s_IDLE 	= 2'd0;
localparam s_START_TX 	= 2'd1;
localparam s_TRANSMIT 	= 2'd2;
localparam s_STOP_TX 	= 2'd3;

reg [1:0] r_CURRENT_STATE;
reg [1:0] r_NEXT_STATE;
reg [2:0] r_BIT_COUNT;
reg [7:0] r_DATA_REG;

initial 
begin
	r_CURRENT_STATE = 2'd0;
	r_NEXT_STATE 	= 2'd0;
	r_BIT_COUNT 	= 3'd0;
	r_DATA_REG 	= 8'd0;
end
always@(*)
begin
	case(r_CURRENT_STATE)
		s_IDLE:
		begin
			if(i_TX_ENABLE == 1'b1)
				r_NEXT_STATE = s_START_TX;
			else
				r_NEXT_STATE = s_IDLE;
		end
		s_START_TX:
			r_NEXT_STATE = s_TRANSMIT;
		s_TRANSMIT:
		begin
			if(r_BIT_COUNT == 3'd7)
				r_NEXT_STATE = s_STOP_TX;
			else
				r_NEXT_STATE = s_TRANSMIT;
		end
		s_STOP_TX:
			r_NEXT_STATE = s_IDLE;

	endcase
end

always@(posedge i_CLK)
begin
	if(i_RESET == 1'b1)
		r_CURRENT_STATE <= s_IDLE;
	else
	begin
		r_CURRENT_STATE <= r_NEXT_STATE;
	end
end

always@(posedge i_CLK)
begin
	if(r_CURRENT_STATE == s_TRANSMIT)
		r_BIT_COUNT <= r_BIT_COUNT + 1'b1;
	else
		r_BIT_COUNT <= 3'd0;
end

always@(posedge i_CLK)
begin
	case(r_CURRENT_STATE)
		s_IDLE:
		begin
			r_DATA_REG <= i_DATA_IN;
			o_TX <= 1'b1;
			o_TX_BUSY <= 1'b0;
		end
		s_START_TX:
		begin
			r_DATA_REG <= r_DATA_REG;
			o_TX <= 1'b0;
			o_TX_BUSY <= 1'b1;
		end
		s_TRANSMIT:
		begin
			r_DATA_REG <= r_DATA_REG;
			o_TX <= r_DATA_REG[r_BIT_COUNT];
			o_TX_BUSY <= 1'b1;
		end
		s_STOP_TX:
		begin
			r_DATA_REG <= r_DATA_REG;
			o_TX <= 1'b1;
			o_TX_BUSY <= 1'b1;
		end
	endcase
end

`ifdef FORMAL
	reg r_PAST_VALID = 0;
	always@(posedge i_CLK)
	begin
		assume($changed(i_CLK));
		assume(!i_RESET);
		assume(i_DATA_IN == 8'h8A);
		r_PAST_VALID <= 1;
		if($rose(i_CLK) && r_PAST_VALID)
		begin
			if($past(r_CURRENT_STATE) == s_IDLE)
			begin
				assert(!o_TX_BUSY);
				assert(r_DATA_REG == $past(i_DATA_IN));
			end
			else
			begin
				assert(o_TX_BUSY);
			end
			if($past(r_CURRENT_STATE) == s_START_TX)
				assert(!o_TX);
			if($past(r_CURRENT_STATE) == s_TRANSMIT)
			begin
				assert($changed(r_BIT_COUNT));
				assert(o_TX == $past(r_DATA_REG[r_BIT_COUNT]));
			end
			cover(r_CURRENT_STATE == s_IDLE && $past(r_CURRENT_STATE) == s_STOP_TX);
		end
	end
`endif
endmodule
