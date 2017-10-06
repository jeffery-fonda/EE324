`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/14/2017 11:15:54 PM
// Design Name: 
// Module Name: counter
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


module counter(
    input clock,
    input reset,
    input click,
    input [3:0] dig0,
    input [3:0] dig1,
    output reg [3:0] counter,
    output reg [3:0] counter1,
    output reg [3:0] counter2,
    output reg [3:0] counter3
    );
    
	always @ (posedge clock or posedge reset)
    begin
        if (reset)
        begin
            counter <= 0;
            counter1 <= 0;
            counter2 <= 0;
            counter3 <= 0;
        end
   
        else if (click) //increment at every click
        begin                //carry over logic for 4bit counter
            if(counter == 9)
            begin 
                counter <= 0;
              
                if (counter1 == 9)
                begin 
                    counter1 <= 0;
                    if (counter2 == 9)
                    begin 
                        counter2 <= 0;
                        if(counter3 == 9)
                            counter3 <= 0;
                        else
                            counter3 <= counter3 + 1;
                    end
                    else 
                        counter2 <= counter2 + 1;
                end
     
                else 
                    counter1 <= counter1 + 1;
            end
    
            else 
                counter <= counter + 1;
        end
    end
endmodule
