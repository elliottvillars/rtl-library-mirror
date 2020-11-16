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
    // UUT.$and$.\/uart_receiver .\v:0$134_Y  = 1'b0;
    // UUT.$auto$async2sync.\cc:171:execute$1012  = 2'b00;
    // UUT.$eq$.\/uart_receiver .\v:144$142_Y  = 1'b0;
    // UUT.$eq$.\/uart_receiver .\v:170$159_Y  = 1'b0;
    // UUT.$formal$.\/uart_receiver .\v:137$20_CHECK  = 1'b0;
    // UUT.$formal$.\/uart_receiver .\v:137$20_EN  = 1'b0;
    // UUT.$formal$.\/uart_receiver .\v:138$21_CHECK  = 1'b0;
    // UUT.$formal$.\/uart_receiver .\v:139$22_CHECK  = 1'b0;
    // UUT.$formal$.\/uart_receiver .\v:147$24_CHECK  = 1'b1;
    // UUT.$formal$.\/uart_receiver .\v:147$24_EN  = 1'b0;
    // UUT.$formal$.\/uart_receiver .\v:154$25_CHECK  = 1'b0;
    // UUT.$formal$.\/uart_receiver .\v:154$25_EN  = 1'b0;
    // UUT.$formal$.\/uart_receiver .\v:155$26_CHECK  = 1'b0;
    // UUT.$formal$.\/uart_receiver .\v:156$27_CHECK  = 1'b0;
    // UUT.$formal$.\/uart_receiver .\v:157$28_CHECK  = 1'b0;
    // UUT.$formal$.\/uart_receiver .\v:161$29_CHECK  = 1'b0;
    // UUT.$formal$.\/uart_receiver .\v:161$29_EN  = 1'b0;
    // UUT.$formal$.\/uart_receiver .\v:162$30_CHECK  = 1'b1;
    // UUT.$formal$.\/uart_receiver .\v:163$31_CHECK  = 1'b0;
    // UUT.$formal$.\/uart_receiver .\v:164$32_CHECK  = 1'b0;
    // UUT.$formal$.\/uart_receiver .\v:165$33_CHECK  = 1'b0;
    // UUT.$formal$.\/uart_receiver .\v:171$34_CHECK  = 1'b0;
    // UUT.$formal$.\/uart_receiver .\v:171$34_EN  = 1'b0;
    // UUT.$formal$.\/uart_receiver .\v:172$35_CHECK  = 1'b0;
    // UUT.$formal$.\/uart_receiver .\v:176$36_CHECK  = 1'b0;
    // UUT.$formal$.\/uart_receiver .\v:176$36_EN  = 1'b0;
    // UUT.$formal$.\/uart_receiver .\v:177$37_CHECK  = 1'b0;
    // UUT.$formal$.\/uart_receiver .\v:179$38_CHECK  = 1'b0;
    // UUT.$formal$.\/uart_receiver .\v:179$38_EN  = 1'b0;
    // UUT.$formal$.\/uart_receiver .\v:180$39_CHECK  = 1'b0;
    // UUT.$formal$.\/uart_receiver .\v:185$40_CHECK  = 1'b0;
    // UUT.$formal$.\/uart_receiver .\v:185$40_EN  = 1'b0;
    // UUT.$formal$.\/uart_receiver .\v:187$41_CHECK  = 1'b0;
    // UUT.$formal$.\/uart_receiver .\v:187$41_EN  = 1'b0;
    // UUT.$formal$.\/uart_receiver .\v:189$42_CHECK  = 1'b0;
    // UUT.$formal$.\/uart_receiver .\v:189$42_EN  = 1'b0;
    // UUT.$formal$.\/uart_receiver .\v:191$43_CHECK  = 1'b0;
    // UUT.$formal$.\/uart_receiver .\v:191$43_EN  = 1'b0;
    // UUT.$formal$.\/uart_receiver .\v:193$44_CHECK  = 1'b0;
    // UUT.$formal$.\/uart_receiver .\v:193$44_EN  = 1'b0;
    // UUT.$past$.\/uart_receiver .\v:136$3$0  = 1'b1;
    // UUT.$past$.\/uart_receiver .\v:150$6$0  = 2'b01;
    // UUT.$past$.\/uart_receiver .\v:165$10$0  = 4'b0000;
    // UUT.$past$.\/uart_receiver .\v:173$13$0  = 8'b00000000;
    UUT.o_DATA = 8'b00000000;
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
      PI_i_RX <= 1'b0;
      PI_i_RESET <= 1'b0;
    end

    // state 10
    if (cycle == 9) begin
      PI_i_CLK_ENABLE <= 1'b1;
      PI_i_CLK <= 1'b1;
      PI_i_RX <= 1'b1;
      PI_i_RESET <= 1'b0;
    end

    // state 11
    if (cycle == 10) begin
      PI_i_CLK_ENABLE <= 1'b1;
      PI_i_CLK <= 1'b0;
      PI_i_RX <= 1'b1;
      PI_i_RESET <= 1'b0;
    end

    genclock <= cycle < 11;
    cycle <= cycle + 1;
  end
endmodule
