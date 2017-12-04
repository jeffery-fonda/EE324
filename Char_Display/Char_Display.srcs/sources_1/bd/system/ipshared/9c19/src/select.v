`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/30/2017 03:09:52 PM
// Design Name: 
// Module Name: select
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


module select(
    input sel,
    input [15:0] Fg,
    input [15:0] Bg,
    output reg [15:0] X = 0
    );
    
always @ *
    begin
        X <= (sel) ? Fg: Bg;     
    end
    
endmodule
