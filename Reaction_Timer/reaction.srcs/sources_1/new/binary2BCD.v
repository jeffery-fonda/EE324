`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/16/2017 11:11:13 PM
// Design Name: 
// Module Name: binary2BCD
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


module binary2BCD(
    input [13:0] binary,
    output reg [3:0] thousands = 0,
    output reg [3:0] hundreds = 0,
    output reg [3:0] tens = 0,
    output reg [3:0] ones = 0
    );
    
integer i;

always @ (binary)
begin
    for (i=0; i < 14; i = i +1)
    begin  
        if (thousands >= 5)
            thousands = thousands + 3;
        if (hundreds >= 5)
            hundreds = hundreds + 3; 
        if (tens >= 5)
            tens = tens + 3;
        if (ones >= 5)
            ones = ones + 3;
            
        thousands = thousands << 1;
        thousands[0] = hundreds[3];
        hundreds = hundreds << 1;
        hundreds[0] = tens[3];
        tens = tens << 1;
        tens[0] = ones[3];
        ones = ones << 1;
        ones[0] = binary[i];
    end
end
endmodule
