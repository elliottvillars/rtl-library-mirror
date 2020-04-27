module uart_transmitter (
	input wire i_CLK,
	input wire i_CLK_ENABLE,
	input wire i_TX_ENABLE,
	input wire [7:0] i_DATA_IN,
	output reg o_TX
);

reg [7:0] r_DATA_REG;
localparam s_IDLE = 0;
localparam s_START_TX = 1;
localparam s_TRANSMIT = 2;
localparam s_STOP_TX = 3;

reg [1:0] r_CURRENT_STATE;
reg [1:0] r_NEXT_STATE;
reg [2:0] r_BIT_COUNT;

//TODO: Test 
always@(*)
begin
	case(r_CURRENT_STATE)
		s_IDLE:
		begin
			if(i_TX_ENABLE == 1)
				r_NEXT_STATE = s_START_TX;
			else
				r_NEXT_STATE = s_IDLE;
		end
		s_START_TX:
			r_NEXT_STATE = s_TRANSMIT;
		s_TRANSMIT:
		begin
			if(r_BIT_COUNT == 7)
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
	if(i_CLK_ENABLE == 1)
		r_CURRENT_STATE <= r_NEXT_STATE;
	else
		r_CURRENT_STATE <= r_CURRENT_STATE;
end

always@(posedge i_CLK)
begin
	if(r_CURRENT_STATE == s_TRANSMIT && i_CLK_ENABLE == 1)
		r_BIT_COUNT <= r_BIT_COUNT + 1'b1;
	else
		r_BIT_COUNT <= 3'd0;
end

always@(posedge i_CLK)
begin
	if(i_CLK_ENABLE == 1) //BAUD rate will be external
	begin
		case(r_CURRENT_STATE)
			s_IDLE:
			begin
				r_DATA_REG <= i_DATA_IN;
				o_TX <= 1'b1;
			end
			s_START_TX:
			begin
				r_DATA_REG <= r_DATA_REG;
				o_TX <= 1'b0;
			end
			s_TRANSMIT:
			begin
				r_DATA_REG <= r_DATA_REG >> 1'b1;
				o_TX <= r_DATA_REG[0];
			end
			s_STOP_TX:
			begin
				r_DATA_REG <= r_DATA_REG;
				o_TX <= 1'b1;
			end
		endcase
	end
end
endmodule
