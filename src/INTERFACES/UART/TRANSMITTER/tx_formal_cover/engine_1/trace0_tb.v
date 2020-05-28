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
  reg [7:0] PI_i_DATA_IN;
  reg [0:0] PI_i_TX_ENABLE;
  reg [0:0] PI_i_RESET;
  reg [0:0] PI_i_CLK;
  uart_transmitter UUT (
    .i_CLK_ENABLE(PI_i_CLK_ENABLE),
    .i_DATA_IN(PI_i_DATA_IN),
    .i_TX_ENABLE(PI_i_TX_ENABLE),
    .i_RESET(PI_i_RESET),
    .i_CLK(PI_i_CLK)
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
    // UUT.$and$./uart_transmitter.v:0$140_Y = 1'b1;
    // UUT.$eq$./uart_transmitter.v:113$145_Y = 1'b0;
    // UUT.$formal$./uart_transmitter.v:108$19_CHECK = 1'b1;
    // UUT.$formal$./uart_transmitter.v:114$20_CHECK = 1'b0;
    // UUT.$formal$./uart_transmitter.v:114$20_EN = 1'b0;
    // UUT.$formal$./uart_transmitter.v:117$21_CHECK = 1'b0;
    // UUT.$formal$./uart_transmitter.v:117$21_EN = 1'b0;
    // UUT.$formal$./uart_transmitter.v:118$22_CHECK = 1'b0;
    // UUT.$formal$./uart_transmitter.v:119$23_CHECK = 1'b0;
    // UUT.$formal$./uart_transmitter.v:126$24_CHECK = 1'b0;
    // UUT.$formal$./uart_transmitter.v:126$24_EN = 1'b0;
    // UUT.$formal$./uart_transmitter.v:132$25_CHECK = 1'b0;
    // UUT.$formal$./uart_transmitter.v:132$25_EN = 1'b0;
    // UUT.$formal$./uart_transmitter.v:133$26_CHECK = 1'b0;
    // UUT.$formal$./uart_transmitter.v:134$27_CHECK = 1'b0;
    // UUT.$formal$./uart_transmitter.v:138$28_CHECK = 1'b0;
    // UUT.$formal$./uart_transmitter.v:138$28_EN = 1'b0;
    // UUT.$formal$./uart_transmitter.v:139$29_CHECK = 1'b0;
    // UUT.$formal$./uart_transmitter.v:140$30_CHECK = 1'b0;
    // UUT.$formal$./uart_transmitter.v:145$31_CHECK = 1'b0;
    // UUT.$formal$./uart_transmitter.v:145$31_EN = 1'b0;
    // UUT.$formal$./uart_transmitter.v:147$32_CHECK = 1'b0;
    // UUT.$formal$./uart_transmitter.v:147$32_EN = 1'b0;
    // UUT.$formal$./uart_transmitter.v:148$33_CHECK = 1'b0;
    // UUT.$formal$./uart_transmitter.v:148$33_EN = 1'b0;
    // UUT.$formal$./uart_transmitter.v:149$34_CHECK = 1'b0;
    // UUT.$formal$./uart_transmitter.v:153$35_CHECK = 1'b0;
    // UUT.$formal$./uart_transmitter.v:153$35_EN = 1'b0;
    // UUT.$formal$./uart_transmitter.v:154$36_CHECK = 1'b0;
    // UUT.$formal$./uart_transmitter.v:155$37_CHECK = 1'b0;
    // UUT.$formal$./uart_transmitter.v:160$38_CHECK = 1'b0;
    // UUT.$formal$./uart_transmitter.v:160$38_EN = 1'b0;
    // UUT.$formal$./uart_transmitter.v:162$39_CHECK = 1'b0;
    // UUT.$formal$./uart_transmitter.v:162$39_EN = 1'b0;
    // UUT.$formal$./uart_transmitter.v:164$40_CHECK = 1'b0;
    // UUT.$formal$./uart_transmitter.v:164$40_EN = 1'b0;
    // UUT.$formal$./uart_transmitter.v:166$41_CHECK = 1'b0;
    // UUT.$formal$./uart_transmitter.v:166$41_EN = 1'b0;
    // UUT.$formal$./uart_transmitter.v:168$42_CHECK = 1'b0;
    // UUT.$formal$./uart_transmitter.v:168$42_EN = 1'b0;
    // UUT.$formal$./uart_transmitter.v:170$43_CHECK = 1'b0;
    // UUT.$formal$./uart_transmitter.v:170$43_EN = 1'b0;
    // UUT.$past$./uart_transmitter.v:128$6$0 = 1'b0;
    // UUT.$past$./uart_transmitter.v:131$7$0 = 2'b10;
    // UUT.$past$./uart_transmitter.v:146$10$0 = 1'b0;
    // UUT.$past$./uart_transmitter.v:150$11$0 = 4'b0000;
    // UUT.$past$./uart_transmitter.v:179$16$0 = 1'b0;
    // UUT.$past$./uart_transmitter.v:180$17$0 = 8'b00000000;
    UUT.o_TX = 1'b0;
    UUT.o_TX_BUSY = 1'b1;
    UUT.r_BIT_COUNT = 4'b0000;
    UUT.r_CURRENT_STATE = 2'b00;
    UUT.r_DATA_REG = 8'b00000000;
    UUT.r_PAST_VALID = 1'b0;

    // state 0
    PI_i_CLK_ENABLE = 1'b1;
    PI_i_DATA_IN = 8'b00000000;
    PI_i_TX_ENABLE = 1'b0;
    PI_i_RESET = 1'b0;
    PI_i_CLK = 1'b0;
  end
  always @(posedge clock) begin
    // state 1
    if (cycle == 0) begin
      PI_i_CLK_ENABLE <= 1'b1;
      PI_i_DATA_IN <= 8'b00000010;
      PI_i_TX_ENABLE <= 1'b1;
      PI_i_RESET <= 1'b0;
      PI_i_CLK <= 1'b1;
    end

    // state 2
    if (cycle == 1) begin
      PI_i_CLK_ENABLE <= 1'b1;
      PI_i_DATA_IN <= 8'b00000010;
      PI_i_TX_ENABLE <= 1'b1;
      PI_i_RESET <= 1'b0;
      PI_i_CLK <= 1'b0;
    end

    // state 3
    if (cycle == 2) begin
      PI_i_CLK_ENABLE <= 1'b1;
      PI_i_DATA_IN <= 8'b00000001;
      PI_i_TX_ENABLE <= 1'b1;
      PI_i_RESET <= 1'b0;
      PI_i_CLK <= 1'b1;
    end

    // state 4
    if (cycle == 3) begin
      PI_i_CLK_ENABLE <= 1'b1;
      PI_i_DATA_IN <= 8'b00000001;
      PI_i_TX_ENABLE <= 1'b1;
      PI_i_RESET <= 1'b0;
      PI_i_CLK <= 1'b0;
    end

    // state 5
    if (cycle == 4) begin
      PI_i_CLK_ENABLE <= 1'b1;
      PI_i_DATA_IN <= 8'b00000000;
      PI_i_TX_ENABLE <= 1'b0;
      PI_i_RESET <= 1'b0;
      PI_i_CLK <= 1'b1;
    end

    // state 6
    if (cycle == 5) begin
      PI_i_CLK_ENABLE <= 1'b1;
      PI_i_DATA_IN <= 8'b00000000;
      PI_i_TX_ENABLE <= 1'b0;
      PI_i_RESET <= 1'b0;
      PI_i_CLK <= 1'b0;
    end

    // state 7
    if (cycle == 6) begin
      PI_i_CLK_ENABLE <= 1'b1;
      PI_i_DATA_IN <= 8'b00000000;
      PI_i_TX_ENABLE <= 1'b0;
      PI_i_RESET <= 1'b0;
      PI_i_CLK <= 1'b1;
    end

    // state 8
    if (cycle == 7) begin
      PI_i_CLK_ENABLE <= 1'b1;
      PI_i_DATA_IN <= 8'b00000000;
      PI_i_TX_ENABLE <= 1'b0;
      PI_i_RESET <= 1'b0;
      PI_i_CLK <= 1'b0;
    end

    // state 9
    if (cycle == 8) begin
      PI_i_CLK_ENABLE <= 1'b1;
      PI_i_DATA_IN <= 8'b00000000;
      PI_i_TX_ENABLE <= 1'b0;
      PI_i_RESET <= 1'b0;
      PI_i_CLK <= 1'b1;
    end

    // state 10
    if (cycle == 9) begin
      PI_i_CLK_ENABLE <= 1'b1;
      PI_i_DATA_IN <= 8'b00000000;
      PI_i_TX_ENABLE <= 1'b0;
      PI_i_RESET <= 1'b0;
      PI_i_CLK <= 1'b0;
    end

    // state 11
    if (cycle == 10) begin
      PI_i_CLK_ENABLE <= 1'b1;
      PI_i_DATA_IN <= 8'b00000001;
      PI_i_TX_ENABLE <= 1'b1;
      PI_i_RESET <= 1'b0;
      PI_i_CLK <= 1'b1;
    end

    // state 12
    if (cycle == 11) begin
      PI_i_CLK_ENABLE <= 1'b1;
      PI_i_DATA_IN <= 8'b00000001;
      PI_i_TX_ENABLE <= 1'b1;
      PI_i_RESET <= 1'b0;
      PI_i_CLK <= 1'b0;
    end

    // state 13
    if (cycle == 12) begin
      PI_i_CLK_ENABLE <= 1'b1;
      PI_i_DATA_IN <= 8'b00000000;
      PI_i_TX_ENABLE <= 1'b0;
      PI_i_RESET <= 1'b1;
      PI_i_CLK <= 1'b1;
    end

    // state 14
    if (cycle == 13) begin
      PI_i_CLK_ENABLE <= 1'b1;
      PI_i_DATA_IN <= 8'b00000000;
      PI_i_TX_ENABLE <= 1'b0;
      PI_i_RESET <= 1'b1;
      PI_i_CLK <= 1'b0;
    end

    genclock <= cycle < 14;
    cycle <= cycle + 1;
  end
endmodule
