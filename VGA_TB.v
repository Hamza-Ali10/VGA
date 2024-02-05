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


module VGA_TB(

    );
    
    
    reg clk,reset;
    wire [2:0] RGB;
    wire hsync,vsync,video_on;
    wire [9:0] pixel_x, pixel_y;
    
    VGA uut(
    .clk(clk),
    .reset(reset),
    .RGB(RGB),
    .hsync(hsync),
    .vsync(vsync),
    .pixel_y(pixel_y),
    .pixel_x(pixel_x),
    .video_on(video_on)
    );

    initial#500 $stop;
    
    localparam T = 8;
 
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
       
       end

     initial begin  
     $monitor("time =%0t ,clk =%b , reset = %b  ",$time , clk , reset);  
     end
    
endmodule
