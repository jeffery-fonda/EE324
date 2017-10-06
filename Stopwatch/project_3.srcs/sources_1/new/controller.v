`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/14/2017 11:54:09 PM
// Design Name: 
// Module Name: controller
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


module controller(
    input clock,
    input reset,
    input startTemp,
    input incTemp,
    input stopTemp,
    output reg startTimer,
     input wire [3:0] count0,
       input wire [3:0] count1,
       input wire [3:0] count2,
       input wire [3:0] count3,
    output reg [3:0] d3,
    output reg [3:0] d2,
    output reg [3:0] d1,
    output reg [3:0] d0
      );
    
    reg [1:0] current, next;
          reg [28:0] currentCount, nextCount;
        reg [1:0] sel, selNext;
    
	//reg [3:0] count0, count1, count2, count3; //registers for individual counts
//    reg [1:0] sel, selNext;
    //states
    localparam [1:0] idle = 2'b00;            
    localparam [1:0] incrementing = 2'b01;    
   localparam [1:0] timeStart = 2'b10;        
   localparam [1:0] done = 2'b11;    
       
//    reg [1:0] current, next;
    //reg [28:0] currentCount, nextCount;
 
    always @ (posedge clock or posedge reset)
    begin
        if(reset)    //on reset enter idle state and reset count
        begin
            current <= idle;
            currentCount <= 0;
            sel <=0;
        end        
        else    //update to next state and next count
        begin
            current <= next;
            currentCount <= nextCount;
            sel <= selNext;
        end
    end
    
	always @ (*)
    begin
        next = current; 
        nextCount = currentCount;
        selNext = sel;
    case(current)
        idle:
        begin
        selNext = 2'b00;        //start in default state
            if(startTemp)    //if start button pressed
            begin
                next = timeStart; //start timer
            end
            if(incTemp)    //if start button pressed
            begin
                next = incrementing; //increment by 1
            end
        end

        incrementing:            //increment stopwatch by 1 ms
        begin
            if(incTemp)
            begin
                selNext = 2'b11; 
                next = done;
            end
        end
        
        timeStart:
        begin
            selNext = 2'b01; //start the timer
            next = done;    
        end
     
        done:        //stop button has been clicked
        begin
            if(stopTemp)
            begin
                selNext = 2'b10; 
            end
            else if (startTemp)
            begin
                selNext = 2'b01;
            end
        end
    
    endcase
//////////////////////////////////////////////////////////////////////////////////   
    
    //determine digit data
    case(selNext) 
        2'b00:
        begin
            startTimer = 0; //initialize
            d0 = 4'd0;    
            d1 = 4'd0;
            d2 = 4'd0;
            d3 = 4'd0;
        end
   
        2'b01: //timer
        begin
    
            startTimer = 1'b1; //start timer with start signal
            d0 = count0;
            d1 = count1;
            d2 = count2;
            d3 = count3;
        end
   
        2'b10: //stop timer
        begin
            startTimer = 1'b0;
            d0 = count0;
            d1 = count1;
            d2 = count2;
            d3 = count3;
        end
   
        2'b11:     //state for increment
        begin
            startTimer = 1'b0;
            d0 = count0;
            d1 = count1;
            d2 = count2;
            d3 = count3;
        end
   
        default:
        begin
            d0 = 4'd12;
            d1 = 4'd12;
            d2 = 4'd12;
            d3 = 4'd12;
            startTimer = 1'b0;
        end
    endcase  
    end
 

endmodule
