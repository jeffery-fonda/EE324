`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/24/2017 12:07:18 AM
// Design Name: 
// Module Name: Counter
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


module Counter(
    input clk,
    input rst,
    input wire en, 
    input wire [11:0] const,
    output reg [11:0] Q = 0,
    output reg TC = 0
    );
// initialized output register at beginning
always@ ( posedge(clk), posedge (rst) )
begin
    if (rst) 
        begin
            TC <= 1'b0;
            Q  <= 12'b0;
        end
    else if ( en ) // Hcnt/Vcnt
        begin
            if ( Q == const )
                begin
                    TC <= 1'b1;
                    Q  <= 12'b0; 
                end
            else 
                begin
                    TC <= 1'b0;
                    Q <= Q + 1'b1;
                end 
         end
    else           // Vcnt
        begin
            TC <= 1'b0;
            Q <= Q;    
        end
end

endmodule
