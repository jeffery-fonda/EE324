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
    
reg [18:0] tick; 

always @ (posedge clock or posedge reset)
    begin
        if(reset)
            tick <= 0;
         else if(tick == 100000)
            tick <= 0;
        else if(startTimer) //start on input high
            tick <= tick + 1;
    end
    
    assign click = ((tick == 100000) ? 1'b1 : 1'b0); //clicks every millisecond

endmodule

