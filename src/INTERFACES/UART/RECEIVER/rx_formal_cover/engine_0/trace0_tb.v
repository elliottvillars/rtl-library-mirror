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
  reg [0:0] PI_i_RX;
  uart_receiver UUT (
    .i_CLK(PI_i_CLK),
    .i_RX(PI_i_RX)
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
    // UUT.$and$./uart_receiver.v:98$83_Y = 1'b0;
    // UUT.$auto$async2sync.cc:192:execute$473 = 2'b00;
    // UUT.$formal$./uart_receiver.v:101$12_EN = 1'b0;
    // UUT.$formal$./uart_receiver.v:104$13_CHECK = 1'b0;
    // UUT.$formal$./uart_receiver.v:109$14_CHECK = 1'b0;
    // UUT.$formal$./uart_receiver.v:109$14_EN = 1'b0;
    // UUT.$formal$./uart_receiver.v:110$15_CHECK = 1'b0;
    // UUT.$formal$./uart_receiver.v:111$16_CHECK = 1'b0;
    // UUT.$formal$./uart_receiver.v:115$17_CHECK = 1'b0;
    // UUT.$formal$./uart_receiver.v:115$17_EN = 1'b0;
    // UUT.$formal$./uart_receiver.v:116$18_CHECK = 1'b0;
    // UUT.$formal$./uart_receiver.v:117$19_CHECK = 1'b0;
    // UUT.$formal$./uart_receiver.v:118$20_CHECK = 1'b1;
    // UUT.$formal$./uart_receiver.v:122$21_CHECK = 1'b0;
    // UUT.$formal$./uart_receiver.v:122$21_EN = 1'b0;
    // UUT.$formal$./uart_receiver.v:123$22_CHECK = 1'b0;
    // UUT.$formal$./uart_receiver.v:124$23_CHECK = 1'b0;
    // UUT.$formal$./uart_receiver.v:129$24_CHECK = 1'b0;
    // UUT.$formal$./uart_receiver.v:129$24_EN = 1'b0;
    // UUT.$formal$./uart_receiver.v:131$25_CHECK = 1'b0;
    // UUT.$formal$./uart_receiver.v:131$25_EN = 1'b0;
    // UUT.$formal$./uart_receiver.v:133$26_CHECK = 1'b0;
    // UUT.$formal$./uart_receiver.v:133$26_EN = 1'b0;
    // UUT.$formal$./uart_receiver.v:135$27_CHECK = 1'b0;
    // UUT.$formal$./uart_receiver.v:135$27_EN = 1'b0;
    // UUT.$formal$./uart_receiver.v:137$28_CHECK = 1'b0;
    // UUT.$formal$./uart_receiver.v:137$28_EN = 1'b0;
    // UUT.$past$./uart_receiver.v:101$3$0 = 1'b0;
    // UUT.$past$./uart_receiver.v:104$4$0 = 2'b01;
    // UUT.$past$./uart_receiver.v:118$8$0 = 4'b0000;
    // UUT.$past$./uart_receiver.v:122$10$0 = 8'b00000000;
    UUT.o_DATA = 8'b00000000;
    UUT.o_RX_DONE = 1'b0;
    UUT.r_BIT_COUNT = 4'b0000;
    UUT.r_CURRENT_STATE = 2'b00;
    UUT.r_DATA_REG = 8'b00000000;
    UUT.r_PAST_VALID = 1'b0;

    // state 0
    PI_i_CLK = 1'b1;
    PI_i_RX = 1'b0;
  end
  always @(posedge clock) begin
    // state 1
    if (cycle == 0) begin
      PI_i_CLK <= 1'b0;
      PI_i_RX <= 1'b1;
    end

    // state 2
    if (cycle == 1) begin
      PI_i_CLK <= 1'b1;
      PI_i_RX <= 1'b0;
    end

    // state 3
    if (cycle == 2) begin
      PI_i_CLK <= 1'b0;
      PI_i_RX <= 1'b1;
    end

    // state 4
    if (cycle == 3) begin
      PI_i_CLK <= 1'b1;
      PI_i_RX <= 1'b0;
    end

    // state 5
    if (cycle == 4) begin
      PI_i_CLK <= 1'b0;
      PI_i_RX <= 1'b0;
    end

    // state 6
    if (cycle == 5) begin
      PI_i_CLK <= 1'b1;
      PI_i_RX <= 1'b1;
    end

    // state 7
    if (cycle == 6) begin
      PI_i_CLK <= 1'b0;
      PI_i_RX <= 1'b0;
    end

    // state 8
    if (cycle == 7) begin
      PI_i_CLK <= 1'b1;
      PI_i_RX <= 1'b1;
    end

    // state 9
    if (cycle == 8) begin
      PI_i_CLK <= 1'b0;
      PI_i_RX <= 1'b0;
    end

    // state 10
    if (cycle == 9) begin
      PI_i_CLK <= 1'b1;
      PI_i_RX <= 1'b1;
    end

    // state 11
    if (cycle == 10) begin
      PI_i_CLK <= 1'b0;
      PI_i_RX <= 1'b0;
    end

    genclock <= cycle < 11;
    cycle <= cycle + 1;
  end
endmodule
