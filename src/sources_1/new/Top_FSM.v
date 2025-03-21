`timescale 1ns / 1ps
module Top_FSM(enter, gameover, reset, Ap, Bp, clk);
    input enter;    // enter
    input reset;    // reset
    input gameover; // gameover
    input clk;
    output Ap, Bp;
    wire clk_d;
    wire A, B, dA, dB;
    assign dA = (~A&&B&&~reset&&gameover) || (A&&~B&&~reset&&gameover);
    assign dB = (~B&&enter)||(A&&~enter&&~reset) || (~A&&B&&~reset&&gameover);
    D_latch d1(.D(dA),.clk(clk_d),.Q(A),.Qnot(~A),.reset(reset));
    D_latch d2(.D(dB),.clk(clk_d),.Q(B),.Qnot(~B),.reset(reset));
endmodule 