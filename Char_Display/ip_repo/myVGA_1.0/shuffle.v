`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/15/2017 08:12:36 PM
// Design Name: 
// Module Name: shuffle
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


module shuffle(
    input pxl_aclk,
    input rst,
    input [15:0] DO,
    input [11:0] loc_x,
    input [11:0] loc_y,
    input [11:0] hcnt,
    input [11:0] vcnt,
    input canvas,
    output reg gnd = 1'b0
    );

reg [3:0]twel;
reg [3:0] bit = 4'hF;
wire heq, veq;
wire [11:0] endx = loc_x+5'd16;
wire [11:0] endy = loc_y+5'd16;
assign heq = ( hcnt >= loc_x && hcnt < endx) ? 1'b1 : 1'b0 ;
assign veq = ( vcnt >= loc_y && vcnt < endy) ? 1'b1 : 1'b0 ;
// all could be wires going with alternative solution]
// ? need reset
always @ ( /*vcnt, hcnt)*/posedge (pxl_aclk), posedge(rst) )
    begin
        /*
        if ( vcnt == 0 )
            bit <= 4'hF;
        else if ( canvas && heq && veq )//|| offset == 4'hF)
            begin
                gnd <= DO[bit];
                bit <= bit - 1'b1; // I may not be counting uptil 16
            end                          // binary count down
        else
        begin
            gnd <= gnd;
            bit <= bit;
        end 
         */
         twel <= bit;
        if ( rst )
            begin
                gnd <= 1'b0;
                bit <= 4'hF;
            end
        else if ( vcnt == 0 )
            bit <= 4'hF;
        else if ( canvas && heq && veq )//|| offset == 4'hF)
            begin
                gnd <= DO[bit];
                bit <= bit - 1'b1; // I may not be counting uptil 16
            end                          // binary count down
        else
        begin
            gnd <= 1'b0;
            bit <= bit; // maybe bit <= 3'hF;
        end 
    end 
endmodule
