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
  reg [0:0] PI_i_CLK;
  reg [0:0] PI_i_RESET_N;
  reg [31:0] PI_i_DATA_IN;
  reg [0:0] PI_i_ENABLE;
  mkAccumulator_formal UUT (
    .i_CLK(PI_i_CLK),
    .i_RESET_N(PI_i_RESET_N),
    .i_DATA_IN(PI_i_DATA_IN),
    .i_ENABLE(PI_i_ENABLE)
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
    // UUT.$and$mkAccumulator_formal.v:108$51_Y = 1'b1;
    // UUT.$formal$mkAccumulator_formal.v:112$14_CHECK = 1'b0;
    // UUT.$formal$mkAccumulator_formal.v:112$14_EN = 1'b0;
    // UUT.$formal$mkAccumulator_formal.v:113$15_CHECK = 1'b0;
    // UUT.$formal$mkAccumulator_formal.v:114$16_CHECK = 1'b0;
    // UUT.$formal$mkAccumulator_formal.v:116$17_CHECK = 1'b0;
    // UUT.$formal$mkAccumulator_formal.v:116$17_EN = 1'b0;
    // UUT.$formal$mkAccumulator_formal.v:118$18_CHECK = 1'b0;
    // UUT.$past$mkAccumulator_formal.v:110$3$0 = 1'b0;
    // UUT.$past$mkAccumulator_formal.v:112$4$0 = 32'b00000000000000000000000000000000;
    // UUT.$past$mkAccumulator_formal.v:115$7$0 = 1'b0;
    // UUT.$past$mkAccumulator_formal.v:118$10$0 = 32'b00000000000000000000000000000000;
    UUT.acc_total = 32'b00000000000000000000000000000000;
    UUT.f_past_valid = 1'b0;

    // state 0
    PI_i_CLK = 1'b0;
    PI_i_RESET_N = 1'b1;
    PI_i_DATA_IN = 32'b11111111111111111111111111100000;
    PI_i_ENABLE = 1'b1;
  end
  always @(posedge clock) begin
    // state 1
    if (cycle == 0) begin
      PI_i_CLK <= 1'b1;
      PI_i_RESET_N <= 1'b0;
      PI_i_DATA_IN <= 32'b00000000000000000000000000000000;
      PI_i_ENABLE <= 1'b0;
    end

    // state 2
    if (cycle == 1) begin
      PI_i_CLK <= 1'b0;
      PI_i_RESET_N <= 1'b0;
      PI_i_DATA_IN <= 32'b00000000000000000000000000000000;
      PI_i_ENABLE <= 1'b0;
    end

    genclock <= cycle < 2;
    cycle <= cycle + 1;
  end
endmodule
