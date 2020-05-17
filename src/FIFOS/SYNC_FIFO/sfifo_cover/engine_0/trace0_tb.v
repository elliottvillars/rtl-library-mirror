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
  reg [0:0] PI_i_READ_REQUEST;
  reg [0:0] PI_i_WRITE_REQUEST;
  reg [7:0] PI_i_INPUT;
  sync_fifo UUT (
    .i_CLK(PI_i_CLK),
    .i_READ_REQUEST(PI_i_READ_REQUEST),
    .i_WRITE_REQUEST(PI_i_WRITE_REQUEST),
    .i_INPUT(PI_i_INPUT)
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
    // UUT.$and$./sync_fifo.v:56$124_Y = 1'b1;
    // UUT.$eq$./sync_fifo.v:80$140_Y = 1'b0;
    // UUT.$eq$./sync_fifo.v:86$147_Y = 1'b0;
    // UUT.$formal$./sync_fifo.v:62$28_CHECK = 1'b0;
    // UUT.$formal$./sync_fifo.v:62$28_EN = 1'b0;
    // UUT.$formal$./sync_fifo.v:64$29_CHECK = 1'b0;
    // UUT.$formal$./sync_fifo.v:67$30_CHECK = 1'b0;
    // UUT.$formal$./sync_fifo.v:67$30_EN = 1'b0;
    // UUT.$formal$./sync_fifo.v:68$31_CHECK = 1'b0;
    // UUT.$formal$./sync_fifo.v:72$32_CHECK = 1'b0;
    // UUT.$formal$./sync_fifo.v:72$32_EN = 1'b0;
    // UUT.$formal$./sync_fifo.v:73$33_CHECK = 1'b0;
    // UUT.$formal$./sync_fifo.v:77$34_CHECK = 1'b0;
    // UUT.$formal$./sync_fifo.v:77$34_EN = 1'b0;
    // UUT.$formal$./sync_fifo.v:78$35_CHECK = 1'b0;
    // UUT.$formal$./sync_fifo.v:82$36_CHECK = 1'b0;
    // UUT.$formal$./sync_fifo.v:82$36_EN = 1'b0;
    // UUT.$formal$./sync_fifo.v:83$37_CHECK = 1'b0;
    // UUT.$formal$./sync_fifo.v:84$38_CHECK = 1'b0;
    // UUT.$formal$./sync_fifo.v:88$39_CHECK = 1'b0;
    // UUT.$formal$./sync_fifo.v:88$39_EN = 1'b0;
    // UUT.$formal$./sync_fifo.v:89$40_CHECK = 1'b0;
    // UUT.$formal$./sync_fifo.v:90$41_CHECK = 1'b0;
    // UUT.$past$./sync_fifo.v:65$3$0 = 2'b00;
    // UUT.$past$./sync_fifo.v:83$8$0 = 2'b00;
    // UUT.$past$./sync_fifo.v:89$13$0 = 2'b00;
    // UUT.$past$./sync_fifo.v:90$15$0 = 8'b00000000;
    UUT.o_FIFO_EMPTY = 1'b1;
    UUT.o_FIFO_FULL = 1'b1;
    UUT.o_OUTPUT = 8'b00000000;
    UUT.r_PAST_VALID = 1'b0;
    UUT.r_QUANTITY = 2'b00;
    UUT.r_READ_POINTER = 2'b00;
    UUT.r_WRITE_POINTER = 2'b00;
    UUT.r_MEMORY[2'b00] = 8'b00000001;
    UUT.r_MEMORY[2'b01] = 8'b00000000;
    UUT.r_MEMORY[2'b10] = 8'b00000001;
    UUT.r_MEMORY[2'b11] = 8'b00000001;

    // state 0
    PI_i_CLK = 1'b0;
    PI_i_READ_REQUEST = 1'b0;
    PI_i_WRITE_REQUEST = 1'b0;
    PI_i_INPUT = 8'b00000000;
  end
  always @(posedge clock) begin
    // state 1
    if (cycle == 0) begin
      PI_i_CLK <= 1'b1;
      PI_i_READ_REQUEST <= 1'b0;
      PI_i_WRITE_REQUEST <= 1'b1;
      PI_i_INPUT <= 8'b00000000;
    end

    // state 2
    if (cycle == 1) begin
      PI_i_CLK <= 1'b0;
      PI_i_READ_REQUEST <= 1'b0;
      PI_i_WRITE_REQUEST <= 1'b1;
      PI_i_INPUT <= 8'b00000000;
    end

    // state 3
    if (cycle == 2) begin
      PI_i_CLK <= 1'b1;
      PI_i_READ_REQUEST <= 1'b1;
      PI_i_WRITE_REQUEST <= 1'b1;
      PI_i_INPUT <= 8'b00000001;
    end

    // state 4
    if (cycle == 3) begin
      PI_i_CLK <= 1'b0;
      PI_i_READ_REQUEST <= 1'b1;
      PI_i_WRITE_REQUEST <= 1'b1;
      PI_i_INPUT <= 8'b00000001;
    end

    // state 5
    if (cycle == 4) begin
      PI_i_CLK <= 1'b1;
      PI_i_READ_REQUEST <= 1'b0;
      PI_i_WRITE_REQUEST <= 1'b0;
      PI_i_INPUT <= 8'b00000000;
    end

    // state 6
    if (cycle == 5) begin
      PI_i_CLK <= 1'b0;
      PI_i_READ_REQUEST <= 1'b0;
      PI_i_WRITE_REQUEST <= 1'b0;
      PI_i_INPUT <= 8'b00000000;
    end

    genclock <= cycle < 6;
    cycle <= cycle + 1;
  end
endmodule
