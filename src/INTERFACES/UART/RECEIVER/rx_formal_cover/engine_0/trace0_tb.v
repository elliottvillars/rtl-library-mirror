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
  reg [0:0] PI_i_RX;
  reg [0:0] PI_i_RESET;
  uart_receiver UUT (
    .i_CLK_ENABLE(PI_i_CLK_ENABLE),
    .i_CLK(PI_i_CLK),
    .i_RX(PI_i_RX),
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
    // UUT.$and$./uart_receiver.v:0$119_Y = 1'b0;
    // UUT.$auto$async2sync.cc:192:execute$800 = 2'b00;
    // UUT.$eq$./uart_receiver.v:136$124_Y = 1'b0;
    // UUT.$eq$./uart_receiver.v:162$141_Y = 1'b0;
    // UUT.$formal$./uart_receiver.v:137$17_EN = 1'b0;
    // UUT.$formal$./uart_receiver.v:139$18_CHECK = 1'b0;
    // UUT.$formal$./uart_receiver.v:146$19_CHECK = 1'b0;
    // UUT.$formal$./uart_receiver.v:146$19_EN = 1'b0;
    // UUT.$formal$./uart_receiver.v:147$20_CHECK = 1'b0;
    // UUT.$formal$./uart_receiver.v:148$21_CHECK = 1'b0;
    // UUT.$formal$./uart_receiver.v:149$22_CHECK = 1'b0;
    // UUT.$formal$./uart_receiver.v:153$23_CHECK = 1'b0;
    // UUT.$formal$./uart_receiver.v:153$23_EN = 1'b0;
    // UUT.$formal$./uart_receiver.v:154$24_CHECK = 1'b0;
    // UUT.$formal$./uart_receiver.v:155$25_CHECK = 1'b0;
    // UUT.$formal$./uart_receiver.v:156$26_CHECK = 1'b0;
    // UUT.$formal$./uart_receiver.v:157$27_CHECK = 1'b0;
    // UUT.$formal$./uart_receiver.v:163$28_CHECK = 1'b0;
    // UUT.$formal$./uart_receiver.v:163$28_EN = 1'b0;
    // UUT.$formal$./uart_receiver.v:164$29_CHECK = 1'b0;
    // UUT.$formal$./uart_receiver.v:168$30_CHECK = 1'b0;
    // UUT.$formal$./uart_receiver.v:168$30_EN = 1'b0;
    // UUT.$formal$./uart_receiver.v:169$31_CHECK = 1'b0;
    // UUT.$formal$./uart_receiver.v:171$32_CHECK = 1'b0;
    // UUT.$formal$./uart_receiver.v:171$32_EN = 1'b0;
    // UUT.$formal$./uart_receiver.v:172$33_CHECK = 1'b0;
    // UUT.$formal$./uart_receiver.v:177$34_CHECK = 1'b0;
    // UUT.$formal$./uart_receiver.v:177$34_EN = 1'b0;
    // UUT.$formal$./uart_receiver.v:179$35_CHECK = 1'b0;
    // UUT.$formal$./uart_receiver.v:179$35_EN = 1'b0;
    // UUT.$formal$./uart_receiver.v:181$36_CHECK = 1'b0;
    // UUT.$formal$./uart_receiver.v:181$36_EN = 1'b0;
    // UUT.$formal$./uart_receiver.v:183$37_CHECK = 1'b0;
    // UUT.$formal$./uart_receiver.v:183$37_EN = 1'b0;
    // UUT.$formal$./uart_receiver.v:185$38_CHECK = 1'b0;
    // UUT.$formal$./uart_receiver.v:185$38_EN = 1'b0;
    // UUT.$past$./uart_receiver.v:142$5$0 = 2'b01;
    // UUT.$past$./uart_receiver.v:157$9$0 = 4'b0000;
    // UUT.$past$./uart_receiver.v:165$12$0 = 8'b00000000;
    // UUT.$past$./uart_receiver.v:191$14$0 = 1'b0;
    UUT.o_DATA = 8'b00000100;
    UUT.o_FRAMING_ERROR = 1'b0;
    UUT.o_RX_DONE = 1'b0;
    UUT.r_BIT_COUNT = 4'b0000;
    UUT.r_CURRENT_STATE = 2'b00;
    UUT.r_DATA_REG = 8'b00000000;
    UUT.r_PAST_VALID = 1'b0;

    // state 0
    PI_i_CLK_ENABLE = 1'b1;
    PI_i_CLK = 1'b1;
    PI_i_RX = 1'b0;
    PI_i_RESET = 1'b0;
  end
  always @(posedge clock) begin
    // state 1
    if (cycle == 0) begin
      PI_i_CLK_ENABLE <= 1'b1;
      PI_i_CLK <= 1'b0;
      PI_i_RX <= 1'b0;
      PI_i_RESET <= 1'b0;
    end

    // state 2
    if (cycle == 1) begin
      PI_i_CLK_ENABLE <= 1'b1;
      PI_i_CLK <= 1'b1;
      PI_i_RX <= 1'b1;
      PI_i_RESET <= 1'b0;
    end

    // state 3
    if (cycle == 2) begin
      PI_i_CLK_ENABLE <= 1'b1;
      PI_i_CLK <= 1'b0;
      PI_i_RX <= 1'b1;
      PI_i_RESET <= 1'b0;
    end

    // state 4
    if (cycle == 3) begin
      PI_i_CLK_ENABLE <= 1'b1;
      PI_i_CLK <= 1'b1;
      PI_i_RX <= 1'b0;
      PI_i_RESET <= 1'b0;
    end

    // state 5
    if (cycle == 4) begin
      PI_i_CLK_ENABLE <= 1'b1;
      PI_i_CLK <= 1'b0;
      PI_i_RX <= 1'b0;
      PI_i_RESET <= 1'b0;
    end

    // state 6
    if (cycle == 5) begin
      PI_i_CLK_ENABLE <= 1'b1;
      PI_i_CLK <= 1'b1;
      PI_i_RX <= 1'b1;
      PI_i_RESET <= 1'b0;
    end

    // state 7
    if (cycle == 6) begin
      PI_i_CLK_ENABLE <= 1'b1;
      PI_i_CLK <= 1'b0;
      PI_i_RX <= 1'b1;
      PI_i_RESET <= 1'b0;
    end

    // state 8
    if (cycle == 7) begin
      PI_i_CLK_ENABLE <= 1'b1;
      PI_i_CLK <= 1'b1;
      PI_i_RX <= 1'b0;
      PI_i_RESET <= 1'b0;
    end

    // state 9
    if (cycle == 8) begin
      PI_i_CLK_ENABLE <= 1'b1;
      PI_i_CLK <= 1'b0;
      PI_i_RX <= 1'b1;
      PI_i_RESET <= 1'b0;
    end

    // state 10
    if (cycle == 9) begin
      PI_i_CLK_ENABLE <= 1'b0;
      PI_i_CLK <= 1'b1;
      PI_i_RX <= 1'b0;
      PI_i_RESET <= 1'b1;
    end

    // state 11
    if (cycle == 10) begin
      PI_i_CLK_ENABLE <= 1'b0;
      PI_i_CLK <= 1'b0;
      PI_i_RX <= 1'b1;
      PI_i_RESET <= 1'b1;
    end

    genclock <= cycle < 11;
    cycle <= cycle + 1;
  end
endmodule
