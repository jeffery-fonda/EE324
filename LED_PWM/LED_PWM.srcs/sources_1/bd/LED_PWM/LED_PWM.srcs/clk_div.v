`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/27/2017 07:31:42 PM
// Design Name: 
// Module Name: clk_div
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
    input clk,
    input rst,
    output reg clk_div
    );
    
    localparam constantNumber = 12;
    
    reg [4:0] count;
    
    //this blocks deals with the counter
    //counts up to 12 and then resets itself
    always @ (posedge(clk), posedge(rst))
    begin
        if (rst == 1'b1)
            count <= 4'b0;
        else if (count == constantNumber - 1)
            count <= 4'b0;
        else
            count <= count + 1;
    end
    
    //this controls the output of the clock divider output
    //when in reset state, output is 0
    //when counter reaches 12 posedge's, it flips output from 0 to 1
    //after another 12 will flip the 1 back to 0
    always @ (posedge(clk), posedge(rst))
    begin
        if (rst == 1'b1)
            clk_div <= 1'b0;
        else if (count == constantNumber - 1)
            clk_div <= ~clk_div;
        else
            clk_div <= clk_div;
    end
    
endmodule
