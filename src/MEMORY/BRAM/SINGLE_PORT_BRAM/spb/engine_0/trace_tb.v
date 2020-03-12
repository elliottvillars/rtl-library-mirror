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
  reg [0:0] PI_i_WRITE_ENABLE;
  reg [0:0] PI_i_CLK;
  reg [3:0] PI_i_WRITE_ADDRESS;
  reg [0:0] PI_i_READ_ENABLE;
  reg [7:0] PI_i_WRITE_DATA;
  reg [3:0] PI_i_READ_ADDRESS;
  single_port_bram UUT (
    .i_WRITE_ENABLE(PI_i_WRITE_ENABLE),
    .i_CLK(PI_i_CLK),
    .i_WRITE_ADDRESS(PI_i_WRITE_ADDRESS),
    .i_READ_ENABLE(PI_i_READ_ENABLE),
    .i_WRITE_DATA(PI_i_WRITE_DATA),
    .i_READ_ADDRESS(PI_i_READ_ADDRESS)
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
    // UUT.$and$single_port_bram.v:34$53_Y = 1'b1;
    // UUT.$eq$single_port_bram.v:36$58_Y = 1'b0;
    // UUT.$eq$single_port_bram.v:40$63_Y = 1'b0;
    // UUT.$formal$single_port_bram.v:37$13_CHECK = 1'b0;
    // UUT.$formal$single_port_bram.v:37$13_EN = 1'b0;
    // UUT.$formal$single_port_bram.v:39$14_CHECK = 1'b0;
    // UUT.$formal$single_port_bram.v:39$14_EN = 1'b0;
    // UUT.$formal$single_port_bram.v:41$15_CHECK = 1'b0;
    // UUT.$formal$single_port_bram.v:41$15_EN = 1'b0;
    // UUT.$formal$single_port_bram.v:43$16_CHECK = 1'b0;
    // UUT.$formal$single_port_bram.v:43$16_EN = 1'b0;
    // UUT.$past$single_port_bram.v:37$4$0 = 4'b0000;
    // UUT.$past$single_port_bram.v:37$5$0 = 8'b00000000;
    // UUT.$past$single_port_bram.v:39$6$0 = 8'b00000000;
    // UUT.$past$single_port_bram.v:41$8$0 = 4'b0000;
    UUT.o_READ_DATA = 8'b00000000;
    UUT.r_PAST_VALID = 1'b0;
    UUT.r_RAM[4'b0011] = 8'b11111110;
    UUT.r_RAM[4'b1000] = 8'b00101110;
    UUT.r_RAM[4'b0000] = 8'b00101010;

    // state 0
    PI_i_WRITE_ENABLE = 1'b0;
    PI_i_CLK = 1'b0;
    PI_i_WRITE_ADDRESS = 4'b1000;
    PI_i_READ_ENABLE = 1'b1;
    PI_i_WRITE_DATA = 8'b00101010;
    PI_i_READ_ADDRESS = 4'b0011;
  end
  always @(posedge clock) begin
    // state 1
    if (cycle == 0) begin
      PI_i_WRITE_ENABLE <= 1'b0;
      PI_i_CLK <= 1'b1;
      PI_i_WRITE_ADDRESS <= 4'b0000;
      PI_i_READ_ENABLE <= 1'b0;
      PI_i_WRITE_DATA <= 8'b00000000;
      PI_i_READ_ADDRESS <= 4'b1000;
    end

    // state 2
    if (cycle == 1) begin
      PI_i_WRITE_ENABLE <= 1'b0;
      PI_i_CLK <= 1'b0;
      PI_i_WRITE_ADDRESS <= 4'b1000;
      PI_i_READ_ENABLE <= 1'b0;
      PI_i_WRITE_DATA <= 8'b00000000;
      PI_i_READ_ADDRESS <= 4'b0000;
    end

    genclock <= cycle < 2;
    cycle <= cycle + 1;
  end
endmodule
