//Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
//Date        : Sat Mar  2 22:07:55 2019
//Host        : DESKTOP-3VDLSPS running 64-bit major release  (build 9200)
//Command     : generate_target BCD_COUNTER_BD.bd
//Design      : BCD_COUNTER_BD
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "BCD_COUNTER_BD,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=BCD_COUNTER_BD,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=1,numReposBlks=1,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=1,numPkgbdBlks=0,bdsource=USER,synth_mode=Global}" *) (* HW_HANDOFF = "BCD_COUNTER_BD.hwdef" *) 
module BCD_COUNTER_BD
   (i_CLK,
    i_CLK_EN,
    i_RST,
    o_NEXT_CLK_EN,
    o_OUT);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.I_CLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.I_CLK, ASSOCIATED_RESET i_RST, CLK_DOMAIN BCD_COUNTER_BD_i_CLK, FREQ_HZ 100000000, INSERT_VIP 0, PHASE 0.000" *) input i_CLK;
  input i_CLK_EN;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.I_RST RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.I_RST, INSERT_VIP 0, POLARITY ACTIVE_LOW" *) input i_RST;
  output o_NEXT_CLK_EN;
  output [3:0]o_OUT;

  wire BCD_Counter_0_o_NEXT_CLK_EN;
  wire [3:0]BCD_Counter_0_o_OUT;
  wire i_CLK_0_1;
  wire i_CLK_EN_0_1;
  wire i_RST_0_1;

  assign i_CLK_0_1 = i_CLK;
  assign i_CLK_EN_0_1 = i_CLK_EN;
  assign i_RST_0_1 = i_RST;
  assign o_NEXT_CLK_EN = BCD_Counter_0_o_NEXT_CLK_EN;
  assign o_OUT[3:0] = BCD_Counter_0_o_OUT;
  BCD_COUNTER_BD_BCD_Counter_0_0 BCD_Counter_0
       (.i_CLK(i_CLK_0_1),
        .i_CLK_EN(i_CLK_EN_0_1),
        .i_RST(i_RST_0_1),
        .o_NEXT_CLK_EN(BCD_Counter_0_o_NEXT_CLK_EN),
        .o_OUT(BCD_Counter_0_o_OUT));
endmodule
