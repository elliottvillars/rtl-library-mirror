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
  reg [0:0] PI_i_ENABLE;
  reg [31:0] PI_i_DATA_IN;
  reg [0:0] PI_i_RESET_N;
  accumulator_formal UUT (
    .i_CLK(PI_i_CLK),
    .i_ENABLE(PI_i_ENABLE),
    .i_DATA_IN(PI_i_DATA_IN),
    .i_RESET_N(PI_i_RESET_N)
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
    // UUT.$and$accumulator_formal.\v:0$66_Y  = 1'b1;
    // UUT.$formal$accumulator_formal.\v:107$17_CHECK  = 1'b0;
    // UUT.$formal$accumulator_formal.\v:107$17_EN  = 1'b0;
    // UUT.$formal$accumulator_formal.\v:108$18_CHECK  = 1'b0;
    // UUT.$formal$accumulator_formal.\v:109$19_CHECK  = 1'b0;
    // UUT.$formal$accumulator_formal.\v:111$20_CHECK  = 1'b0;
    // UUT.$formal$accumulator_formal.\v:111$20_EN  = 1'b0;
    // UUT.$formal$accumulator_formal.\v:113$21_CHECK  = 1'b0;
    // UUT.$formal$accumulator_formal.\v:113$21_EN  = 1'b0;
    // UUT.$formal$accumulator_formal.\v:115$22_CHECK  = 1'b0;
    // UUT.$formal$accumulator_formal.\v:115$22_EN  = 1'b0;
    // UUT.$past$accumulator_formal.\v:108$3$0  = 32'b00000000000000000000000000000000;
    // UUT.$past$accumulator_formal.\v:111$6$0  = 1'b1;
    // UUT.$past$accumulator_formal.\v:113$7$0  = 1'b0;
    // UUT.$past$accumulator_formal.\v:114$9$0  = 32'b00000000000000000000000000000000;
    // UUT.$past$accumulator_formal.\v:115$10$0  = 1'b0;
    // UUT.$past$accumulator_formal.\v:120$13$0  = 1'b0;
    UUT.f_past_valid = 1'b0;
    UUT.total = 32'b00000000000000000000000000000000;

    // state 0
    PI_i_CLK = 1'b0;
    PI_i_ENABLE = 1'b0;
    PI_i_DATA_IN = 32'b00000000000000000000000000000000;
    PI_i_RESET_N = 1'b1;
  end
  always @(posedge clock) begin
    // state 1
    if (cycle == 0) begin
      PI_i_CLK <= 1'b1;
      PI_i_ENABLE <= 1'b0;
      PI_i_DATA_IN <= 32'b01000000000000000000000000000000;
      PI_i_RESET_N <= 1'b0;
    end

    // state 2
    if (cycle == 1) begin
      PI_i_CLK <= 1'b0;
      PI_i_ENABLE <= 1'b0;
      PI_i_DATA_IN <= 32'b01000000000000000000000000000000;
      PI_i_RESET_N <= 1'b0;
    end

    genclock <= cycle < 2;
    cycle <= cycle + 1;
  end
endmodule
