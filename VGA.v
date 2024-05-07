`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Hamza Ali
// 
// Create Date: 09/05/2023 04:06:10 PM
// Design Name: 
// Module Name: VGA
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

// Project: Video Graphics Array
// Supervisor: DR.Tarek Haweel 
// Sutdent:Hamza Ali & Mostafa 

module VGA(
    input clk,                       // 25MHz
    input reset,                     //active low async
    input [2:0] sw,                  // switch input
    output reg hsync,vsync,video_on,
    output reg [2:0] RGB,              //output of color
    output reg[9:0] pixel_x, pixel_y   //counter
    );
    
  // video_on high within display area
  // hsync signal which high without retrace
  // vsync signal which high without retrace

    //counter in pixel_x line
     always@(posedge clk , negedge reset )begin   //async for reset 
        if(~reset)
            pixel_x <= 'b0;
        else if(pixel_x == 799)
            pixel_x <= 'b0;         
        else
            pixel_x <= pixel_x + 1;                  
     end
     
     //counter in pixel_y line
    always@(posedge clk , negedge reset )begin    //async for reset
         if(~reset)
             pixel_y <= 'b0;
         else begin 
             if(pixel_x == 799)
                     if(pixel_y == 524)
                      pixel_y <= 'b0;
                     else  
                     pixel_y <= pixel_y + 1; 
             else
              pixel_y <= pixel_y; 
         end 
      end
      
      //output signal hsync && vsync  && video_on
  always@(*)begin
  
     if(pixel_x >= 655 && pixel_x <= 751)
        hsync = 'b0;                       //retrace area
      else  
        hsync = 'b1;
       
     if (pixel_y >= 512 && pixel_y <= 514)
        vsync = 'b0;                        //retrace area
      else  
        vsync = 'b1;    
            
      if(pixel_x <= 639 && pixel_y <= 479)
        video_on = 'b1;                    //display area
      else
        video_on = 'b0;
 
	// RGB output based on switch value
        case (sw)
            3'b000: RGB = 3'b000; // Black
            3'b001: RGB = 3'b001; // Blue
            3'b010: RGB = 3'b010; // Green
            3'b011: RGB = 3'b011; // Cyan
            3'b100: RGB = 3'b100; // Red
            3'b101: RGB = 3'b101; // Magenta
            3'b110: RGB = 3'b110; // Yellow
            3'b111: RGB = 3'b111; // White
            default: RGB = 3'b000; // Default to Black
        endcase
      
      
     end
endmodule
