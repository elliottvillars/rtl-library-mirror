//Author: Elliott Villars
//
//Name: systolic_multiplier_fsm
//
//Date: 6/8/2020
//
//Format: Verilog
//
//Description: A state machine to control a systolic multiplier. Systolic
//multiplier require control logic to function properly given the fact they
//cannot be pipelined(as far as I know)
//
//Parameters: 
//
//p_DATA_WIDTH: Controls how long the "r_CALC_COUNTER" will run for.
//
//Local Parameters:
//
//lp_CYCLE_END: How long to wait to tranisiton to the "s_DONE" state. It is
//double the parameter "p_DATA_WIDTH" given that a systolic multiplier takes
//2N clock cycles to multiply and N bit number with another N bit number.
//
//States:
//
//s_IDLE: Wait until a new data word needs to be loaded into a shift register.
//
//s_LOAD: Issue an enable signal to the attached shift register to load the
//incoming multiplicand.
//
//s_CALC: Wait for "lp_CYCLE_END" clock cycles until the multiplication is
//complete.
//
//s_DONE: Signal that the multiplication is complete.
//
//Ports: 
//
//i_CLK: System clock input. All module operation is predicated on a rising
//edge clock signal.
//
//i_CLK_ENABLE: A 1-bit wide input for a clock enable signal to enable operation at a slower frequency
//
//i_RESET: A 1-bit wide system reset. Active high.
//
//i_BEGIN_MULT: A 1-bit wide input signaling the start of a new multiplication
//cycle.
//
//o_SHIFT_REG_LOAD: A 1-bit wide output that signals a shift register to load
//new data.
//
//o_RESULT_READY: A 1-bit wide output signaling the end of a multiplication
//cycle.
//
//Estimated Logic Usage:  The following resource usage is determined by
//Yosys when running the "synth_ice40" command on the design. All estimations
//are liberal with resource usage. Assumes "p_DATA_WIDTH" is 4
//
//(Lattice) 
//
//2 SB_CARRY
//4 SB_DFF
//2 SB_DFFE
//4 SB_DFFESR
//16 SB_LUT4
//
module systolic_multiplier_fsm #(parameter p_DATA_WIDTH = 4)(
	input wire i_CLK,
	input wire i_CLK_ENABLE,
	input wire i_RESET,
	input wire i_BEGIN_MULT,
	output reg o_SHIFT_REG_LOAD,
	output reg o_RESULT_READY
);

reg [1:0] r_CURRENT_STATE;
reg [1:0] r_NEXT_STATE;

reg [p_DATA_WIDTH-1:0] r_CALC_COUNTER;

localparam s_IDLE = 0;
localparam s_LOAD = 1;
localparam s_CALC = 2;
localparam s_DONE = 3;

localparam lp_CYCLE_END = 2 * p_DATA_WIDTH;

always@(*) begin: NEXT_STATE_LOGIC
	case(r_CURRENT_STATE)
		s_IDLE:
		begin
			if(i_BEGIN_MULT == 1'b1)
				r_NEXT_STATE = s_LOAD;
			else
				r_NEXT_STATE = s_IDLE;
		end
		s_LOAD:
		begin
			r_NEXT_STATE = s_CALC;
		end
		s_CALC:
		begin
			if(r_CALC_COUNTER == lp_CYCLE_END)
				r_NEXT_STATE = s_DONE;
			else
				r_NEXT_STATE = s_CALC;
		end
		s_DONE:
		begin
			r_NEXT_STATE = s_IDLE;
		end
	endcase
end

always@(posedge i_CLK) begin: STATE_REGISTERS
	if(i_RESET == 1'b1)
		r_CURRENT_STATE <= s_IDLE;
	else
	begin
		if(i_CLK_ENABLE == 1'b1)
			r_CURRENT_STATE <= r_NEXT_STATE;
		else
			r_CURRENT_STATE <= r_CURRENT_STATE;
	end
end

always@(posedge i_CLK)
begin
	if(i_CLK_ENABLE == 1'b1)
	begin
		case(r_CURRENT_STATE)
			s_IDLE:
			begin
				r_CALC_COUNTER <= {p_DATA_WIDTH{1'b0}};
				o_RESULT_READY <= 1'b0;
				o_SHIFT_REG_LOAD <= 1'b0;
			end
			s_LOAD:
			begin
				r_CALC_COUNTER <= {p_DATA_WIDTH{1'b0}};
				o_RESULT_READY <= 1'b0;
				o_SHIFT_REG_LOAD <= 1'b1;
			end
			s_CALC:
			begin
				r_CALC_COUNTER <= r_CALC_COUNTER + 1'b1;
				o_RESULT_READY <= 1'b0;
				o_SHIFT_REG_LOAD <= 1'b0;
			end
			s_DONE:
			begin
				r_CALC_COUNTER <= {p_DATA_WIDTH{1'b0}};
				o_RESULT_READY <= 1'b1;
				o_SHIFT_REG_LOAD <= 1'b0;
			end
		endcase
	end
end

`ifdef FORMAL
	reg fr_PAST_VALID = 0;
	always@(posedge i_CLK)
	begin
		assume($changed(i_CLK));
		assume(!i_RESET);
		assume(i_CLK_ENABLE == 1'b1);
		fr_PAST_VALID <= 1;
		if($rose(i_CLK) && fr_PAST_VALID)
		begin
			cover($past(r_CURRENT_STATE) == s_DONE && r_CURRENT_STATE == s_IDLE);
			if($past(r_CURRENT_STATE) != s_DONE)
				assert(!o_RESULT_READY);
			else
				assert(o_RESULT_READY);
			if($past(r_CURRENT_STATE) == s_CALC)
				assert($changed(r_CALC_COUNTER));
			if($past(r_CURRENT_STATE) != s_CALC)
				assert(r_CALC_COUNTER == 0);
			if($past(r_CURRENT_STATE) == s_LOAD)
				assert(o_SHIFT_REG_LOAD);
			else
				assert(!o_SHIFT_REG_LOAD);

			if($past(r_CURRENT_STATE) == s_DONE)
				assert(r_CURRENT_STATE == s_IDLE);
			if($past(r_CURRENT_STATE) == s_LOAD)
				assert(r_CURRENT_STATE == s_CALC);
			if($past(r_CURRENT_STATE) == s_IDLE && $past(i_BEGIN_MULT) == 1)
				assert(r_CURRENT_STATE == s_LOAD);
			if($past(r_CURRENT_STATE) == s_IDLE && $past(i_BEGIN_MULT) == 0)
				assert(r_CURRENT_STATE == s_IDLE);
			if($past(r_CURRENT_STATE) == s_CALC && $past(r_CALC_COUNTER) == lp_CYCLE_END)
				assert(r_CURRENT_STATE == s_DONE);

		end
		if(!$rose(i_CLK))
		begin
			assume($stable(i_RESET));
			assume($stable(i_BEGIN_MULT));
		end
	end
`endif
endmodule
