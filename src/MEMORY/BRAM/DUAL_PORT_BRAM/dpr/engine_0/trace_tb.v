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
  reg [7:0] PI_i_WRITE_DATA_B;
  reg [0:0] PI_i_READ_ENABLE_A;
  reg [0:0] PI_i_READ_ENABLE_B;
  reg [3:0] PI_i_READ_ADDRESS_A;
  reg [3:0] PI_i_WRITE_ADDRESS_B;
  reg [0:0] PI_i_WRITE_ENABLE_B;
  reg [7:0] PI_i_WRITE_DATA_A;
  reg [0:0] PI_i_WRITE_ENABLE_A;
  reg [3:0] PI_i_READ_ADDRESS_B;
  reg [3:0] PI_i_WRITE_ADDRESS_A;
  dual_port_bram UUT (
    .i_CLK(PI_i_CLK),
    .i_WRITE_DATA_B(PI_i_WRITE_DATA_B),
    .i_READ_ENABLE_A(PI_i_READ_ENABLE_A),
    .i_READ_ENABLE_B(PI_i_READ_ENABLE_B),
    .i_READ_ADDRESS_A(PI_i_READ_ADDRESS_A),
    .i_WRITE_ADDRESS_B(PI_i_WRITE_ADDRESS_B),
    .i_WRITE_ENABLE_B(PI_i_WRITE_ENABLE_B),
    .i_WRITE_DATA_A(PI_i_WRITE_DATA_A),
    .i_WRITE_ENABLE_A(PI_i_WRITE_ENABLE_A),
    .i_READ_ADDRESS_B(PI_i_READ_ADDRESS_B),
    .i_WRITE_ADDRESS_A(PI_i_WRITE_ADDRESS_A)
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
    // UUT.$and$dual_port_bram.v:55$84_Y = 1'b1;
    // UUT.$eq$dual_port_bram.v:57$89_Y = 1'b0;
    // UUT.$eq$dual_port_bram.v:61$93_Y = 1'b0;
    // UUT.$eq$dual_port_bram.v:65$97_Y = 1'b0;
    // UUT.$formal$dual_port_bram.v:58$21_CHECK = 1'b0;
    // UUT.$formal$dual_port_bram.v:58$21_EN = 1'b0;
    // UUT.$formal$dual_port_bram.v:60$22_CHECK = 1'b0;
    // UUT.$formal$dual_port_bram.v:60$22_EN = 1'b0;
    // UUT.$formal$dual_port_bram.v:62$23_CHECK = 1'b0;
    // UUT.$formal$dual_port_bram.v:62$23_EN = 1'b0;
    // UUT.$formal$dual_port_bram.v:64$24_CHECK = 1'b0;
    // UUT.$formal$dual_port_bram.v:64$24_EN = 1'b0;
    // UUT.$formal$dual_port_bram.v:66$25_CHECK = 1'b0;
    // UUT.$formal$dual_port_bram.v:66$25_EN = 1'b0;
    // UUT.$past$dual_port_bram.v:58$4$0 = 4'b0000;
    // UUT.$past$dual_port_bram.v:62$6$0 = 4'b0000;
    // UUT.$past$dual_port_bram.v:66$8$0 = 4'b0000;
    // UUT.$past$dual_port_bram.v:66$9$0 = 8'b00000000;
    UUT.o_READ_DATA_A = 8'b00000000;
    UUT.o_READ_DATA_B = 8'b00000000;
    UUT.r_PAST_VALID = 1'b0;
    UUT.r_RAM[4'b0111] = 8'b00010101;
    UUT.r_RAM[4'b1111] = 8'b10000111;
    UUT.r_RAM[4'b1101] = 8'b01010110;
    UUT.r_RAM[4'b0000] = 8'b01000110;
    UUT.r_RAM[4'b1000] = 8'b01000110;

    // state 0
    PI_i_CLK = 1'b0;
    PI_i_WRITE_DATA_B = 8'b00000000;
    PI_i_READ_ENABLE_A = 1'b0;
    PI_i_READ_ENABLE_B = 1'b1;
    PI_i_READ_ADDRESS_A = 4'b0111;
    PI_i_WRITE_ADDRESS_B = 4'b1101;
    PI_i_WRITE_ENABLE_B = 1'b0;
    PI_i_WRITE_DATA_A = 8'b01000110;
    PI_i_WRITE_ENABLE_A = 1'b1;
    PI_i_READ_ADDRESS_B = 4'b1111;
    PI_i_WRITE_ADDRESS_A = 4'b1101;
  end
  always @(posedge clock) begin
    // state 1
    if (cycle == 0) begin
      PI_i_CLK <= 1'b1;
      PI_i_WRITE_DATA_B <= 8'b00000000;
      PI_i_READ_ENABLE_A <= 1'b0;
      PI_i_READ_ENABLE_B <= 1'b0;
      PI_i_READ_ADDRESS_A <= 4'b1000;
      PI_i_WRITE_ADDRESS_B <= 4'b0000;
      PI_i_WRITE_ENABLE_B <= 1'b0;
      PI_i_WRITE_DATA_A <= 8'b00000000;
      PI_i_WRITE_ENABLE_A <= 1'b0;
      PI_i_READ_ADDRESS_B <= 4'b1000;
      PI_i_WRITE_ADDRESS_A <= 4'b0000;
    end

    // state 2
    if (cycle == 1) begin
      PI_i_CLK <= 1'b0;
      PI_i_WRITE_DATA_B <= 8'b00000000;
      PI_i_READ_ENABLE_A <= 1'b0;
      PI_i_READ_ENABLE_B <= 1'b0;
      PI_i_READ_ADDRESS_A <= 4'b1000;
      PI_i_WRITE_ADDRESS_B <= 4'b0000;
      PI_i_WRITE_ENABLE_B <= 1'b0;
      PI_i_WRITE_DATA_A <= 8'b00000000;
      PI_i_WRITE_ENABLE_A <= 1'b0;
      PI_i_READ_ADDRESS_B <= 4'b1000;
      PI_i_WRITE_ADDRESS_A <= 4'b0000;
    end

    genclock <= cycle < 2;
    cycle <= cycle + 1;
  end
endmodule
