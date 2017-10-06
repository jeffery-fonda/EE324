`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/15/2017 12:39:31 PM
// Design Name: 
// Module Name: _controller
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


module _controller(
    input clock,
    input reset,
    input tempStart,
    input tempStop,
    input tempAve,
    output reg startTimer,
    input wire [3:0] counter,
    input wire [3:0] counter1,
    input wire [3:0] counter2,
    input wire [3:0] counter3,
    input wire [28:0] randomDone,
    output reg [3:0] dig3,
    output reg [3:0] dig2,
    output reg [3:0] dig1,
    output reg [3:0] dig0,
    output led
    );
    
    integer i;
    reg [1:0] j;
    
    reg [13:0] binary, tempBin;
    reg [29:0] shifter;
    reg [3:0] ones, tens, hundreds, thousands;


    reg [3:0] temp,temp1,temp2,temp3;
    reg [3:0] binTemp,binTemp1,binTemp2,binTemp3;
	reg [1:0] sel, selNext;
        
    //states
    localparam [1:0] idle = 2'b00;
    localparam [1:0] starting = 2'b01;
    localparam [1:0] started = 2'b10;
    localparam [1:0] done = 2'b11;
    

    reg [1:0] stateReg, stateNext;
    reg [28:0] countCurrent, countNext;
    
always @ (binary)
        begin
        
        shifter[29:14] = 0;
        shifter[13:0]=binary;
        
            for (i=0; i < 14; i = i +1)
            begin  
                if (shifter[17:14] >= 5)
                    shifter[17:14] = shifter[17:14] + 3;
                if (shifter[21:18] >= 5)
                    shifter[21:18] = shifter[21:18] + 3; 
                if (shifter[25:22] >= 5)
                    shifter[25:22] = shifter[25:22] + 3;
                if (shifter[29:26] >= 5)
                    shifter[29:26] = shifter[29:26] + 3;
                    
                shifter = shifter << 1;
                end
                    
                thousands = shifter[29:26];
                hundreds = shifter[25:22];
                tens = shifter[21:18];
                ones = shifter[17:14];
            end

    always @ (posedge clock or posedge reset)
    begin
        if(reset)
        begin
            stateReg <= idle;    //next state should be idle
            countCurrent <= 0;    //reset values
            sel <=0;
        end
        else
        begin
            stateReg <= stateNext;    //go to next state
            countCurrent <= countNext;
            sel <= selNext;
        end
    end
 
  
    always @ (*)
    begin
        stateNext = stateReg; //stay in the same state if no change
        countNext = countCurrent;
        selNext = sel;
    
    case(stateReg)
        idle:
        begin
        selNext = 2'b00;        //start in default state
            if(tempStart)    //if start button pressed
            begin
                countNext = randomDone; //get the random number
                stateNext = starting; //go to next state
            end
        end
        starting:
        begin
            if(countNext == 500000000) //maximum of 10 second delay
            begin 
                stateNext = started; //start timer
            end
            else
            begin
                countNext = countCurrent + 1;    //random number incremented until above value met
            end
        end 
        started:
        begin
            selNext = 2'b01; //start the reaction timer
            stateNext = done;    
        end
     
        done:        //stop timer, stop button has been clicked
        begin
            if(tempStop)
            begin
                selNext = 2'b10; //stop the timer
            end
            if(tempAve)
            begin
                selNext = 2'b11;
            end
           
        end
    
    endcase
   
    case(selNext) //send to seven seg display based on selection signal
        2'b00:    //default state
        begin
            startTimer = 0; //timer does not start in beginning state
            dig0 = 4'd0;    //start with all zeros
            dig1 = 4'd0;
            dig2 = 4'd0;
            dig3 = 4'd0;
        end
   
        2'b01: //timer
        begin
            startTimer = 1'b1; //start timer with start signal
            dig0 = counter;
            dig1 = counter1;
            dig2 = counter2;
            dig3 = counter3;
        end
   
        2'b10: //stop timer, button pressed
        begin
        
            temp = counter; 
            temp1 = counter1;
            temp2 = counter2;
            temp3 = counter3 ;

            //tempBin[13:0]=temp3*1000+temp2*100+temp1*10+temp;
            binary[13:0]=temp3*1000+temp2*100+temp1*10+temp;
          
      //                  j=j+1;

            //binary = binary >> 3;
              
            
            startTimer = 1'b0;
            dig0 = counter;
            dig1 = counter1;
            dig2 = counter2;
            dig3 = counter3;
        end
   
        2'b11:     
        begin
            binary=tempBin;
           // tempBin = tempBin >> 3;

    //        binary=binary+tempBin;
      //      binary=binary>>3;
            temp = ones[3:0];
            temp1 = tens[3:0];
            temp2 = hundreds[3:0];
            temp3 = thousands[3:0];
       
            dig0 = temp;
            dig1 = temp1;
            dig2 = temp2;
            dig3 = temp3;
            
            startTimer = 1'b0;    //start timer is off
        end
   
        default:
        begin
      
            
            dig0 = 4'd12;
            dig1 = 4'd12;
            dig2 = 4'd12;
            dig3 = 4'd12;
            startTimer = 1'b0;
        end
    endcase  
    
    end
    
	assign led = ((countCurrent == 500000000) ? ((tempStop == 1) ? 1'b0 : 1'b1) : 1'b0);

endmodule
