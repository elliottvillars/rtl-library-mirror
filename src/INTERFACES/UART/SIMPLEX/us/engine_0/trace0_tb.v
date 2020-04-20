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
  reg [7:0] PI_i_DATA_IN;
  reg [0:0] PI_i_CLK;
  uart_simplex UUT (
    .i_TX_ENABLE(PI_i_TX_ENABLE),
    .i_DATA_IN(PI_i_DATA_IN),
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
    // UUT.$and$./uart_simplex.v:68$35_Y = 1'b0;
    // UUT.$eq$./uart_simplex.v:70$40_Y = 1'b0;
    // UUT.$formal$./uart_simplex.v:70$10_CHECK = 1'b0;
    // UUT.$formal$./uart_simplex.v:70$10_EN = 1'b0;
    // UUT.$formal$./uart_simplex.v:73$11_CHECK = 1'b0;
    // UUT.$formal$./uart_simplex.v:73$11_EN = 1'b0;
    UUT.r_BIT_COUNT = 4'b0000;
    UUT.r_CURRENT_STATE = 1'b0;
    UUT.r_PAST_VALID = 1'b0;
    UUT.r_TX_REG = 9'b000000000;

    // state 0
    PI_i_TX_ENABLE = 1'b0;
    PI_i_DATA_IN = 8'b00101010;
    PI_i_CLK = 1'b1;
  end
  always @(posedge clock) begin
    // state 1
    if (cycle == 0) begin
      PI_i_TX_ENABLE <= 1'b1;
      PI_i_DATA_IN <= 8'b00101010;
      PI_i_CLK <= 1'b0;
    end

    // state 2
    if (cycle == 1) begin
      PI_i_TX_ENABLE <= 1'b0;
      PI_i_DATA_IN <= 8'b00101010;
      PI_i_CLK <= 1'b1;
    end

    // state 3
    if (cycle == 2) begin
      PI_i_TX_ENABLE <= 1'b0;
      PI_i_DATA_IN <= 8'b00101010;
      PI_i_CLK <= 1'b0;
    end

    // state 4
    if (cycle == 3) begin
      PI_i_TX_ENABLE <= 1'b0;
      PI_i_DATA_IN <= 8'b00101010;
      PI_i_CLK <= 1'b1;
    end

    // state 5
    if (cycle == 4) begin
      PI_i_TX_ENABLE <= 1'b0;
      PI_i_DATA_IN <= 8'b00101010;
      PI_i_CLK <= 1'b0;
    end

    // state 6
    if (cycle == 5) begin
      PI_i_TX_ENABLE <= 1'b0;
      PI_i_DATA_IN <= 8'b00101010;
      PI_i_CLK <= 1'b1;
    end

    // state 7
    if (cycle == 6) begin
      PI_i_TX_ENABLE <= 1'b0;
      PI_i_DATA_IN <= 8'b00101010;
      PI_i_CLK <= 1'b0;
    end

    // state 8
    if (cycle == 7) begin
      PI_i_TX_ENABLE <= 1'b0;
      PI_i_DATA_IN <= 8'b00101010;
      PI_i_CLK <= 1'b1;
    end

    // state 9
    if (cycle == 8) begin
      PI_i_TX_ENABLE <= 1'b0;
      PI_i_DATA_IN <= 8'b00101010;
      PI_i_CLK <= 1'b0;
    end

    // state 10
    if (cycle == 9) begin
      PI_i_TX_ENABLE <= 1'b0;
      PI_i_DATA_IN <= 8'b00101010;
      PI_i_CLK <= 1'b1;
    end

    // state 11
    if (cycle == 10) begin
      PI_i_TX_ENABLE <= 1'b0;
      PI_i_DATA_IN <= 8'b00101010;
      PI_i_CLK <= 1'b0;
    end

    genclock <= cycle < 11;
    cycle <= cycle + 1;
  end
endmodule
