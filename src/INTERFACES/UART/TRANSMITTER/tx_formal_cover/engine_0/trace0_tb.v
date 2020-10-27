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
  reg [7:0] PI_i_DATA_IN;
  reg [0:0] PI_i_TX_ENABLE;
  reg [0:0] PI_i_CLK_EN;
  reg [0:0] PI_i_RESET;
  reg [0:0] PI_i_CLK;
  uart_transmitter UUT (
    .i_DATA_IN(PI_i_DATA_IN),
    .i_TX_ENABLE(PI_i_TX_ENABLE),
    .i_CLK_EN(PI_i_CLK_EN),
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
    // UUT.$and$.\/uart_transmitter .\v:0$116_Y  = 1'b1;
    // UUT.$eq$.\/uart_transmitter .\v:112$121_Y  = 1'b1;
    // UUT.$formal$.\/uart_transmitter .\v:113$18_CHECK  = 1'b0;
    // UUT.$formal$.\/uart_transmitter .\v:113$18_EN  = 1'b0;
    // UUT.$formal$.\/uart_transmitter .\v:114$19_CHECK  = 1'b0;
    // UUT.$formal$.\/uart_transmitter .\v:115$20_CHECK  = 1'b0;
    // UUT.$formal$.\/uart_transmitter .\v:116$21_CHECK  = 1'b0;
    // UUT.$formal$.\/uart_transmitter .\v:117$22_CHECK  = 1'b0;
    // UUT.$formal$.\/uart_transmitter .\v:122$23_CHECK  = 1'b0;
    // UUT.$formal$.\/uart_transmitter .\v:122$23_EN  = 1'b0;
    // UUT.$formal$.\/uart_transmitter .\v:125$24_CHECK  = 1'b0;
    // UUT.$formal$.\/uart_transmitter .\v:125$24_EN  = 1'b0;
    // UUT.$formal$.\/uart_transmitter .\v:127$25_CHECK  = 1'b0;
    // UUT.$formal$.\/uart_transmitter .\v:127$25_EN  = 1'b0;
    // UUT.$formal$.\/uart_transmitter .\v:129$26_CHECK  = 1'b0;
    // UUT.$formal$.\/uart_transmitter .\v:129$26_EN  = 1'b0;
    // UUT.$formal$.\/uart_transmitter .\v:131$27_CHECK  = 1'b0;
    // UUT.$formal$.\/uart_transmitter .\v:131$27_EN  = 1'b0;
    // UUT.$formal$.\/uart_transmitter .\v:133$28_CHECK  = 1'b0;
    // UUT.$formal$.\/uart_transmitter .\v:133$28_EN  = 1'b0;
    // UUT.$formal$.\/uart_transmitter .\v:135$29_CHECK  = 1'b0;
    // UUT.$formal$.\/uart_transmitter .\v:135$29_EN  = 1'b0;
    // UUT.$formal$.\/uart_transmitter .\v:138$30_CHECK  = 1'b0;
    // UUT.$formal$.\/uart_transmitter .\v:138$30_EN  = 1'b0;
    // UUT.$formal$.\/uart_transmitter .\v:140$31_CHECK  = 1'b0;
    // UUT.$formal$.\/uart_transmitter .\v:140$31_EN  = 1'b0;
    // UUT.$formal$.\/uart_transmitter .\v:142$32_CHECK  = 1'b0;
    // UUT.$formal$.\/uart_transmitter .\v:142$32_EN  = 1'b0;
    // UUT.$formal$.\/uart_transmitter .\v:144$33_CHECK  = 1'b0;
    // UUT.$formal$.\/uart_transmitter .\v:144$33_EN  = 1'b0;
    // UUT.$formal$.\/uart_transmitter .\v:150$34_CHECK  = 1'b0;
    // UUT.$formal$.\/uart_transmitter .\v:150$34_EN  = 1'b0;
    // UUT.$formal$.\/uart_transmitter .\v:151$35_CHECK  = 1'b0;
    // UUT.$formal$.\/uart_transmitter .\v:154$36_CHECK  = 1'b0;
    // UUT.$formal$.\/uart_transmitter .\v:154$36_EN  = 1'b0;
    // UUT.$past$.\/uart_transmitter .\v:118$4$0  = 8'b00000000;
    // UUT.$past$.\/uart_transmitter .\v:122$5$0  = 1'b0;
    // UUT.$past$.\/uart_transmitter .\v:123$6$0  = 2'b00;
    // UUT.$past$.\/uart_transmitter .\v:151$10$0  = 3'b000;
    // UUT.$past$.\/uart_transmitter .\v:162$15$0  = 1'b0;
    UUT.f_PAST_VALID = 1'b0;
    UUT.r_BIT_COUNT = 3'b000;
    UUT.r_CURRENT_STATE = 2'b00;
    UUT.r_DATA_REG = 8'b00000000;

    // state 0
    PI_i_DATA_IN = 8'b10000000;
    PI_i_TX_ENABLE = 1'b1;
    PI_i_CLK_EN = 1'b1;
    PI_i_RESET = 1'b0;
    PI_i_CLK = 1'b0;
  end
  always @(posedge clock) begin
    // state 1
    if (cycle == 0) begin
      PI_i_DATA_IN <= 8'b10000000;
      PI_i_TX_ENABLE <= 1'b1;
      PI_i_CLK_EN <= 1'b1;
      PI_i_RESET <= 1'b0;
      PI_i_CLK <= 1'b1;
    end

    // state 2
    if (cycle == 1) begin
      PI_i_DATA_IN <= 8'b10000000;
      PI_i_TX_ENABLE <= 1'b1;
      PI_i_CLK_EN <= 1'b1;
      PI_i_RESET <= 1'b0;
      PI_i_CLK <= 1'b0;
    end

    // state 3
    if (cycle == 2) begin
      PI_i_DATA_IN <= 8'b10000000;
      PI_i_TX_ENABLE <= 1'b1;
      PI_i_CLK_EN <= 1'b1;
      PI_i_RESET <= 1'b0;
      PI_i_CLK <= 1'b1;
    end

    // state 4
    if (cycle == 3) begin
      PI_i_DATA_IN <= 8'b10000000;
      PI_i_TX_ENABLE <= 1'b1;
      PI_i_CLK_EN <= 1'b0;
      PI_i_RESET <= 1'b0;
      PI_i_CLK <= 1'b0;
    end

    // state 5
    if (cycle == 4) begin
      PI_i_DATA_IN <= 8'b10000000;
      PI_i_TX_ENABLE <= 1'b0;
      PI_i_CLK_EN <= 1'b1;
      PI_i_RESET <= 1'b0;
      PI_i_CLK <= 1'b1;
    end

    // state 6
    if (cycle == 5) begin
      PI_i_DATA_IN <= 8'b10000000;
      PI_i_TX_ENABLE <= 1'b0;
      PI_i_CLK_EN <= 1'b1;
      PI_i_RESET <= 1'b0;
      PI_i_CLK <= 1'b0;
    end

    // state 7
    if (cycle == 6) begin
      PI_i_DATA_IN <= 8'b10000000;
      PI_i_TX_ENABLE <= 1'b0;
      PI_i_CLK_EN <= 1'b1;
      PI_i_RESET <= 1'b0;
      PI_i_CLK <= 1'b1;
    end

    // state 8
    if (cycle == 7) begin
      PI_i_DATA_IN <= 8'b10000000;
      PI_i_TX_ENABLE <= 1'b0;
      PI_i_CLK_EN <= 1'b0;
      PI_i_RESET <= 1'b0;
      PI_i_CLK <= 1'b0;
    end

    // state 9
    if (cycle == 8) begin
      PI_i_DATA_IN <= 8'b10000000;
      PI_i_TX_ENABLE <= 1'b0;
      PI_i_CLK_EN <= 1'b1;
      PI_i_RESET <= 1'b0;
      PI_i_CLK <= 1'b1;
    end

    // state 10
    if (cycle == 9) begin
      PI_i_DATA_IN <= 8'b10000000;
      PI_i_TX_ENABLE <= 1'b0;
      PI_i_CLK_EN <= 1'b1;
      PI_i_RESET <= 1'b0;
      PI_i_CLK <= 1'b0;
    end

    // state 11
    if (cycle == 10) begin
      PI_i_DATA_IN <= 8'b10000000;
      PI_i_TX_ENABLE <= 1'b0;
      PI_i_CLK_EN <= 1'b0;
      PI_i_RESET <= 1'b0;
      PI_i_CLK <= 1'b1;
    end

    // state 12
    if (cycle == 11) begin
      PI_i_DATA_IN <= 8'b10000000;
      PI_i_TX_ENABLE <= 1'b0;
      PI_i_CLK_EN <= 1'b0;
      PI_i_RESET <= 1'b0;
      PI_i_CLK <= 1'b0;
    end

    genclock <= cycle < 12;
    cycle <= cycle + 1;
  end
endmodule
