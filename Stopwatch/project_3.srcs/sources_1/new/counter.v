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
    input incTemp,
    input d0,
    input d1,
    output reg [3:0] count0,
    output reg [3:0] count1,
    output reg [3:0] count2,
    output reg [3:0] count3
    );
    
always @ (posedge clock or posedge reset)
        begin
            if (reset)
            begin
                count0 <= 0;
                count1 <= 0;
                count2 <= 0;
                count3 <= 0;
            end
            
            else if (incTemp) //increment at every click
            begin
                if(count0 == 9)
                begin //carry over to count1
                    count0 <= 0;
                  
                    if (count1 == 9)
                    begin //carry over to count2
                        count1 <= 0;
                        if (count2 == 9)
                        begin //carry over to count3
                            count2 <= 0;
                            
                            if(count3 == 9 && count2 == 9 && d1 == 9 && d0 == 9)
                            begin
                                count3 <= 0;
                            end
                            else    //count3++
                                count3 <= count3 + 1;
                        end
                        else //count2++
                            count2 <= count2 + 1;
                    end
         
                    else //count1++
                        count1 <= count1 + 1;
                end
        
                else //count00++
                    count0 <= count0 + 1;
            end
       
            else if (click) //increment at every click
            begin
                if(count0 == 9)
                begin //carry over to count1
                    count0 <= 0;
                  
                    if (count1 == 9)
                    begin //carry over to count2
                        count1 <= 0;
                        if (count2 == 9)
                        begin //carry over to count3
                            count2 <= 0;
                            
                            if(count3 == 9 && count2 == 9 && d1 == 9 && d0 == 9)
                            begin
                                count3 <= 0;
                            end
                            else    //count3++
                                count3 <= count3 + 1;
                        end
                        else //count2++
                            count2 <= count2 + 1;
                    end
         
                    else //count1++
                        count1 <= count1 + 1;
                end
        
                else //count0++
                    count0 <= count0 + 1;
            end
        end
    
endmodule
