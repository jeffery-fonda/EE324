`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/15/2017 02:43:18 PM
// Design Name: 
// Module Name: Multiplex
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


module Multiplexor(
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
