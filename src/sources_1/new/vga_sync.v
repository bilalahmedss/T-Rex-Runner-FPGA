`timescale 1ns / 1ps
module VGA_sync (h_count,v_count,h_sync,v_sync,video_on,x_log,y_log);
  input [9:0] h_count,v_count;
  output video_on;
  output h_sync,v_sync;
  output [9:0] x_log;
  output [9:0] y_log; 
  //horizontal
  localparam HD = 640; //Horizontal Display area
  localparam HF = 16; //Horizontal Front porch
  localparam HB = 48; //Horizontal Back porch
  localparam HR = 96; //Horizontal Retrace
  //vertical
  localparam VD = 480; //Vertical Display area
  localparam VF = 10; //Vertical Front porch
  localparam VB = 33; //Vertical Back porch
  localparam VR = 2; //Vertical Retrace
  
//This line generates the vertical sync signal.The signal is low (active) during the vertical retrace period.
  assign h_sync = (h_count < (HD + HF)) || (h_count>= (HD+HF+HR)); 
  
//This line generates the vertical sync signal. The signal is low (active) during the vertical retrace period.
  assign v_sync = (v_count < (VD + VF)) || (v_count>= (VD+VF+VR));
  
 //This signal is high when the counters are within the visible display area, defined by the horizontal display (HD) and vertical display (VD) dimensions.     
  assign video_on = (h_count < HD) && (v_count < VD);
  
 //These assign the current horizontal and vertical counter values to the logical x and y coordinates, respectively.
  assign x_log = h_count;
  assign y_log = v_count;
endmodule