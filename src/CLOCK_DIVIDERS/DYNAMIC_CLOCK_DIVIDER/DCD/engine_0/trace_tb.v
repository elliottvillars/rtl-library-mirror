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
  reg [0:0] PI_i_ENABLE;
  reg [0:0] PI_i_CLK;
  reg [31:0] PI_i_DIV_VALUE;
  reg [0:0] PI_i_RST;
  dynamic_clock_divider UUT (
    .i_ENABLE(PI_i_ENABLE),
    .i_CLK(PI_i_CLK),
    .i_DIV_VALUE(PI_i_DIV_VALUE),
    .i_RST(PI_i_RST)
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
    // UUT.$and$dynamic_clock_divider.v:86$50_Y = 1'b1;
    // UUT.$eq$dynamic_clock_divider.v:88$55_Y = 1'b0;
    // UUT.$eq$dynamic_clock_divider.v:97$62_Y = 1'b0;
    // UUT.$formal$dynamic_clock_divider.v:100$19_CHECK = 1'b0;
    // UUT.$formal$dynamic_clock_divider.v:100$19_EN = 1'b0;
    // UUT.$formal$dynamic_clock_divider.v:90$17_CHECK = 1'b0;
    // UUT.$formal$dynamic_clock_divider.v:90$17_EN = 1'b0;
    // UUT.$formal$dynamic_clock_divider.v:91$18_CHECK = 1'b0;
    // UUT.$past$dynamic_clock_divider.v:100$9$0 = 32'b00000000000000000000000000000000;
    UUT.o_ENABLE_OUT = 1'b0;
    UUT.r_Count = 32'b00000000000000000000000000000000;

    // state 0
    PI_i_ENABLE = 1'b0;
    PI_i_CLK = 1'b0;
    PI_i_DIV_VALUE = 32'b10000000000000000000000000000000;
    PI_i_RST = 1'b1;
  end
  always @(posedge clock) begin
    // state 1
    if (cycle == 0) begin
      PI_i_ENABLE <= 1'b0;
      PI_i_CLK <= 1'b1;
      PI_i_DIV_VALUE <= 32'b10000000000000000000000000000000;
      PI_i_RST <= 1'b0;
    end

    // state 2
    if (cycle == 1) begin
      PI_i_ENABLE <= 1'b1;
      PI_i_CLK <= 1'b0;
      PI_i_DIV_VALUE <= 32'b00000000000000000000000000000000;
      PI_i_RST <= 1'b0;
    end

    // state 3
    if (cycle == 2) begin
      PI_i_ENABLE <= 1'b1;
      PI_i_CLK <= 1'b1;
      PI_i_DIV_VALUE <= 32'b10000000000000000000000000000000;
      PI_i_RST <= 1'b0;
    end

    // state 4
    if (cycle == 3) begin
      PI_i_ENABLE <= 1'b0;
      PI_i_CLK <= 1'b0;
      PI_i_DIV_VALUE <= 32'b00000000000000000000000000000000;
      PI_i_RST <= 1'b0;
    end

    genclock <= cycle < 4;
    cycle <= cycle + 1;
  end
endmodule
