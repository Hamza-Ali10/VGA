`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Hamza Ali
// 
// Create Date: 09/11/2023 08:46:34 PM
// Design Name: 
// Module Name: VGA_TB
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


module VGA_TB( );
    
    
    reg clk,reset;
   
    reg  [2:0] sw;
  
    wire [2:0] RGB;
  
    wire hsync,vsync,video_on;
  
    wire [9:0] pixel_x, pixel_y;
    
    VGA uut(
    .clk(clk),
    .reset(reset),
    .sw(sw),
    .RGB(RGB),
    .hsync(hsync),
    .vsync(vsync),
    .pixel_y(pixel_y),
    .pixel_x(pixel_x),
    .video_on(video_on)
    );

    
    localparam T = 4;
 
    always
    begin
        clk ='b0;
        #(T / 2 ); 
        clk ='b1;
        #(T / 2 );
    end
    
      initial
       begin
       reset = 'b0;
       #4;
       reset = 'b1;

       // You can modify switch values over time to observe RGB output changes
       sw = 3'b000; // Set switch to 000
       #10;        // Wait for a period
       
       sw = 3'b001; // Set switch to 001
       #10;        // Wait for a period
       
       sw = 3'b010; // Set switch to 010
       #10;        // Wait for a period

       sw = 3'b011; // Set switch to 011
       #10;        // Wait for a period

       sw = 3'b100; // Set switch to 100
       #10;        // Wait for a period

       sw = 3'b101; // Set switch to 101
       #10;        // Wait for a period

       sw = 3'b110; // Set switch to 110
       #10;        // Wait for a period
       
       sw = 3'b111; // Set switch to 111
       #10;        // Wait for a period
    
       // #100 sw=$random;
       end
      
      
     initial
        begin
     $monitor("time =%0t ,clk =%b , reset = %b , sw = %b ",$time , clk , reset, sw);  
     end
       
       
       initial #100 $stop;
 
endmodule
