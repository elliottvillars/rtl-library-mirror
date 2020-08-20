`ifndef VERILATOR
module testbench;
  reg [4095:0] vcdfile;
  reg clock;
`else
module testbench(input clock, output reg genclock);
  initial genclock = 1;
`endif
  reg genclock = 1;
  reg [31:0] cycle = 0;
  reg [0:0] PI_i_CLK_ENABLE;
  reg [0:0] PI_i_CLK;
  reg [0:0] PI_i_BEGIN_MULT;
  reg [0:0] PI_i_RESET;
  systolic_multiplier_fsm UUT (
    .i_CLK_ENABLE(PI_i_CLK_ENABLE),
    .i_CLK(PI_i_CLK),
    .i_BEGIN_MULT(PI_i_BEGIN_MULT),
    .i_RESET(PI_i_RESET)
  );
`ifndef VERILATOR
  initial begin
    if ($value$plusargs("vcd=%s", vcdfile)) begin
      $dumpfile(vcdfile);
      $dumpvars(0, testbench);
    end
    #5 clock = 0;
    while (genclock) begin
      #5 clock = 0;
      #5 clock = 1;
    end
  end
`endif
  initial begin
`ifndef VERILATOR
    #1;
`endif
    // UUT.$and$systolic_multiplier_fsm.v:0$103_Y = 1'b1;
    // UUT.$eq$systolic_multiplier_fsm.v:186$124_Y = 1'b0;
    // UUT.$formal$systolic_multiplier_fsm.v:167$23_CHECK = 1'b0;
    // UUT.$formal$systolic_multiplier_fsm.v:167$23_EN = 1'b0;
    // UUT.$formal$systolic_multiplier_fsm.v:169$24_CHECK = 1'b0;
    // UUT.$formal$systolic_multiplier_fsm.v:169$24_EN = 1'b0;
    // UUT.$formal$systolic_multiplier_fsm.v:171$25_CHECK = 1'b0;
    // UUT.$formal$systolic_multiplier_fsm.v:171$25_EN = 1'b0;
    // UUT.$formal$systolic_multiplier_fsm.v:173$26_CHECK = 1'b0;
    // UUT.$formal$systolic_multiplier_fsm.v:173$26_EN = 1'b0;
    // UUT.$formal$systolic_multiplier_fsm.v:175$27_CHECK = 1'b0;
    // UUT.$formal$systolic_multiplier_fsm.v:175$27_EN = 1'b0;
    // UUT.$formal$systolic_multiplier_fsm.v:177$28_CHECK = 1'b0;
    // UUT.$formal$systolic_multiplier_fsm.v:177$28_EN = 1'b0;
    // UUT.$formal$systolic_multiplier_fsm.v:179$29_CHECK = 1'b0;
    // UUT.$formal$systolic_multiplier_fsm.v:179$29_EN = 1'b0;
    // UUT.$formal$systolic_multiplier_fsm.v:182$30_CHECK = 1'b0;
    // UUT.$formal$systolic_multiplier_fsm.v:182$30_EN = 1'b0;
    // UUT.$formal$systolic_multiplier_fsm.v:184$31_CHECK = 1'b0;
    // UUT.$formal$systolic_multiplier_fsm.v:186$32_CHECK = 1'b0;
    // UUT.$formal$systolic_multiplier_fsm.v:186$32_EN = 1'b0;
    // UUT.$formal$systolic_multiplier_fsm.v:188$33_CHECK = 1'b0;
    // UUT.$formal$systolic_multiplier_fsm.v:188$33_EN = 1'b0;
    // UUT.$formal$systolic_multiplier_fsm.v:190$34_CHECK = 1'b0;
    // UUT.$formal$systolic_multiplier_fsm.v:190$34_EN = 1'b0;
    // UUT.$past$systolic_multiplier_fsm.v:168$3$0 = 2'b00;
    // UUT.$past$systolic_multiplier_fsm.v:174$6$0 = 4'b0000;
    // UUT.$past$systolic_multiplier_fsm.v:196$18$0 = 1'b0;
    UUT.fr_PAST_VALID = 1'b0;
    UUT.o_RESULT_READY = 1'b0;
    UUT.o_SHIFT_REG_LOAD = 1'b0;
    UUT.r_CALC_COUNTER = 4'b1001;
    UUT.r_CURRENT_STATE = 2'b11;

    // state 0
    PI_i_CLK_ENABLE = 1'b1;
    PI_i_CLK = 1'b0;
    PI_i_BEGIN_MULT = 1'b0;
    PI_i_RESET = 1'b0;
  end
  always @(posedge clock) begin
    // state 1
    if (cycle == 0) begin
      PI_i_CLK_ENABLE <= 1'b1;
      PI_i_CLK <= 1'b1;
      PI_i_BEGIN_MULT <= 1'b0;
      PI_i_RESET <= 1'b0;
    end

    // state 2
    if (cycle == 1) begin
      PI_i_CLK_ENABLE <= 1'b1;
      PI_i_CLK <= 1'b0;
      PI_i_BEGIN_MULT <= 1'b0;
      PI_i_RESET <= 1'b0;
    end

    genclock <= cycle < 2;
    cycle <= cycle + 1;
  end
endmodule
