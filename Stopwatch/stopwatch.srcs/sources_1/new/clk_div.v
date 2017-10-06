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

module clk_div(
    input clock,
    input reset,
    input startTimer,
    input click
    );
    
    reg [18:0] ticker; //2^18 = enough for 100MHz
         
    always @ (posedge clock or posedge reset)
        begin
            if(reset) //reset ticker
                ticker <= 0;
            else if(ticker == 100000) //every 100000 clicks, reset to 0
                ticker <= 0;
            else if(startTimer) //if start has been pressed, start incrementing by 1 ns
                ticker <= ticker + 1;
         end
    assign click = ((ticker == 100000) ? 1'b1 : 1'b0); //clicks every nanosecond

endmodule
