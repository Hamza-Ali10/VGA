`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Hamza Ali
// 
// Create Date: 05/04/2024 10:48:27 PM
// Design Name: 
// Module Name: up_counter
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

//counter up 2^10 = 1024
module up_counter #(parameter n = 10)(
        input clk,
        input reset,              //active low async
        output [n -1 :0] Q        //output
    );
    
    reg [n-1 : 0] Q_reg , Q_next ;
    //current_state      next_state
    always@ (posedge clk , negedge reset)
    begin
            if(!reset )
             Q_reg <= 1'b0;
            
            else
            Q_reg <= Q_next ;
    end
    
    
    always@(Q_reg)    //always@(*)
    begin

    Q_next = Q_reg + 1 ; 

    end
    
    assign Q = Q_reg;
     
endmodule
