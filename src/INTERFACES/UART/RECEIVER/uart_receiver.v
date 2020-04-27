module uart_receiver(
	input wire i_CLK,
	input wire i_RX,
	output reg [7:0] o_DATA
);

localparam s_IDLE = 0;
localparam s_RX = 1;
localparam s_RX_STOP = 2;

reg [1:0] r_CURRENT_STATE;
reg [1:0] r_NEXT_STATE;

reg [2:0] r_BIT_COUNT;

reg [7:0] r_DATA_REG;


always@(*)
begin
	case(r_CURRENT_STATE)
		s_IDLE:
		begin
			if(i_RX == 0)
				r_NEXT_STATE = s_RX;
			else
				r_NEXT_STATE = s_IDLE;
		end
		s_RX:
		begin
			if(r_BIT_COUNT == 7)
				r_NEXT_STATE = s_RX_STOP;
			else
				r_NEXT_STATE = s_RX;
		end
		s_RX_STOP:
		begin
			r_NEXT_STATE = s_IDLE;
		end
	endcase
end

always@(posedge i_CLK)
begin
	r_CURRENT_STATE <= r_NEXT_STATE;
end

always@(posedge i_CLK)
begin
	case(r_CURRENT_STATE)
		s_IDLE:
		begin
			r_BIT_COUNT <= 3'd0;
			o_DATA <= 8'b0;
			r_DATA_REG <= 8'd0;
		end
		s_RX:
		begin
			r_BIT_COUNT <= r_BIT_COUNT + 1'b1;
			o_DATA <= 8'b0;
			r_DATA_REG[0] <= i_RX;
			r_DATA_REG <= r_DATA_REG << 1'b1;
		end
		s_RX_STOP:
		begin
			r_BIT_COUNT <= 3'b0;
			o_DATA <= r_DATA_REG;
			r_DATA_REG <= 8'd0;
		end

	endcase
end
endmodule
