`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/14/2017 11:03:23 PM
// Design Name: 
// Module Name: clkDvr
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


module clkDvr(
    input clock,
    input reset,
    input startTimer,
    input click
    );
    
reg [18:0] ticker; //000MHz
       // wire click;
     
        always @ (posedge clock or posedge reset)
        begin
            if(reset)
                ticker <= 0;
             else if(ticker == 100000)
                ticker <= 0;
            else if(startTimer)
                ticker <= ticker + 1;
        end
     
        assign click = ((ticker == 100000) ? 1'b1 : 1'b0); //clicks every millisecond
endmodule
