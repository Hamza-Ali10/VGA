`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Hamza Ali
// 
// Create Date: 05/04/2024 10:49:54 PM
// Design Name: 
// Module Name: up_counter_TB
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



module up_counter_TB();                
        
        localparam n = 10;
       
        reg clk;
        reg reset ;
        wire [n-1:0] Q;
        
       up_counter # (.n(n))uut (
        .clk(clk),
        .reset(reset),
        .Q(Q)
        );
        
        
        localparam T = 2;
        
        always
        begin
        clk = 1'b0;
        #(T / 2);
        clk = 1'b1;
        #(T / 2);
        end
        
        initial 
        begin
            reset = 1'b0;
        #5  reset = 1'b1;
        
        end
    
    initial #2000 $stop;


endmodule

