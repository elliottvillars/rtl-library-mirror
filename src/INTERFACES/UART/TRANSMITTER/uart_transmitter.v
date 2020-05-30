module uart_transmitter (
	input wire i_CLK,
	input wire i_RESET,
	input wire i_CLK_ENABLE,
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
reg [3:0] r_BIT_COUNT;
reg [7:0] r_DATA_REG;

initial 
begin
	r_CURRENT_STATE = 2'd0;
	r_NEXT_STATE 	= 2'd0;
	r_BIT_COUNT 	= 4'd0;
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
			if(r_BIT_COUNT == 4'd8)
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
	if(r_CURRENT_STATE == s_TRANSMIT && i_CLK_ENABLE == 1)
		r_BIT_COUNT <= r_BIT_COUNT + 1'b1;
	else
		r_BIT_COUNT <= 4'd0;
end

always@(posedge i_CLK)
begin
	if(i_CLK_ENABLE == 1'b1) //BAUD rate will be external
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
				r_DATA_REG <= r_DATA_REG >> 1'b1;
				o_TX_BUSY <= 1'b1;
				if(r_BIT_COUNT != 4'd8)
					o_TX <= r_DATA_REG[0];
				else
					o_TX <= 1'b1;
			end
			s_STOP_TX:
			begin
				o_TX_BUSY <= 1'b1;
				r_DATA_REG <= r_DATA_REG;
				o_TX <= 1'b1;
			end
		endcase
	end
end

`ifdef FORMAL
	reg r_PAST_VALID = 0;
	always@(posedge i_CLK)
	begin
		assume($changed(i_CLK));
		r_PAST_VALID <= 1;
		if(r_PAST_VALID && $rose(i_CLK)) begin
			//Check reset condition
			if($past(i_RESET) == 1'b1)
			begin
				//Check independent reset effects
				assert(r_CURRENT_STATE == s_IDLE);

				//Check baud rate dependent reset conditions.
				if($past(i_CLK_ENABLE == 1'b1))
				begin
					assert(o_TX == 1'b1);
					assert(o_TX_BUSY == 1'b0);
					assert(r_BIT_COUNT == 4'd0);
				end
			end
			else
			begin
				if($past(i_CLK_ENABLE) == 1'b1)
				begin
					//cover transiton back to idle
					cover(r_CURRENT_STATE == s_IDLE && $past(r_CURRENT_STATE == s_STOP_TX));

					//Check state assertions
					if($past(r_CURRENT_STATE) == s_IDLE)
					begin
						assert(o_TX_BUSY == 1'b0);
						assert(o_TX == 1'b1);
						assert(r_BIT_COUNT == 4'd0);
					end
					if($past(r_CURRENT_STATE) == s_START_TX) 
					begin
						assert(o_TX_BUSY == 3'b1);
						assert(o_TX == 3'b0);
						assert(r_BIT_COUNT == 3'd0);
					end
					if($past(r_CURRENT_STATE) == s_TRANSMIT)
					begin
						if(r_BIT_COUNT != 4'd9)
							assert(o_TX == $past(r_DATA_REG[0]));
						else
							assert(o_TX == 1'b1);
						assert(o_TX_BUSY == 1'b1);
						assert(r_BIT_COUNT == $past(r_BIT_COUNT) + 1);
					end
					if($past(r_CURRENT_STATE) == s_STOP_TX)
					begin
						assert(o_TX_BUSY == 1'b1);
						assert(o_TX == 1'b1);
						assert($past(r_BIT_COUNT) == 4'd9);
					end

					//Check transitions
					if(i_TX_ENABLE == 1'b1 && r_CURRENT_STATE == s_IDLE)
						assert(r_NEXT_STATE == s_START_TX);
					if(i_TX_ENABLE == 1'b0 && r_CURRENT_STATE == s_IDLE)
						assert(r_NEXT_STATE == s_IDLE);
					if(r_CURRENT_STATE == s_START_TX)
						assert(r_NEXT_STATE == s_TRANSMIT);
					if(r_CURRENT_STATE == s_TRANSMIT && r_BIT_COUNT != 4'd8)
						assert(r_NEXT_STATE == s_TRANSMIT);
					if(r_CURRENT_STATE == s_TRANSMIT && r_BIT_COUNT == 4'd8)
						assert(r_NEXT_STATE == s_STOP_TX);
					if(r_CURRENT_STATE == s_STOP_TX)
						assert(r_NEXT_STATE == s_IDLE);
				end
			end
		end
		//Prevent signals from changing in between rising edges
		if(!$rose(i_CLK))
		begin
			assume($stable(i_CLK_ENABLE));
			assume($stable(i_RESET));
			assume($stable(i_TX_ENABLE));
			assume($stable(i_DATA_IN));
		end
	end
`endif
endmodule
