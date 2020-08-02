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
  reg [7:0] PI_i_SUMMAND;
  reg [0:0] PI_i_CLK;
  reg [0:0] PI_i_RESET;
  accumulator UUT (
    .i_CLK_ENABLE(PI_i_CLK_ENABLE),
    .i_SUMMAND(PI_i_SUMMAND),
    .i_CLK(PI_i_CLK),
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
    // UUT.$and$accumulator.v:0$57_Y = 1'b1;
    // UUT.$eq$accumulator.v:75$64_Y = 1'b0;
    // UUT.$eq$accumulator.v:77$66_Y = 1'b0;
    // UUT.$formal$accumulator.v:72$13_CHECK = 1'b0;
    // UUT.$formal$accumulator.v:72$13_EN = 1'b0;
    // UUT.$formal$accumulator.v:73$14_CHECK = 1'b0;
    // UUT.$formal$accumulator.v:75$15_CHECK = 1'b0;
    // UUT.$formal$accumulator.v:75$15_EN = 1'b0;
    // UUT.$formal$accumulator.v:77$16_CHECK = 1'b0;
    // UUT.$formal$accumulator.v:77$16_EN = 1'b0;
    // UUT.$formal$accumulator.v:79$17_CHECK = 1'b0;
    // UUT.$formal$accumulator.v:79$17_EN = 1'b0;
    // UUT.$past$accumulator.v:78$5$0 = 8'b00000000;
    // UUT.$past$accumulator.v:78$6$0 = 8'b00000000;
    UUT.o_ACCUMULATION = 8'b11111111;
    UUT.r_PAST_VALID = 1'b0;

    // state 0
    PI_i_CLK_ENABLE = 1'b0;
    PI_i_SUMMAND = 8'b00000000;
    PI_i_CLK = 1'b0;
    PI_i_RESET = 1'b0;
  end
  always @(posedge clock) begin
    // state 1
    if (cycle == 0) begin
      PI_i_CLK_ENABLE <= 1'b0;
      PI_i_SUMMAND <= 8'b00010000;
      PI_i_CLK <= 1'b1;
      PI_i_RESET <= 1'b0;
    end

    // state 2
    if (cycle == 1) begin
      PI_i_CLK_ENABLE <= 1'b0;
      PI_i_SUMMAND <= 8'b00010000;
      PI_i_CLK <= 1'b0;
      PI_i_RESET <= 1'b0;
    end

    genclock <= cycle < 2;
    cycle <= cycle + 1;
  end
endmodule
