`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/30/2017 03:36:24 PM
// Design Name: 
// Module Name: color_select
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


module color_select(
    input wire sel,
    input wire [4:0] r,
    input wire [5:0] g,
    input wire [4:0] b,
    output reg [4:0] vga_r = 0,
    output reg [5:0] vga_g = 0,
    output reg [4:0] vga_b = 0
    );
    
always @ ( sel, r, b, g ) // rgb just for warning 
    begin
        case ( sel )
            1'b0: 
                begin
                    {vga_r, vga_g, vga_b} <= 16'b0;
                    //vga_r <= 5'b11111;
                    //vga_b <= 6'b111111;
                    //vga_g <= 5'b11111;
                end
            default:
                begin
                    {vga_r, vga_g, vga_b} <= {r, g, b};
                    //vga_r <= r;
                    //vga_b <= b;
                    //vga_g <= g;
                end
         endcase
    end 
    
endmodule
