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
  reg [31:0] PI_i_DIV_VALUE;
  reg [0:0] PI_i_CLK;
  reg [0:0] PI_i_ENABLE;
  reg [0:0] PI_i_RESET;
  dynamic_clock_divider UUT (
    .i_DIV_VALUE(PI_i_DIV_VALUE),
    .i_CLK(PI_i_CLK),
    .i_ENABLE(PI_i_ENABLE),
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
    // UUT.$and$dynamic_clock_divider.v:0$57_Y = 1'b0;
    // UUT.$eq$dynamic_clock_divider.v:83$62_Y = 1'b0;
    // UUT.$eq$dynamic_clock_divider.v:83$63_Y = 1'b0;
    // UUT.$formal$dynamic_clock_divider.v:92$15_CHECK = 1'b0;
    // UUT.$formal$dynamic_clock_divider.v:92$15_EN = 1'b0;
    // UUT.$formal$dynamic_clock_divider.v:94$16_CHECK = 1'b0;
    // UUT.$formal$dynamic_clock_divider.v:94$16_EN = 1'b0;
    // UUT.$past$dynamic_clock_divider.v:79$2$0 = 32'b00000000000000000000000000000000;
    // UUT.$past$dynamic_clock_divider.v:92$7$0 = 32'b10000000000000000000000000000000;
    UUT.o_ENABLE_OUT = 1'b0;
    UUT.r_Count = 32'b00000000000000000000000000000000;
    UUT.r_PAST_VALID = 1'b1;

    // state 0
    PI_i_DIV_VALUE = 32'b00000000000000000000000000000000;
    PI_i_CLK = 1'b1;
    PI_i_ENABLE = 1'b0;
    PI_i_RESET = 1'b0;
  end
  always @(posedge clock) begin
    // state 1
    if (cycle == 0) begin
      PI_i_DIV_VALUE <= 32'b00000000000000000000000000000000;
      PI_i_CLK <= 1'b0;
      PI_i_ENABLE <= 1'b0;
      PI_i_RESET <= 1'b0;
    end

    genclock <= cycle < 1;
    cycle <= cycle + 1;
  end
endmodule
