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
  reg [0:0] PI_i_M_RREADY;
  reg [0:0] PI_i_M_BREADY;
  reg [0:0] PI_i_M_ARVALID;
  reg [1:0] PI_i_M_ARADDR;
  reg [0:0] PI_i_M_AWPROT;
  reg [0:0] PI_i_M_WSTRB;
  reg [1:0] PI_i_M_AWADDR;
  reg [0:0] PI_i_M_AWVALID;
  reg [0:0] PI_i_M_ARPROT;
  reg [0:0] PI_i_ARESETN;
  reg [0:0] PI_i_ACLK;
  reg [0:0] PI_i_M_WVALID;
  reg [7:0] PI_i_M_WDATA;
  basic_axi4_lite_slave UUT (
    .i_M_RREADY(PI_i_M_RREADY),
    .i_M_BREADY(PI_i_M_BREADY),
    .i_M_ARVALID(PI_i_M_ARVALID),
    .i_M_ARADDR(PI_i_M_ARADDR),
    .i_M_AWPROT(PI_i_M_AWPROT),
    .i_M_WSTRB(PI_i_M_WSTRB),
    .i_M_AWADDR(PI_i_M_AWADDR),
    .i_M_AWVALID(PI_i_M_AWVALID),
    .i_M_ARPROT(PI_i_M_ARPROT),
    .i_ARESETN(PI_i_ARESETN),
    .i_ACLK(PI_i_ACLK),
    .i_M_WVALID(PI_i_M_WVALID),
    .i_M_WDATA(PI_i_M_WDATA)
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
    // UUT.$and$basic_axi4_lite_slave.v:99$125_Y = 1'b1;
    // UUT.$eq$basic_axi4_lite_slave.v:117$144_Y = 1'b0;
    // UUT.$eq$basic_axi4_lite_slave.v:119$146_Y = 1'b0;
    // UUT.$eq$basic_axi4_lite_slave.v:120$147_Y = 1'b0;
    // UUT.$eq$basic_axi4_lite_slave.v:124$152_Y = 1'b0;
    // UUT.$eq$basic_axi4_lite_slave.v:128$157_Y = 1'b0;
    // UUT.$eq$basic_axi4_lite_slave.v:132$162_Y = 1'b0;
    // UUT.$eq$basic_axi4_lite_slave.v:132$163_Y = 1'b0;
    // UUT.$formal$basic_axi4_lite_slave.v:103$19_CHECK = 1'b0;
    // UUT.$formal$basic_axi4_lite_slave.v:103$19_EN = 1'b0;
    // UUT.$formal$basic_axi4_lite_slave.v:104$20_CHECK = 1'b0;
    // UUT.$formal$basic_axi4_lite_slave.v:108$21_CHECK = 1'b0;
    // UUT.$formal$basic_axi4_lite_slave.v:108$21_EN = 1'b0;
    // UUT.$formal$basic_axi4_lite_slave.v:109$22_CHECK = 1'b0;
    // UUT.$formal$basic_axi4_lite_slave.v:111$23_CHECK = 1'b0;
    // UUT.$formal$basic_axi4_lite_slave.v:111$23_EN = 1'b0;
    // UUT.$formal$basic_axi4_lite_slave.v:113$24_CHECK = 1'b0;
    // UUT.$formal$basic_axi4_lite_slave.v:113$24_EN = 1'b0;
    // UUT.$formal$basic_axi4_lite_slave.v:115$25_CHECK = 1'b0;
    // UUT.$formal$basic_axi4_lite_slave.v:115$25_EN = 1'b0;
    // UUT.$formal$basic_axi4_lite_slave.v:117$26_CHECK = 1'b0;
    // UUT.$formal$basic_axi4_lite_slave.v:117$26_EN = 1'b0;
    // UUT.$formal$basic_axi4_lite_slave.v:119$27_CHECK = 1'b0;
    // UUT.$formal$basic_axi4_lite_slave.v:119$27_EN = 1'b0;
    // UUT.$formal$basic_axi4_lite_slave.v:121$28_CHECK = 1'b0;
    // UUT.$formal$basic_axi4_lite_slave.v:121$28_EN = 1'b0;
    // UUT.$formal$basic_axi4_lite_slave.v:123$29_CHECK = 1'b0;
    // UUT.$formal$basic_axi4_lite_slave.v:123$29_EN = 1'b0;
    // UUT.$formal$basic_axi4_lite_slave.v:125$30_CHECK = 1'b0;
    // UUT.$formal$basic_axi4_lite_slave.v:125$30_EN = 1'b0;
    // UUT.$formal$basic_axi4_lite_slave.v:127$31_CHECK = 1'b0;
    // UUT.$formal$basic_axi4_lite_slave.v:127$31_EN = 1'b0;
    // UUT.$formal$basic_axi4_lite_slave.v:129$32_CHECK = 1'b0;
    // UUT.$formal$basic_axi4_lite_slave.v:129$32_EN = 1'b0;
    // UUT.$formal$basic_axi4_lite_slave.v:131$33_CHECK = 1'b0;
    // UUT.$formal$basic_axi4_lite_slave.v:131$33_EN = 1'b0;
    // UUT.$formal$basic_axi4_lite_slave.v:133$34_CHECK = 1'b0;
    // UUT.$formal$basic_axi4_lite_slave.v:133$34_EN = 1'b0;
    // UUT.$formal$basic_axi4_lite_slave.v:135$35_CHECK = 1'b0;
    // UUT.$formal$basic_axi4_lite_slave.v:135$35_EN = 1'b0;
    // UUT.$past$basic_axi4_lite_slave.v:101$3$0 = 1'b0;
    // UUT.$past$basic_axi4_lite_slave.v:110$4$0 = 1'b0;
    // UUT.$past$basic_axi4_lite_slave.v:115$6$0 = 1'b0;
    UUT.o_S_ARREADY = 1'b0;
    UUT.o_S_AWREADY = 1'b0;
    UUT.o_S_BVALID = 1'b0;
    UUT.o_S_RDATA = 8'b00001001;
    UUT.o_S_RVALID = 1'b0;
    UUT.o_S_WREADY = 1'b0;
    UUT.r_PAST_VALID = 1'b0;
    UUT.r_MEMORY[2'b10] = 8'b00000000;
    UUT.r_MEMORY[2'b00] = 8'b00001001;

    // state 0
    PI_i_M_RREADY = 1'b0;
    PI_i_M_BREADY = 1'b0;
    PI_i_M_ARVALID = 1'b0;
    PI_i_M_ARADDR = 2'b10;
    PI_i_M_AWPROT = 1'b0;
    PI_i_M_WSTRB = 1'b0;
    PI_i_M_AWADDR = 2'b10;
    PI_i_M_AWVALID = 1'b0;
    PI_i_M_ARPROT = 1'b0;
    PI_i_ARESETN = 1'b1;
    PI_i_ACLK = 1'b0;
    PI_i_M_WVALID = 1'b0;
    PI_i_M_WDATA = 8'b00000000;
  end
  always @(posedge clock) begin
    // state 1
    if (cycle == 0) begin
      PI_i_M_RREADY <= 1'b0;
      PI_i_M_BREADY <= 1'b0;
      PI_i_M_ARVALID <= 1'b0;
      PI_i_M_ARADDR <= 2'b00;
      PI_i_M_AWPROT <= 1'b0;
      PI_i_M_WSTRB <= 1'b0;
      PI_i_M_AWADDR <= 2'b00;
      PI_i_M_AWVALID <= 1'b0;
      PI_i_M_ARPROT <= 1'b0;
      PI_i_ARESETN <= 1'b0;
      PI_i_ACLK <= 1'b1;
      PI_i_M_WVALID <= 1'b0;
      PI_i_M_WDATA <= 8'b00000000;
    end

    // state 2
    if (cycle == 1) begin
      PI_i_M_RREADY <= 1'b0;
      PI_i_M_BREADY <= 1'b0;
      PI_i_M_ARVALID <= 1'b0;
      PI_i_M_ARADDR <= 2'b00;
      PI_i_M_AWPROT <= 1'b0;
      PI_i_M_WSTRB <= 1'b0;
      PI_i_M_AWADDR <= 2'b00;
      PI_i_M_AWVALID <= 1'b0;
      PI_i_M_ARPROT <= 1'b0;
      PI_i_ARESETN <= 1'b0;
      PI_i_ACLK <= 1'b0;
      PI_i_M_WVALID <= 1'b0;
      PI_i_M_WDATA <= 8'b00000000;
    end

    genclock <= cycle < 2;
    cycle <= cycle + 1;
  end
endmodule
