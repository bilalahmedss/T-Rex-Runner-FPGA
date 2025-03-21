`timescale 1ns / 1ps
module h_counter(clock,hcount,trig_V);
  input clock;
  output [9:0] hcount;
  reg [9:0] hcount;
  output trig_V;
  reg trig_V;
  initial hcount=0;
  initial trig_V=0;
          always @ (posedge clock)
            begin 
              if (hcount <799)
              	begin
                  hcount <= hcount + 1;                
                end  
                  
              else
              	begin
                  hcount <=0;
                end
            end   
         always @ (posedge clock)
            begin 
              if (hcount ==799)
              	begin
                  trig_V <= trig_V +1;     
                end  
                  
              else
              	begin
                  trig_V <=0;
                end
            end   
               
endmodule