module fixed_to_float_sp_fsm (
	input wire i_CLK,
	input wire i_ENABLE,
	input wire i_RESET,
	input wire signed [31:0] i_INPUT,
	output reg o_DONE,
	output reg o_READY,
	output reg signed [31:0] o_OUTPUT
);

//a FSM designed to model fixed point to single precision floating point
//conversion
localparam s_IDLE = 0; //Wait for incoming word
localparam s_CONVERT = 1; //If negative make unsigned
localparam s_NORMALIZE = 2; //shift until msb is 1
localparam s_FINAL_SHIFT = 3; //one last shift
localparam s_CONCAT = 4; //build float here

localparam lp_BIAS = 127;
reg [3:0] r_CURRENT_STATE;
reg [3:0] r_NEXT_STATE;
reg [22:0] r_MANTISSA;
reg [7:0] r_EXPONENT;
reg r_SIGN;
reg [7:0] r_ZERO_COUNT;
reg [31:0] r_TEMP_INPUT;
//TODO:Work on this model later
//
//TO CONVERT FROM FIXED TO FLOAT(ALL INTEGER BITS FOR NOW):
//1. IF MSB IS 1, CONVERT TO UNSIGNED(i.e FLIP BITS AND ADD 1)
//2. SHIFT UNTIL MSB IS 1 AND THEN SHIFT AGAIN(OR JUST IGNORE THE MSB)
//3. EXPONENT = BIAS + BIT WIDTH OF INTEGER COMPONENT - ZERO COUNT
//4. CONCAT ORIGINAL SIGN BIT, EXPONENT AND MANTISSA.
always@(*)
begin
	case(r_CURRENT_STATE)
		s_IDLE: 
		begin
			if(i_ENABLE == 0)
				r_NEXT_STATE = s_IDLE;
			else
				r_NEXT_STATE = s_CONVERT;
		end
		s_CONVERT:
		begin
			r_NEXT_STATE = s_NORMALIZE;
		end
		s_NORMALIZE:
		begin
			if(r_MANTISSA[22] == 1'b1)
				r_NEXT_STATE = s_FINAL_SHIFT;
			else
				r_NEXT_STATE = s_NORMALIZE;
		end
		s_FINAL_SHIFT:
		begin
			r_NEXT_STATE = s_CONCAT;
		end
		s_CONCAT:
		begin
			r_NEXT_STATE = s_IDLE;
		end
	endcase

end

always@(posedge i_CLK)
begin
	if(i_RESET == 1)
		r_CURRENT_STATE <= 4'b0;
	else
		r_CURRENT_STATE <= r_NEXT_STATE;
end

always@(posedge i_CLK)
begin
	case(r_CURRENT_STATE)
		s_IDLE:
		begin
			r_MANTISSA <= 23'd0;
			r_EXPONENT <= 8'd0;
			r_SIGN <= i_INPUT[31];
			r_ZERO_COUNT <= 8'd0;
			r_TEMP_INPUT <= i_INPUT;
			o_READY <= 1'b1;
			o_DONE <= 1'd0;
			o_OUTPUT <= 32'd0;
		end
		s_CONVERT:
		begin
			if(r_TEMP_INPUT[31] == 1)
				r_MANTISSA <= ~r_TEMP_INPUT[22:0] + 1'b1; //THIS IS BROKE
			else
				r_MANTISSA <= r_TEMP_INPUT[22:0];
		end
		s_NORMALIZE:
		begin
			r_MANTISSA <= r_MANTISSA << 1'b1;
			r_ZERO_COUNT <= r_ZERO_COUNT + 1'b1;
		end
		s_FINAL_SHIFT:
		begin
			r_MANTISSA <= r_MANTISSA << 1'b1;
			r_EXPONENT <= lp_BIAS + 32 - r_ZERO_COUNT;
		end
		s_CONCAT:
		begin
			o_OUTPUT <= {r_SIGN,r_EXPONENT,r_MANTISSA};
		end
	endcase
end
endmodule
