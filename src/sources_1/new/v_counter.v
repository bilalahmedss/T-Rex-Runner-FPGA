`timescale 1ns / 1ps

module v_counter(clock,V_signal,Vcount);
  input clock,V_signal;
  output [9:0] Vcount;
  reg [9:0] Vcount;
  initial Vcount=0;
  
          always @ (posedge clock)
            begin 
              if (Vcount <524)
                begin
                  if (V_signal ==1)
                    begin
                      Vcount <= Vcount + 1;                
                    end
                  else
                    begin
                      Vcount<= Vcount;
                    end
                end  
              else
              	begin
                  Vcount <=0;
                end
            end   
                    
endmodule
