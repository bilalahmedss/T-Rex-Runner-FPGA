`timescale 1ns / 1ps
module clk_divider (clk,clk_d);
  input wire clk;
  output wire clk_d;
  reg [15:0]  counter;
  reg pixcel_step;
  always @(posedge clk)
    {pixcel_step, counter} <= counter + 16'h4000;
  assign clk_d = pixcel_step; 
endmodule
