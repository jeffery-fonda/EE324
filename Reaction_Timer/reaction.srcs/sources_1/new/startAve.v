`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/15/2017 02:17:17 PM
// Design Name: 
// Module Name: startAve
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


module startAve(
    input tempStop,
    input wire [3:0] counter,
    input wire [3:0] counter1,
    input wire [3:0] counter2,
    input wire [3:0] counter3,
    output reg [3:0] dig3,
    output reg [3:0] dig2,
    output reg [3:0] dig1,
    output reg [3:0] dig0,
    output led1,
    input reset,
    input clock,
    input tempAve
    );
    
    reg [3:0] tempDig, tempDig1, tempDig2, tempDig3;
  /*  always @ (posedge clock or posedge reset)
        begin
            if(reset)    //on reset enter idle state and reset count
            begin
                count <= 2'b00;
            end        
        end*/
        
  
   // always @ (*)
   /* if(tempStop)
        begin
            tempDig <= counter;
            tempDig1 <= counter1;
            tempDig2 <= counter2;
            tempDig3 <= counter3;
        end*/ //begin  
    /*if(tempAve)
       
            dig0 <= 4'd1;
            dig1 <= 4'd1;
            dig2 <= 4'd1;
            dig3 <= 4'd1;
        end
    (*/
endmodule
