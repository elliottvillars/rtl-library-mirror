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
  reg [0:0] PI_i_READ_REQUEST;
  reg [0:0] PI_i_WRITE_REQUEST;
  reg [7:0] PI_i_INPUT;
  reg [0:0] PI_i_RESET;
  reg [0:0] PI_i_CLK;
  sync_fifo UUT (
    .i_READ_REQUEST(PI_i_READ_REQUEST),
    .i_WRITE_REQUEST(PI_i_WRITE_REQUEST),
    .i_INPUT(PI_i_INPUT),
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
    // UUT.$and$.\/sync_fifo .\v:0$187_Y  = 1'b1;
    // UUT.$eq$.\/sync_fifo .\v:171$222_Y  = 1'b0;
    // UUT.$eq$.\/sync_fifo .\v:177$229_Y  = 1'b0;
    // UUT.$formal$.\/sync_fifo .\v:130$35_CHECK  = 1'b0;
    // UUT.$formal$.\/sync_fifo .\v:130$35_EN  = 1'b0;
    // UUT.$formal$.\/sync_fifo .\v:133$36_CHECK  = 1'b0;
    // UUT.$formal$.\/sync_fifo .\v:137$37_CHECK  = 1'b0;
    // UUT.$formal$.\/sync_fifo .\v:137$37_EN  = 1'b0;
    // UUT.$formal$.\/sync_fifo .\v:138$38_CHECK  = 1'b0;
    // UUT.$formal$.\/sync_fifo .\v:139$39_CHECK  = 1'b0;
    // UUT.$formal$.\/sync_fifo .\v:140$40_CHECK  = 1'b0;
    // UUT.$formal$.\/sync_fifo .\v:144$41_CHECK  = 1'b0;
    // UUT.$formal$.\/sync_fifo .\v:145$42_CHECK  = 1'b0;
    // UUT.$formal$.\/sync_fifo .\v:146$43_CHECK  = 1'b0;
    // UUT.$formal$.\/sync_fifo .\v:147$44_CHECK  = 1'b0;
    // UUT.$formal$.\/sync_fifo .\v:147$44_EN  = 1'b0;
    // UUT.$formal$.\/sync_fifo .\v:151$45_CHECK  = 1'b0;
    // UUT.$formal$.\/sync_fifo .\v:158$49_CHECK  = 1'b0;
    // UUT.$formal$.\/sync_fifo .\v:158$49_EN  = 1'b0;
    // UUT.$formal$.\/sync_fifo .\v:159$50_CHECK  = 1'b0;
    // UUT.$formal$.\/sync_fifo .\v:160$51_CHECK  = 1'b0;
    // UUT.$formal$.\/sync_fifo .\v:161$52_CHECK  = 1'b0;
    // UUT.$formal$.\/sync_fifo .\v:165$53_CHECK  = 1'b0;
    // UUT.$formal$.\/sync_fifo .\v:165$53_EN  = 1'b0;
    // UUT.$formal$.\/sync_fifo .\v:166$54_CHECK  = 1'b0;
    // UUT.$formal$.\/sync_fifo .\v:167$55_CHECK  = 1'b0;
    // UUT.$formal$.\/sync_fifo .\v:168$56_CHECK  = 1'b0;
    // UUT.$formal$.\/sync_fifo .\v:172$57_CHECK  = 1'b0;
    // UUT.$formal$.\/sync_fifo .\v:172$57_EN  = 1'b0;
    // UUT.$formal$.\/sync_fifo .\v:173$58_CHECK  = 1'b0;
    // UUT.$formal$.\/sync_fifo .\v:174$59_CHECK  = 1'b0;
    // UUT.$formal$.\/sync_fifo .\v:178$60_CHECK  = 1'b0;
    // UUT.$formal$.\/sync_fifo .\v:178$60_EN  = 1'b0;
    // UUT.$formal$.\/sync_fifo .\v:179$61_CHECK  = 1'b0;
    // UUT.$formal$.\/sync_fifo .\v:180$62_CHECK  = 1'b0;
    // UUT.$formal$.\/sync_fifo .\v:183$63_CHECK  = 1'b0;
    // UUT.$formal$.\/sync_fifo .\v:183$63_EN  = 1'b0;
    // UUT.$past$.\/sync_fifo .\v:136$3$0  = 2'b00;
    // UUT.$past$.\/sync_fifo .\v:174$10$0  = 2'b00;
    // UUT.$past$.\/sync_fifo .\v:180$15$0  = 2'b00;
    // UUT.$past$.\/sync_fifo .\v:181$17$0  = 8'b00000000;
    UUT.o_FIFO_ALMOST_EMPTY = 1'b1;
    UUT.o_FIFO_ALMOST_FULL = 1'b0;
    UUT.o_FIFO_EMPTY = 1'b0;
    UUT.o_FIFO_FULL = 1'b0;
    UUT.o_OUTPUT = 8'b00000000;
    UUT.r_PAST_VALID = 1'b0;
    UUT.r_QUANTITY = 2'b00;
    UUT.r_READ_POINTER = 2'b00;
    UUT.r_WRITE_POINTER = 2'b00;
    UUT.r_MEMORY[2'b00] = 8'b00000000;
    UUT.r_MEMORY[2'b01] = 8'b00000001;
    UUT.r_MEMORY[2'b10] = 8'b00000000;
    UUT.r_MEMORY[2'b11] = 8'b00000000;

    // state 0
    PI_i_READ_REQUEST = 1'b0;
    PI_i_WRITE_REQUEST = 1'b0;
    PI_i_INPUT = 8'b00000000;
    PI_i_RESET = 1'b0;
    PI_i_CLK = 1'b0;
  end
  always @(posedge clock) begin
    // state 1
    if (cycle == 0) begin
      PI_i_READ_REQUEST <= 1'b0;
      PI_i_WRITE_REQUEST <= 1'b1;
      PI_i_INPUT <= 8'b00000001;
      PI_i_RESET <= 1'b0;
      PI_i_CLK <= 1'b1;
    end

    // state 2
    if (cycle == 1) begin
      PI_i_READ_REQUEST <= 1'b0;
      PI_i_WRITE_REQUEST <= 1'b1;
      PI_i_INPUT <= 8'b00000001;
      PI_i_RESET <= 1'b0;
      PI_i_CLK <= 1'b0;
    end

    // state 3
    if (cycle == 2) begin
      PI_i_READ_REQUEST <= 1'b0;
      PI_i_WRITE_REQUEST <= 1'b1;
      PI_i_INPUT <= 8'b00000000;
      PI_i_RESET <= 1'b0;
      PI_i_CLK <= 1'b1;
    end

    // state 4
    if (cycle == 3) begin
      PI_i_READ_REQUEST <= 1'b0;
      PI_i_WRITE_REQUEST <= 1'b1;
      PI_i_INPUT <= 8'b00000000;
      PI_i_RESET <= 1'b0;
      PI_i_CLK <= 1'b0;
    end

    // state 5
    if (cycle == 4) begin
      PI_i_READ_REQUEST <= 1'b0;
      PI_i_WRITE_REQUEST <= 1'b0;
      PI_i_INPUT <= 8'b10000001;
      PI_i_RESET <= 1'b0;
      PI_i_CLK <= 1'b1;
    end

    // state 6
    if (cycle == 5) begin
      PI_i_READ_REQUEST <= 1'b0;
      PI_i_WRITE_REQUEST <= 1'b0;
      PI_i_INPUT <= 8'b10000001;
      PI_i_RESET <= 1'b0;
      PI_i_CLK <= 1'b0;
    end

    genclock <= cycle < 6;
    cycle <= cycle + 1;
  end
endmodule
