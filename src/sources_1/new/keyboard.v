`timescale 1ns / 1ps

module keyboard(
    input wire clk, reset,
    input wire ps2d, ps2c,
    output wire fsm_input_user, fsm_reset,
    output reg key_release
);
// Declare variables
wire [7:0] dout;
wire rx_done_tick;
supply1 rx_en; // always HIGH
reg [7:0] key;
ps2_rx ps2(clk, reset, ps2d, ps2c, 
            rx_en, rx_done_tick, dout);
 
// Sequential logic
always @(posedge clk)
begin
    if (rx_done_tick)
    begin 
        key <= dout; // key is one rx cycle behind dout
        if (key == 8'hf0) // check if the key has been released
            key_release <= 1'b1;
        else
            key_release <= 1'b0;
    end
end
 
// Output control keys of interest
assign fsm_input_user = (key == 8'h29) & !key_release; 
assign fsm_reset = (key == 8'h5A) & !key_release; 
 
 
endmodule
