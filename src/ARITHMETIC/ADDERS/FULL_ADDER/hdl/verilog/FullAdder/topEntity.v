/* AUTOMATICALLY GENERATED VERILOG-2001 SOURCE CODE.
** GENERATED BY CLASH 1.2.4. DO NOT MODIFY.
*/
`timescale 100fs/100fs
module topEntity
    ( // Inputs
      input  c$arg
    , input  c$arg_0
    , input  c$arg_1

      // Outputs
    , output wire  result_0
    , output wire  result_1
    );
  wire  c$app_arg;
  wire  c$case_alt;
  wire  c$case_alt_0;
  wire  c$app_arg_0;
  wire  c$case_alt_1;
  wire  c$case_alt_2;
  wire  c$case_alt_3;
  wire [1:0] result;

  assign result = {c$app_arg_0,c$app_arg};

  assign c$app_arg = c$arg ? c$case_alt : c$case_alt_0;

  assign c$case_alt = c$arg_0 ? 1'b1 : c$arg_1;

  assign c$case_alt_0 = c$arg_0 ? c$arg_1 : 1'b0;

  assign c$app_arg_0 = c$arg ? c$case_alt_1 : c$case_alt_2;

  assign c$case_alt_1 = c$arg_0 ? c$arg_1 : c$case_alt_3;

  assign c$case_alt_2 = c$arg_0 ? c$case_alt_3 : c$arg_1;

  assign c$case_alt_3 = c$arg_1 ? 1'b0 : 1'b1;

  assign result_0 = result[1:1];

  assign result_1 = result[0:0];


endmodule

