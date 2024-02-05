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


module VGA(
    
    input clk,    // 25MHz
    input reset,  //active low async
    
    output reg hsync,vsync,video_on,
    output reg [2:0] RGB,
    output reg[9:0] pixel_x, pixel_y
    );
    
  // reg video_on;  high within display area
   

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
             
         else if(pixel_x == 799)
               begin
                    if(pixel_y == 524)
                       pixel_y <= 'b0; 
                    else 
                       pixel_y <= pixel_y + 1;
               end
         else   
              pixel_y <= pixel_y;  
      end
      
      //condation for some signal hsync , vsync , video_on
  always@(*)begin
  
     if(pixel_x >= 655 && pixel_x <= 751)
        hsync <= 'b0;
      else  
        hsync <= 'b1;
       
     if (pixel_y > 512 && pixel_y < 515)
        vsync <= 'b0;
      else  
        vsync <= 'b1;    
            
      if(pixel_x <= 639 && pixel_y <= 479)begin
        video_on <= 'b1;    
        RGB <= 3'b111;
        end
      else
      begin
        video_on <= 'b0;
         RGB <= 3'b000;
      end
  end

endmodule
