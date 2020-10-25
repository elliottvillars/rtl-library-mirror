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
  reg [0:0] PI_i_TX_ENABLE;
  reg [0:0] PI_i_CLK;
  reg [7:0] PI_i_DATA_IN;
  reg [0:0] PI_i_RESET;
  uart_transmitter UUT (
    .i_TX_ENABLE(PI_i_TX_ENABLE),
    .i_CLK(PI_i_CLK),
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
    // UUT.$and$./uart_transmitter.v:143$109_Y = 32'b00000000000000000000000000000001;
    // UUT.$eq$./uart_transmitter.v:169$234_Y = 1'b1;
    // UUT.$formal$./uart_transmitter.v:137$36_CHECK = 1'b0;
    // UUT.$formal$./uart_transmitter.v:155$39_CHECK = 1'b0;
    // UUT.$formal$./uart_transmitter.v:155$39_EN = 1'b0;
    // UUT.$formal$./uart_transmitter.v:156$40_CHECK = 1'b0;
    // UUT.$formal$./uart_transmitter.v:157$41_CHECK = 1'b0;
    // UUT.$formal$./uart_transmitter.v:160$42_CHECK = 1'b0;
    // UUT.$formal$./uart_transmitter.v:160$42_EN = 1'b0;
    // UUT.$formal$./uart_transmitter.v:171$44_CHECK = 1'b0;
    // UUT.$formal$./uart_transmitter.v:171$44_EN = 1'b0;
    // UUT.$formal$./uart_transmitter.v:172$45_CHECK = 1'b0;
    // UUT.$formal$./uart_transmitter.v:173$46_CHECK = 1'b0;
    // UUT.$formal$./uart_transmitter.v:174$47_CHECK = 1'b0;
    // UUT.$formal$./uart_transmitter.v:175$48_CHECK = 1'b0;
    // UUT.$formal$./uart_transmitter.v:176$49_CHECK = 1'b0;
    // UUT.$formal$./uart_transmitter.v:177$50_CHECK = 1'b0;
    // UUT.$formal$./uart_transmitter.v:184$52_CHECK = 1'b0;
    // UUT.$formal$./uart_transmitter.v:184$52_EN = 1'b0;
    // UUT.$formal$./uart_transmitter.v:186$53_CHECK = 1'b0;
    // UUT.$formal$./uart_transmitter.v:186$53_EN = 1'b0;
    // UUT.$formal$./uart_transmitter.v:188$54_CHECK = 1'b0;
    // UUT.$formal$./uart_transmitter.v:188$54_EN = 1'b0;
    // UUT.$formal$./uart_transmitter.v:190$55_CHECK = 1'b0;
    // UUT.$formal$./uart_transmitter.v:190$55_EN = 1'b0;
    // UUT.$formal$./uart_transmitter.v:192$56_CHECK = 1'b0;
    // UUT.$formal$./uart_transmitter.v:192$56_EN = 1'b0;
    // UUT.$formal$./uart_transmitter.v:194$57_CHECK = 1'b0;
    // UUT.$formal$./uart_transmitter.v:194$57_EN = 1'b0;
    // UUT.$formal$./uart_transmitter.v:197$58_CHECK = 1'b0;
    // UUT.$formal$./uart_transmitter.v:197$58_EN = 1'b0;
    // UUT.$formal$./uart_transmitter.v:200$59_CHECK = 1'b0;
    // UUT.$formal$./uart_transmitter.v:200$59_EN = 1'b0;
    // UUT.$formal$./uart_transmitter.v:201$60_CHECK = 1'b0;
    // UUT.$formal$./uart_transmitter.v:205$61_CHECK = 1'b0;
    // UUT.$formal$./uart_transmitter.v:205$61_EN = 1'b0;
    // UUT.$formal$./uart_transmitter.v:206$62_CHECK = 1'b0;
    // UUT.$formal$./uart_transmitter.v:212$63_CHECK = 1'b0;
    // UUT.$formal$./uart_transmitter.v:212$63_EN = 1'b0;
    // UUT.$formal$./uart_transmitter.v:214$64_CHECK = 1'b0;
    // UUT.$formal$./uart_transmitter.v:214$64_EN = 1'b0;
    // UUT.$formal$./uart_transmitter.v:216$65_CHECK = 1'b0;
    // UUT.$formal$./uart_transmitter.v:216$65_EN = 1'b0;
    // UUT.$formal$./uart_transmitter.v:218$66_CHECK = 1'b0;
    // UUT.$formal$./uart_transmitter.v:218$66_EN = 1'b0;
    // UUT.$past$./uart_transmitter.v:138$1$0 = 2'b10;
    // UUT.$past$./uart_transmitter.v:138$2$0 = 1'b1;
    // UUT.$past$./uart_transmitter.v:141$3$0 = 8'b00111110;
    // UUT.$past$./uart_transmitter.v:148$9$0 = 4'b0000;
    // UUT.$past$./uart_transmitter.v:156$12$0 = 3'b000;
    // UUT.$past$./uart_transmitter.v:160$14$0 = 8'b10000000;
    // UUT.$past$./uart_transmitter.v:197$27$0 = 32'b00000000000000000000000000000000;
    UUT.f_PAST_VALID = 1'b0;
    UUT.f_TX_COUNTER = 4'b0000;
    UUT.f_TX_DATA = 8'b00111110;
    UUT.o_TX = 1'b0;
    UUT.o_TX_BUSY = 1'b0;
    UUT.r_BAUD_COUNTER = 32'b11111111111111111111111111000100;
    UUT.r_BIT_COUNT = 3'b011;
    UUT.r_CURRENT_STATE = 2'b10;
    UUT.r_DATA_REG = 8'b00111110;
    UUT.r_STATE_CHANGE_EN = 1'b1;

    // state 0
    PI_i_TX_ENABLE = 1'b0;
    PI_i_CLK = 1'b0;
    PI_i_DATA_IN = 8'b00000000;
    PI_i_RESET = 1'b0;
  end
  always @(posedge clock) begin
    // state 1
    if (cycle == 0) begin
      PI_i_TX_ENABLE <= 1'b1;
      PI_i_CLK <= 1'b1;
      PI_i_DATA_IN <= 8'b10000000;
      PI_i_RESET <= 1'b0;
    end

    // state 2
    if (cycle == 1) begin
      PI_i_TX_ENABLE <= 1'b1;
      PI_i_CLK <= 1'b0;
      PI_i_DATA_IN <= 8'b10000000;
      PI_i_RESET <= 1'b0;
    end

    // state 3
    if (cycle == 2) begin
      PI_i_TX_ENABLE <= 1'b1;
      PI_i_CLK <= 1'b1;
      PI_i_DATA_IN <= 8'b00000000;
      PI_i_RESET <= 1'b0;
    end

    // state 4
    if (cycle == 3) begin
      PI_i_TX_ENABLE <= 1'b1;
      PI_i_CLK <= 1'b0;
      PI_i_DATA_IN <= 8'b00000000;
      PI_i_RESET <= 1'b0;
    end

    // state 5
    if (cycle == 4) begin
      PI_i_TX_ENABLE <= 1'b1;
      PI_i_CLK <= 1'b1;
      PI_i_DATA_IN <= 8'b10000000;
      PI_i_RESET <= 1'b0;
    end

    // state 6
    if (cycle == 5) begin
      PI_i_TX_ENABLE <= 1'b1;
      PI_i_CLK <= 1'b0;
      PI_i_DATA_IN <= 8'b10000000;
      PI_i_RESET <= 1'b0;
    end

    // state 7
    if (cycle == 6) begin
      PI_i_TX_ENABLE <= 1'b1;
      PI_i_CLK <= 1'b1;
      PI_i_DATA_IN <= 8'b00000000;
      PI_i_RESET <= 1'b0;
    end

    // state 8
    if (cycle == 7) begin
      PI_i_TX_ENABLE <= 1'b1;
      PI_i_CLK <= 1'b0;
      PI_i_DATA_IN <= 8'b00000000;
      PI_i_RESET <= 1'b0;
    end

    // state 9
    if (cycle == 8) begin
      PI_i_TX_ENABLE <= 1'b1;
      PI_i_CLK <= 1'b1;
      PI_i_DATA_IN <= 8'b10000000;
      PI_i_RESET <= 1'b0;
    end

    // state 10
    if (cycle == 9) begin
      PI_i_TX_ENABLE <= 1'b1;
      PI_i_CLK <= 1'b0;
      PI_i_DATA_IN <= 8'b10000000;
      PI_i_RESET <= 1'b0;
    end

    // state 11
    if (cycle == 10) begin
      PI_i_TX_ENABLE <= 1'b1;
      PI_i_CLK <= 1'b1;
      PI_i_DATA_IN <= 8'b00000000;
      PI_i_RESET <= 1'b0;
    end

    // state 12
    if (cycle == 11) begin
      PI_i_TX_ENABLE <= 1'b1;
      PI_i_CLK <= 1'b0;
      PI_i_DATA_IN <= 8'b00000000;
      PI_i_RESET <= 1'b0;
    end

    // state 13
    if (cycle == 12) begin
      PI_i_TX_ENABLE <= 1'b1;
      PI_i_CLK <= 1'b1;
      PI_i_DATA_IN <= 8'b10000000;
      PI_i_RESET <= 1'b0;
    end

    // state 14
    if (cycle == 13) begin
      PI_i_TX_ENABLE <= 1'b1;
      PI_i_CLK <= 1'b0;
      PI_i_DATA_IN <= 8'b10000000;
      PI_i_RESET <= 1'b0;
    end

    // state 15
    if (cycle == 14) begin
      PI_i_TX_ENABLE <= 1'b1;
      PI_i_CLK <= 1'b1;
      PI_i_DATA_IN <= 8'b00000000;
      PI_i_RESET <= 1'b0;
    end

    // state 16
    if (cycle == 15) begin
      PI_i_TX_ENABLE <= 1'b1;
      PI_i_CLK <= 1'b0;
      PI_i_DATA_IN <= 8'b00000000;
      PI_i_RESET <= 1'b0;
    end

    // state 17
    if (cycle == 16) begin
      PI_i_TX_ENABLE <= 1'b1;
      PI_i_CLK <= 1'b1;
      PI_i_DATA_IN <= 8'b10000000;
      PI_i_RESET <= 1'b0;
    end

    // state 18
    if (cycle == 17) begin
      PI_i_TX_ENABLE <= 1'b1;
      PI_i_CLK <= 1'b0;
      PI_i_DATA_IN <= 8'b10000000;
      PI_i_RESET <= 1'b0;
    end

    // state 19
    if (cycle == 18) begin
      PI_i_TX_ENABLE <= 1'b1;
      PI_i_CLK <= 1'b1;
      PI_i_DATA_IN <= 8'b00000000;
      PI_i_RESET <= 1'b0;
    end

    // state 20
    if (cycle == 19) begin
      PI_i_TX_ENABLE <= 1'b1;
      PI_i_CLK <= 1'b0;
      PI_i_DATA_IN <= 8'b00000000;
      PI_i_RESET <= 1'b0;
    end

    // state 21
    if (cycle == 20) begin
      PI_i_TX_ENABLE <= 1'b1;
      PI_i_CLK <= 1'b1;
      PI_i_DATA_IN <= 8'b10000000;
      PI_i_RESET <= 1'b0;
    end

    // state 22
    if (cycle == 21) begin
      PI_i_TX_ENABLE <= 1'b1;
      PI_i_CLK <= 1'b0;
      PI_i_DATA_IN <= 8'b10000000;
      PI_i_RESET <= 1'b0;
    end

    // state 23
    if (cycle == 22) begin
      PI_i_TX_ENABLE <= 1'b1;
      PI_i_CLK <= 1'b1;
      PI_i_DATA_IN <= 8'b00000000;
      PI_i_RESET <= 1'b0;
    end

    // state 24
    if (cycle == 23) begin
      PI_i_TX_ENABLE <= 1'b1;
      PI_i_CLK <= 1'b0;
      PI_i_DATA_IN <= 8'b00000000;
      PI_i_RESET <= 1'b0;
    end

    // state 25
    if (cycle == 24) begin
      PI_i_TX_ENABLE <= 1'b1;
      PI_i_CLK <= 1'b1;
      PI_i_DATA_IN <= 8'b10000000;
      PI_i_RESET <= 1'b0;
    end

    // state 26
    if (cycle == 25) begin
      PI_i_TX_ENABLE <= 1'b1;
      PI_i_CLK <= 1'b0;
      PI_i_DATA_IN <= 8'b10000000;
      PI_i_RESET <= 1'b0;
    end

    // state 27
    if (cycle == 26) begin
      PI_i_TX_ENABLE <= 1'b1;
      PI_i_CLK <= 1'b1;
      PI_i_DATA_IN <= 8'b00000000;
      PI_i_RESET <= 1'b0;
    end

    // state 28
    if (cycle == 27) begin
      PI_i_TX_ENABLE <= 1'b1;
      PI_i_CLK <= 1'b0;
      PI_i_DATA_IN <= 8'b00000000;
      PI_i_RESET <= 1'b0;
    end

    // state 29
    if (cycle == 28) begin
      PI_i_TX_ENABLE <= 1'b1;
      PI_i_CLK <= 1'b1;
      PI_i_DATA_IN <= 8'b10000000;
      PI_i_RESET <= 1'b0;
    end

    // state 30
    if (cycle == 29) begin
      PI_i_TX_ENABLE <= 1'b1;
      PI_i_CLK <= 1'b0;
      PI_i_DATA_IN <= 8'b10000000;
      PI_i_RESET <= 1'b0;
    end

    // state 31
    if (cycle == 30) begin
      PI_i_TX_ENABLE <= 1'b1;
      PI_i_CLK <= 1'b1;
      PI_i_DATA_IN <= 8'b00000000;
      PI_i_RESET <= 1'b0;
    end

    // state 32
    if (cycle == 31) begin
      PI_i_TX_ENABLE <= 1'b1;
      PI_i_CLK <= 1'b0;
      PI_i_DATA_IN <= 8'b00000000;
      PI_i_RESET <= 1'b0;
    end

    // state 33
    if (cycle == 32) begin
      PI_i_TX_ENABLE <= 1'b1;
      PI_i_CLK <= 1'b1;
      PI_i_DATA_IN <= 8'b10000000;
      PI_i_RESET <= 1'b0;
    end

    // state 34
    if (cycle == 33) begin
      PI_i_TX_ENABLE <= 1'b1;
      PI_i_CLK <= 1'b0;
      PI_i_DATA_IN <= 8'b10000000;
      PI_i_RESET <= 1'b0;
    end

    // state 35
    if (cycle == 34) begin
      PI_i_TX_ENABLE <= 1'b1;
      PI_i_CLK <= 1'b1;
      PI_i_DATA_IN <= 8'b00000000;
      PI_i_RESET <= 1'b0;
    end

    // state 36
    if (cycle == 35) begin
      PI_i_TX_ENABLE <= 1'b1;
      PI_i_CLK <= 1'b0;
      PI_i_DATA_IN <= 8'b00000000;
      PI_i_RESET <= 1'b0;
    end

    // state 37
    if (cycle == 36) begin
      PI_i_TX_ENABLE <= 1'b1;
      PI_i_CLK <= 1'b1;
      PI_i_DATA_IN <= 8'b10000000;
      PI_i_RESET <= 1'b0;
    end

    // state 38
    if (cycle == 37) begin
      PI_i_TX_ENABLE <= 1'b1;
      PI_i_CLK <= 1'b0;
      PI_i_DATA_IN <= 8'b10000000;
      PI_i_RESET <= 1'b0;
    end

    // state 39
    if (cycle == 38) begin
      PI_i_TX_ENABLE <= 1'b1;
      PI_i_CLK <= 1'b1;
      PI_i_DATA_IN <= 8'b00000000;
      PI_i_RESET <= 1'b0;
    end

    // state 40
    if (cycle == 39) begin
      PI_i_TX_ENABLE <= 1'b1;
      PI_i_CLK <= 1'b0;
      PI_i_DATA_IN <= 8'b00000000;
      PI_i_RESET <= 1'b0;
    end

    // state 41
    if (cycle == 40) begin
      PI_i_TX_ENABLE <= 1'b1;
      PI_i_CLK <= 1'b1;
      PI_i_DATA_IN <= 8'b10000000;
      PI_i_RESET <= 1'b0;
    end

    // state 42
    if (cycle == 41) begin
      PI_i_TX_ENABLE <= 1'b1;
      PI_i_CLK <= 1'b0;
      PI_i_DATA_IN <= 8'b10000000;
      PI_i_RESET <= 1'b0;
    end

    // state 43
    if (cycle == 42) begin
      PI_i_TX_ENABLE <= 1'b1;
      PI_i_CLK <= 1'b1;
      PI_i_DATA_IN <= 8'b00000000;
      PI_i_RESET <= 1'b0;
    end

    // state 44
    if (cycle == 43) begin
      PI_i_TX_ENABLE <= 1'b1;
      PI_i_CLK <= 1'b0;
      PI_i_DATA_IN <= 8'b00000000;
      PI_i_RESET <= 1'b0;
    end

    // state 45
    if (cycle == 44) begin
      PI_i_TX_ENABLE <= 1'b1;
      PI_i_CLK <= 1'b1;
      PI_i_DATA_IN <= 8'b10000000;
      PI_i_RESET <= 1'b0;
    end

    // state 46
    if (cycle == 45) begin
      PI_i_TX_ENABLE <= 1'b1;
      PI_i_CLK <= 1'b0;
      PI_i_DATA_IN <= 8'b10000000;
      PI_i_RESET <= 1'b0;
    end

    // state 47
    if (cycle == 46) begin
      PI_i_TX_ENABLE <= 1'b1;
      PI_i_CLK <= 1'b1;
      PI_i_DATA_IN <= 8'b00000000;
      PI_i_RESET <= 1'b0;
    end

    // state 48
    if (cycle == 47) begin
      PI_i_TX_ENABLE <= 1'b1;
      PI_i_CLK <= 1'b0;
      PI_i_DATA_IN <= 8'b00000000;
      PI_i_RESET <= 1'b0;
    end

    // state 49
    if (cycle == 48) begin
      PI_i_TX_ENABLE <= 1'b1;
      PI_i_CLK <= 1'b1;
      PI_i_DATA_IN <= 8'b10000000;
      PI_i_RESET <= 1'b0;
    end

    // state 50
    if (cycle == 49) begin
      PI_i_TX_ENABLE <= 1'b1;
      PI_i_CLK <= 1'b0;
      PI_i_DATA_IN <= 8'b10000000;
      PI_i_RESET <= 1'b0;
    end

    // state 51
    if (cycle == 50) begin
      PI_i_TX_ENABLE <= 1'b1;
      PI_i_CLK <= 1'b1;
      PI_i_DATA_IN <= 8'b00000000;
      PI_i_RESET <= 1'b0;
    end

    // state 52
    if (cycle == 51) begin
      PI_i_TX_ENABLE <= 1'b1;
      PI_i_CLK <= 1'b0;
      PI_i_DATA_IN <= 8'b00000000;
      PI_i_RESET <= 1'b0;
    end

    // state 53
    if (cycle == 52) begin
      PI_i_TX_ENABLE <= 1'b1;
      PI_i_CLK <= 1'b1;
      PI_i_DATA_IN <= 8'b00111110;
      PI_i_RESET <= 1'b0;
    end

    // state 54
    if (cycle == 53) begin
      PI_i_TX_ENABLE <= 1'b1;
      PI_i_CLK <= 1'b0;
      PI_i_DATA_IN <= 8'b00111110;
      PI_i_RESET <= 1'b0;
    end

    // state 55
    if (cycle == 54) begin
      PI_i_TX_ENABLE <= 1'b1;
      PI_i_CLK <= 1'b1;
      PI_i_DATA_IN <= 8'b00111110;
      PI_i_RESET <= 1'b0;
    end

    // state 56
    if (cycle == 55) begin
      PI_i_TX_ENABLE <= 1'b1;
      PI_i_CLK <= 1'b0;
      PI_i_DATA_IN <= 8'b00111110;
      PI_i_RESET <= 1'b0;
    end

    // state 57
    if (cycle == 56) begin
      PI_i_TX_ENABLE <= 1'b0;
      PI_i_CLK <= 1'b1;
      PI_i_DATA_IN <= 8'b00111110;
      PI_i_RESET <= 1'b0;
    end

    // state 58
    if (cycle == 57) begin
      PI_i_TX_ENABLE <= 1'b0;
      PI_i_CLK <= 1'b0;
      PI_i_DATA_IN <= 8'b00111110;
      PI_i_RESET <= 1'b0;
    end

    // state 59
    if (cycle == 58) begin
      PI_i_TX_ENABLE <= 1'b0;
      PI_i_CLK <= 1'b1;
      PI_i_DATA_IN <= 8'b00111110;
      PI_i_RESET <= 1'b0;
    end

    // state 60
    if (cycle == 59) begin
      PI_i_TX_ENABLE <= 1'b0;
      PI_i_CLK <= 1'b0;
      PI_i_DATA_IN <= 8'b00111110;
      PI_i_RESET <= 1'b0;
    end

    // state 61
    if (cycle == 60) begin
      PI_i_TX_ENABLE <= 1'b1;
      PI_i_CLK <= 1'b1;
      PI_i_DATA_IN <= 8'b00111110;
      PI_i_RESET <= 1'b0;
    end

    // state 62
    if (cycle == 61) begin
      PI_i_TX_ENABLE <= 1'b1;
      PI_i_CLK <= 1'b0;
      PI_i_DATA_IN <= 8'b00111110;
      PI_i_RESET <= 1'b0;
    end

    // state 63
    if (cycle == 62) begin
      PI_i_TX_ENABLE <= 1'b1;
      PI_i_CLK <= 1'b1;
      PI_i_DATA_IN <= 8'b00111110;
      PI_i_RESET <= 1'b1;
    end

    // state 64
    if (cycle == 63) begin
      PI_i_TX_ENABLE <= 1'b1;
      PI_i_CLK <= 1'b0;
      PI_i_DATA_IN <= 8'b00111110;
      PI_i_RESET <= 1'b1;
    end

    genclock <= cycle < 64;
    cycle <= cycle + 1;
  end
endmodule
