`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Hamza Ali
// 
// Create Date: 09/11/2023 01:32:42 PM
// Design Name: 
// Module Name: v_sync
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module pixel_y #(parameter final_value = 524)(
    input clk,
    input reset,
    input enable,
    output done
    );
    
     localparam n = $clog2(final_value); 
     reg [n-1 : 0] Q_reg , Q_next ;
    
    always@(posedge clk , posedge reset )
    begin
            if(~reset)
              Q_reg <= 'b0;
            else if(enable)
              Q_reg <= Q_next;
            else
              Q_reg <= Q_next;

    end
    
    always@(*)
    begin
        if(Q_next == done)
        Q_next = 'b0; 
        else
        Q_next = Q_reg + 1 ;
    
    end
    
    
   assign done = Q_reg == final_value ;
   
endmodule