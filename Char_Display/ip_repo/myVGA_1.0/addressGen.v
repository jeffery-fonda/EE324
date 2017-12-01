`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/17/2017 06:21:22 AM
// Design Name: 
// Module Name: addressGen
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


module addressGen(
    input  [6:0]  ascii,
    input  [11:0] loc_x,
    input  [11:0] loc_y,
    input  [11:0] hcnt,
    input  [11:0] vcnt,
    output [10:0] addr 
    );
// assume 800 * 600 
// assume vcnt !< loc_y

wire [3:0] next_line; //= 4'hF;
wire [11:0] result;
/*
always @ (result)
begin
    if ( result < 4'hF ) // difference is bigger than 16
        next_line <= ~result;
    else 
        next_line <= 4'h0;
end
*/
assign result = vcnt - loc_y ;
assign next_line = ( result >= 4'h0 && result <= 4'hF) ? ~result : 4'h0;
assign addr = {ascii, next_line}; 

endmodule
