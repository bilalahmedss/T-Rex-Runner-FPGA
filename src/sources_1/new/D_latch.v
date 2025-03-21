`timescale 1ns / 1ps
module D_latch(D, clk, Q, Qnot, reset);
    input D;
    input clk;
    input reset;
    output reg Q;
    output reg Qnot;
 
 always @(posedge clk)  
    begin
    if(reset==1)
    begin
    Q <= 0;
    Qnot <= 1; 
    end
    else
    begin
    Q<=D;
    Qnot<=~D;
    end
    end
endmodule   
