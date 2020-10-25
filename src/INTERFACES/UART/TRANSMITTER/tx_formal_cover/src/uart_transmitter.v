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

//localparam lp_CLOCKS_PER_BAUD = 100_000_000 / 115200;
localparam lp_CLOCKS_PER_BAUD = 0;

reg [1:0] r_CURRENT_STATE;
reg [1:0] r_NEXT_STATE;
reg [2:0] r_BIT_COUNT;
reg [31:0] r_BAUD_COUNTER;
reg [7:0] r_DATA_REG;
reg r_STATE_CHANGE_EN;

initial 
begin
	r_CURRENT_STATE = 2'd0;
	r_NEXT_STATE 	= 2'd0;
	r_BIT_COUNT 	= 3'd0;
	r_DATA_REG 	= 8'd0;
	r_BAUD_COUNTER  = 32'd0;
	r_STATE_CHANGE_EN = 0;
end

//FIXME
always@(posedge i_CLK)
begin
	if(i_RESET)
	begin
		r_STATE_CHANGE_EN <= 0;
		r_BAUD_COUNTER <= 0;
	end
	else 
	begin
		if(r_BAUD_COUNTER == lp_CLOCKS_PER_BAUD)
		begin
			r_STATE_CHANGE_EN <= 1;
			r_BAUD_COUNTER <= 0;
		end
		else
		begin
			r_STATE_CHANGE_EN <= 0;
			r_BAUD_COUNTER <= r_BAUD_COUNTER + 1;
		end
	end

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
	if(r_CURRENT_STATE == s_TRANSMIT && r_STATE_CHANGE_EN)
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
			o_TX_BUSY <= 1'b0;
		end
	endcase
end

`ifdef FORMAL
	reg f_PAST_VALID = 0;
	(*any_const*)	reg [7:0] f_TX_DATA = 0;
	(*any_const*)	reg [3:0] f_TX_COUNTER = 0;
	always@(posedge i_CLK)
	begin
		assert(f_TX_COUNTER <= 9);
		if($past(r_CURRENT_STATE) == s_IDLE && $past(i_TX_ENABLE))
			f_TX_DATA <= i_DATA_IN;
		else
			assume($stable(f_TX_DATA));

		if(($past(r_CURRENT_STATE) == s_START_TX || $past(r_CURRENT_STATE) == s_TRANSMIT || $past(r_CURRENT_STATE) == s_STOP_TX) && $rose(i_CLK) && r_STATE_CHANGE_EN)
			f_TX_COUNTER <= f_TX_COUNTER + 1;
		else if(r_CURRENT_STATE == s_IDLE && $rose(i_CLK))
			f_TX_COUNTER <= 0;
		else
			assume($stable(f_TX_COUNTER));
	end

	always@(posedge i_CLK)
	begin
		if($past(r_CURRENT_STATE) == s_TRANSMIT && $rose(i_CLK) && r_STATE_CHANGE_EN)
		begin
			assert(f_TX_DATA[r_BIT_COUNT] == r_DATA_REG[r_BIT_COUNT]);
			assert($changed(r_BIT_COUNT));
			assert(r_BIT_COUNT == $past(r_BIT_COUNT) + 1);
		end
		if(r_CURRENT_STATE == s_START_TX)
			assert(r_DATA_REG == $past(i_DATA_IN));

	end
	always@(posedge i_CLK)
	begin
		f_PAST_VALID <= 1;
		assume($changed(i_CLK));
		if(f_PAST_VALID && $rose(i_CLK))
		begin
			if($past(i_RESET) == 1)
			begin
				assert(o_TX == 1);
				assert(o_TX_BUSY == 0);
				assert(r_CURRENT_STATE == s_IDLE);
				assert(r_BIT_COUNT == 0);
				assert(r_DATA_REG == $past(i_DATA_IN));
				assert(r_BAUD_COUNTER == 0);
				assert(r_STATE_CHANGE_EN == 0);
			end
			else
			begin
				cover(r_CURRENT_STATE == s_IDLE && $past(r_CURRENT_STATE) == s_STOP_TX);

				if($past(r_CURRENT_STATE) == s_IDLE)
					assert(o_TX);
				else if($past(r_CURRENT_STATE) == s_START_TX)
					assert(!o_TX);
				else if($past(r_CURRENT_STATE) == s_TRANSMIT)
					assert(o_TX == f_TX_DATA[r_BIT_COUNT]);
				else
					assert(o_TX);
				if($past(r_CURRENT_STATE) != s_IDLE)
					assert(o_TX_BUSY);
				else
					assert(!o_TX_BUSY);
				//if($past(r_CURRENT_STATE) == s_START_TX || $past(r_CURRENT_STATE) == s_TRANSMIT || $past(r_CURRENT_STATE) == s_STOP_TX)
				//begin
					//assert(r_BAUD_COUNTER == $past(r_BAUD_COUNTER) + 1);
					//if($past(r_BAUD_COUNTER) == lp_CLOCKS_PER_BAUD)
					//begin
						//assert(r_STATE_CHANGE_EN);
						//assert(r_BAUD_COUNTER == 0);
					//end
					//else
					//begin
						//assert(!r_STATE_CHANGE_EN);
						//assert($changed(r_BAUD_COUNTER));
					//end
				//end

				//Transitions
				if($past(r_CURRENT_STATE) == s_START_TX)
					assert(r_CURRENT_STATE == s_TRANSMIT);
				if($past(r_CURRENT_STATE) == s_STOP_TX)
					assert(r_CURRENT_STATE == s_IDLE);
				if(r_CURRENT_STATE == s_STOP_TX)
					assert(r_NEXT_STATE == s_IDLE);
				if(r_CURRENT_STATE == s_START_TX)
					assert(r_NEXT_STATE == s_TRANSMIT);
			end
		end
		if(f_PAST_VALID && !$rose(i_CLK))
		begin
			assume($stable(i_RESET));
			assume($stable(i_TX_ENABLE));
			assume($stable(i_DATA_IN));
		end

	end
`endif
endmodule
