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
  reg [0:0] PI_i_TX_ENABLE;
  reg [7:0] PI_i_DATA_IN;
  reg [0:0] PI_i_RESET;
  uart_transmitter UUT (
    .i_CLK(PI_i_CLK),
    .i_TX_ENABLE(PI_i_TX_ENABLE),
    .i_DATA_IN(PI_i_DATA_IN),
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
    // UUT.$and$./uart_transmitter.v:162$164_Y = 32'b00000000000000000000000000000001;
    // UUT.$eq$./uart_transmitter.v:101$129_Y = 1'b1;
    // UUT.$formal$./uart_transmitter.v:103$21_CHECK = 1'b0;
    // UUT.$formal$./uart_transmitter.v:103$21_EN = 1'b0;
    // UUT.$formal$./uart_transmitter.v:104$22_CHECK = 1'b0;
    // UUT.$formal$./uart_transmitter.v:105$23_CHECK = 1'b0;
    // UUT.$formal$./uart_transmitter.v:106$24_CHECK = 1'b0;
    // UUT.$formal$./uart_transmitter.v:107$25_CHECK = 1'b0;
    // UUT.$formal$./uart_transmitter.v:111$26_CHECK = 1'b0;
    // UUT.$formal$./uart_transmitter.v:111$26_EN = 1'b0;
    // UUT.$formal$./uart_transmitter.v:114$27_CHECK = 1'b0;
    // UUT.$formal$./uart_transmitter.v:114$27_EN = 1'b0;
    // UUT.$formal$./uart_transmitter.v:116$28_CHECK = 1'b0;
    // UUT.$formal$./uart_transmitter.v:116$28_EN = 1'b0;
    // UUT.$formal$./uart_transmitter.v:118$29_CHECK = 1'b0;
    // UUT.$formal$./uart_transmitter.v:118$29_EN = 1'b0;
    // UUT.$formal$./uart_transmitter.v:120$30_CHECK = 1'b0;
    // UUT.$formal$./uart_transmitter.v:120$30_EN = 1'b0;
    // UUT.$formal$./uart_transmitter.v:122$31_CHECK = 1'b0;
    // UUT.$formal$./uart_transmitter.v:122$31_EN = 1'b0;
    // UUT.$formal$./uart_transmitter.v:124$32_CHECK = 1'b0;
    // UUT.$formal$./uart_transmitter.v:124$32_EN = 1'b0;
    // UUT.$formal$./uart_transmitter.v:142$33_CHECK = 1'b0;
    // UUT.$formal$./uart_transmitter.v:142$33_EN = 1'b0;
    // UUT.$formal$./uart_transmitter.v:144$34_CHECK = 1'b0;
    // UUT.$formal$./uart_transmitter.v:144$34_EN = 1'b0;
    // UUT.$formal$./uart_transmitter.v:146$35_CHECK = 1'b0;
    // UUT.$formal$./uart_transmitter.v:146$35_EN = 1'b0;
    // UUT.$formal$./uart_transmitter.v:148$36_CHECK = 1'b0;
    // UUT.$formal$./uart_transmitter.v:148$36_EN = 1'b0;
    // UUT.$formal$./uart_transmitter.v:150$37_CHECK = 1'b0;
    // UUT.$formal$./uart_transmitter.v:155$38_CHECK = 1'b0;
    // UUT.$formal$./uart_transmitter.v:155$38_EN = 1'b0;
    // UUT.$formal$./uart_transmitter.v:156$39_CHECK = 1'b0;
    // UUT.$formal$./uart_transmitter.v:159$40_CHECK = 1'b0;
    // UUT.$formal$./uart_transmitter.v:159$40_EN = 1'b0;
    // UUT.$past$./uart_transmitter.v:107$4$0 = 8'b00000000;
    // UUT.$past$./uart_transmitter.v:111$5$0 = 2'b00;
    // UUT.$past$./uart_transmitter.v:118$9$0 = 3'b000;
    // UUT.$past$./uart_transmitter.v:165$18$0 = 1'b1;
    UUT.f_PAST_VALID = 1'b0;
    UUT.f_TX_COUNTER = 4'b0000;
    UUT.o_TX = 1'b0;
    UUT.r_BIT_COUNT = 3'b000;
    UUT.r_CURRENT_STATE = 2'b00;
    UUT.r_DATA_REG = 8'b00000000;

    // state 0
    PI_i_CLK = 1'b0;
    PI_i_TX_ENABLE = 1'b0;
    PI_i_DATA_IN = 8'b10000000;
    PI_i_RESET = 1'b0;
  end
  always @(posedge clock) begin
    // state 1
    if (cycle == 0) begin
      PI_i_CLK <= 1'b1;
      PI_i_TX_ENABLE <= 1'b1;
      PI_i_DATA_IN <= 8'b10000000;
      PI_i_RESET <= 1'b0;
    end

    // state 2
    if (cycle == 1) begin
      PI_i_CLK <= 1'b0;
      PI_i_TX_ENABLE <= 1'b1;
      PI_i_DATA_IN <= 8'b10000000;
      PI_i_RESET <= 1'b0;
    end

    // state 3
    if (cycle == 2) begin
      PI_i_CLK <= 1'b1;
      PI_i_TX_ENABLE <= 1'b1;
      PI_i_DATA_IN <= 8'b10000000;
      PI_i_RESET <= 1'b0;
    end

    // state 4
    if (cycle == 3) begin
      PI_i_CLK <= 1'b0;
      PI_i_TX_ENABLE <= 1'b1;
      PI_i_DATA_IN <= 8'b10000000;
      PI_i_RESET <= 1'b0;
    end

    // state 5
    if (cycle == 4) begin
      PI_i_CLK <= 1'b1;
      PI_i_TX_ENABLE <= 1'b1;
      PI_i_DATA_IN <= 8'b10000000;
      PI_i_RESET <= 1'b0;
    end

    // state 6
    if (cycle == 5) begin
      PI_i_CLK <= 1'b0;
      PI_i_TX_ENABLE <= 1'b1;
      PI_i_DATA_IN <= 8'b10000000;
      PI_i_RESET <= 1'b0;
    end

    // state 7
    if (cycle == 6) begin
      PI_i_CLK <= 1'b1;
      PI_i_TX_ENABLE <= 1'b1;
      PI_i_DATA_IN <= 8'b10000000;
      PI_i_RESET <= 1'b0;
    end

    // state 8
    if (cycle == 7) begin
      PI_i_CLK <= 1'b0;
      PI_i_TX_ENABLE <= 1'b1;
      PI_i_DATA_IN <= 8'b10000000;
      PI_i_RESET <= 1'b0;
    end

    // state 9
    if (cycle == 8) begin
      PI_i_CLK <= 1'b1;
      PI_i_TX_ENABLE <= 1'b1;
      PI_i_DATA_IN <= 8'b10000000;
      PI_i_RESET <= 1'b0;
    end

    // state 10
    if (cycle == 9) begin
      PI_i_CLK <= 1'b0;
      PI_i_TX_ENABLE <= 1'b1;
      PI_i_DATA_IN <= 8'b10000000;
      PI_i_RESET <= 1'b0;
    end

    // state 11
    if (cycle == 10) begin
      PI_i_CLK <= 1'b1;
      PI_i_TX_ENABLE <= 1'b1;
      PI_i_DATA_IN <= 8'b10000000;
      PI_i_RESET <= 1'b0;
    end

    // state 12
    if (cycle == 11) begin
      PI_i_CLK <= 1'b0;
      PI_i_TX_ENABLE <= 1'b1;
      PI_i_DATA_IN <= 8'b10000000;
      PI_i_RESET <= 1'b0;
    end

    // state 13
    if (cycle == 12) begin
      PI_i_CLK <= 1'b1;
      PI_i_TX_ENABLE <= 1'b1;
      PI_i_DATA_IN <= 8'b10000000;
      PI_i_RESET <= 1'b0;
    end

    // state 14
    if (cycle == 13) begin
      PI_i_CLK <= 1'b0;
      PI_i_TX_ENABLE <= 1'b1;
      PI_i_DATA_IN <= 8'b10000000;
      PI_i_RESET <= 1'b0;
    end

    // state 15
    if (cycle == 14) begin
      PI_i_CLK <= 1'b1;
      PI_i_TX_ENABLE <= 1'b1;
      PI_i_DATA_IN <= 8'b10000000;
      PI_i_RESET <= 1'b0;
    end

    // state 16
    if (cycle == 15) begin
      PI_i_CLK <= 1'b0;
      PI_i_TX_ENABLE <= 1'b1;
      PI_i_DATA_IN <= 8'b10000000;
      PI_i_RESET <= 1'b0;
    end

    // state 17
    if (cycle == 16) begin
      PI_i_CLK <= 1'b1;
      PI_i_TX_ENABLE <= 1'b1;
      PI_i_DATA_IN <= 8'b10000000;
      PI_i_RESET <= 1'b0;
    end

    // state 18
    if (cycle == 17) begin
      PI_i_CLK <= 1'b0;
      PI_i_TX_ENABLE <= 1'b1;
      PI_i_DATA_IN <= 8'b10000000;
      PI_i_RESET <= 1'b0;
    end

    // state 19
    if (cycle == 18) begin
      PI_i_CLK <= 1'b1;
      PI_i_TX_ENABLE <= 1'b1;
      PI_i_DATA_IN <= 8'b10000000;
      PI_i_RESET <= 1'b0;
    end

    // state 20
    if (cycle == 19) begin
      PI_i_CLK <= 1'b0;
      PI_i_TX_ENABLE <= 1'b1;
      PI_i_DATA_IN <= 8'b10000000;
      PI_i_RESET <= 1'b0;
    end

    // state 21
    if (cycle == 20) begin
      PI_i_CLK <= 1'b1;
      PI_i_TX_ENABLE <= 1'b1;
      PI_i_DATA_IN <= 8'b10000000;
      PI_i_RESET <= 1'b0;
    end

    // state 22
    if (cycle == 21) begin
      PI_i_CLK <= 1'b0;
      PI_i_TX_ENABLE <= 1'b1;
      PI_i_DATA_IN <= 8'b10000000;
      PI_i_RESET <= 1'b0;
    end

    // state 23
    if (cycle == 22) begin
      PI_i_CLK <= 1'b1;
      PI_i_TX_ENABLE <= 1'b1;
      PI_i_DATA_IN <= 8'b10000000;
      PI_i_RESET <= 1'b0;
    end

    // state 24
    if (cycle == 23) begin
      PI_i_CLK <= 1'b0;
      PI_i_TX_ENABLE <= 1'b1;
      PI_i_DATA_IN <= 8'b10000000;
      PI_i_RESET <= 1'b0;
    end

    genclock <= cycle < 24;
    cycle <= cycle + 1;
  end
endmodule
