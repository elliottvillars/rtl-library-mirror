module uart_receiver(
	input wire i_CLK,
	input wire i_RX,
	output reg o_RX_DONE,
	output reg [7:0] o_DATA
);

localparam s_IDLE = 0;
localparam s_RX = 1;
localparam s_RX_STOP = 2;

reg [1:0] r_CURRENT_STATE;
reg [1:0] r_NEXT_STATE;

reg [3:0] r_BIT_COUNT;

reg [7:0] r_DATA_REG;

//TODO: Fix the tests
initial begin
	r_CURRENT_STATE = 0;
	r_NEXT_STATE = 0;
	r_BIT_COUNT = 0;
	r_DATA_REG = 0;
end
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
			r_BIT_COUNT <= 4'd0;
			o_DATA <= 8'b0;
			r_DATA_REG <= 8'd0;
			o_RX_DONE <= 0;
		end
		s_RX:
		begin
			r_BIT_COUNT <= r_BIT_COUNT + 1'b1;
			o_DATA <= 8'b0;
			//Bruh. I should not have to do this coercion.
			r_DATA_REG[0] <= i_RX;
			r_DATA_REG[1] <= r_DATA_REG[0];
			r_DATA_REG[2] <= r_DATA_REG[1];
			r_DATA_REG[3] <= r_DATA_REG[2];
			r_DATA_REG[4] <= r_DATA_REG[3];
			r_DATA_REG[5] <= r_DATA_REG[4];
			r_DATA_REG[6] <= r_DATA_REG[5];
			r_DATA_REG[7] <= r_DATA_REG[6];
			//r_DATA_REG <= r_DATA_REG << 1'b1; //RX Line is fucked up
			o_RX_DONE <= 0;
		end
		s_RX_STOP:
		begin
			r_BIT_COUNT <= 4'b0;
			o_DATA <= r_DATA_REG;
			r_DATA_REG <= 8'd0;
			o_RX_DONE <= 1;
		end

	endcase
end

`ifdef FORMAL
reg r_PAST_VALID = 0;
always@(posedge i_CLK)
begin
	assume($changed(i_CLK));
	r_PAST_VALID <= 1;
	if(r_PAST_VALID && $rose(i_CLK))
	begin
		
		assume($changed(i_RX));

		//Cover return to idle
		cover(r_CURRENT_STATE == s_IDLE && $past(r_CURRENT_STATE) == s_RX_STOP);

		//Check signal outputs.
		if($past(r_CURRENT_STATE) == s_IDLE)
		begin
			assert(o_RX_DONE == 0);
			assert(o_DATA == 0);
			assert(r_BIT_COUNT == 0);
		end
		if($past(r_CURRENT_STATE) == s_RX)
		begin
			assert(o_RX_DONE == 0);
			assert(r_DATA_REG[0] == $past(i_RX));
			assert(o_DATA == 0);
			assert(r_BIT_COUNT == $past(r_BIT_COUNT) + 1);
		end
		if($past(r_CURRENT_STATE) == s_RX_STOP)
		begin
			assert(o_DATA == $past(r_DATA_REG));
			assert(o_RX_DONE == 1);
			assert(r_BIT_COUNT == 0);
		end

		//Check transition
		if(r_CURRENT_STATE == s_IDLE && i_RX == 0)
			assert(r_NEXT_STATE == s_RX);
		if(r_CURRENT_STATE == s_IDLE && i_RX == 1)
			assert(r_NEXT_STATE == s_IDLE);
		if(r_CURRENT_STATE == s_RX && r_BIT_COUNT != 7)
			assert(r_NEXT_STATE == s_RX);
		if(r_CURRENT_STATE == s_RX && r_BIT_COUNT == 7)
			assert(r_NEXT_STATE == s_RX_STOP);
		if(r_CURRENT_STATE == s_RX_STOP)
			assert(r_NEXT_STATE == s_IDLE);
	end
end
`endif
endmodule
