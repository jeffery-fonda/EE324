`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/30/2017 03:07:36 PM
// Design Name: 
// Module Name: add_gen
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


module add_gen(
    input  [6:0]  ascii,
    input  [11:0] loc_x,
    input  [11:0] loc_y,
    input  [11:0] h_counter,
    input  [11:0] v_counter,
    output [10:0] address
    );
    
    wire [3:0] next_line; //= 4'hF;
    wire [11:0] result;
    
    assign result = v_counter - loc_y ;
    assign next_line = ( result >= 4'h0 && result <= 4'hF) ? ~result : 4'h0;
    assign address = {ascii, next_line};
    
endmodule
