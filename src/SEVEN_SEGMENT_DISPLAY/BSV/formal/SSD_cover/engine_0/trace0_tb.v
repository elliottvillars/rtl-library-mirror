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
  reg [0:0] PI_i_SW_ENABLE;
  reg [0:0] PI_i_RESET_N;
  reg [0:0] PI_i_DRIVE_ENABLE;
  ssd_driver_formal UUT (
    .i_CLK(PI_i_CLK),
    .i_SW_ENABLE(PI_i_SW_ENABLE),
    .i_RESET_N(PI_i_RESET_N),
    .i_DRIVE_ENABLE(PI_i_DRIVE_ENABLE)
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
    // UUT.$and$.\/ssd_driver_formal .\v:0$79_Y  = 1'b1;
    // UUT.$formal$.\/ssd_driver_formal .\v:232$14_CHECK  = 1'b0;
    // UUT.$formal$.\/ssd_driver_formal .\v:232$14_EN  = 1'b0;
    // UUT.$formal$.\/ssd_driver_formal .\v:233$15_CHECK  = 1'b0;
    // UUT.$formal$.\/ssd_driver_formal .\v:234$16_CHECK  = 1'b0;
    // UUT.$formal$.\/ssd_driver_formal .\v:235$17_CHECK  = 1'b0;
    // UUT.$formal$.\/ssd_driver_formal .\v:236$18_CHECK  = 1'b0;
    // UUT.$formal$.\/ssd_driver_formal .\v:240$19_CHECK  = 1'b0;
    // UUT.$formal$.\/ssd_driver_formal .\v:240$19_EN  = 1'b0;
    // UUT.$formal$.\/ssd_driver_formal .\v:243$20_CHECK  = 1'b0;
    // UUT.$formal$.\/ssd_driver_formal .\v:243$20_EN  = 1'b0;
    // UUT.$formal$.\/ssd_driver_formal .\v:244$21_CHECK  = 1'b0;
    // UUT.$formal$.\/ssd_driver_formal .\v:246$22_CHECK  = 1'b0;
    // UUT.$formal$.\/ssd_driver_formal .\v:246$22_EN  = 1'b0;
    // UUT.$formal$.\/ssd_driver_formal .\v:248$23_CHECK  = 1'b0;
    // UUT.$formal$.\/ssd_driver_formal .\v:248$23_EN  = 1'b0;
    // UUT.$past$.\/ssd_driver_formal .\v:231$3$0  = 1'b0;
    // UUT.$past$.\/ssd_driver_formal .\v:241$4$0  = 1'b0;
    // UUT.$past$.\/ssd_driver_formal .\v:242$5$0  = 1'b0;
    // UUT.$past$.\/ssd_driver_formal .\v:244$6$0  = 2'b00;
    // UUT.$past$.\/ssd_driver_formal .\v:245$7$0  = 4'b0000;
    // UUT.$past$.\/ssd_driver_formal .\v:247$9$0  = 4'b0000;
    // UUT.$past$.\/ssd_driver_formal .\v:249$11$0  = 4'b0000;
    UUT.anodes = 4'b1011;
    UUT.cathodes = 7'b0000000;
    UUT.current_digit = 4'b0000;
    UUT.d_switch = 2'b11;
    UUT.digits_0 = 4'b0000;
    UUT.digits_1 = 4'b0000;
    UUT.digits_2 = 4'b0000;
    UUT.digits_3 = 4'b0000;
    UUT.f_past_data = 1'b0;

    // state 0
    PI_i_CLK = 1'b0;
    PI_i_SW_ENABLE = 1'b0;
    PI_i_RESET_N = 1'b1;
    PI_i_DRIVE_ENABLE = 1'b0;
  end
  always @(posedge clock) begin
    // state 1
    if (cycle == 0) begin
      PI_i_CLK <= 1'b1;
      PI_i_SW_ENABLE <= 1'b0;
      PI_i_RESET_N <= 1'b0;
      PI_i_DRIVE_ENABLE <= 1'b0;
    end

    // state 2
    if (cycle == 1) begin
      PI_i_CLK <= 1'b0;
      PI_i_SW_ENABLE <= 1'b0;
      PI_i_RESET_N <= 1'b0;
      PI_i_DRIVE_ENABLE <= 1'b0;
    end

    genclock <= cycle < 2;
    cycle <= cycle + 1;
  end
endmodule
