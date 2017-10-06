`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:16:01 10/23/2014 
// Design Name: 
// Module Name:    controller 
// Project Name: 
// Target Devices: 
// Tool versions: 
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
   input start,
   input stop,
   output led,
   output [3:0] an,
   output a, b, c, d, e, f, g, dp
    );


	reg [3:0] dig3, dig2, dig1, dig0;	//output registers for selected digits
 
	wire tempStart, tempStop;
	reg startBounce1, startBounce2, stopBounce1, stopBounce2;
  
	//debouncing start and stop buttons
	always @ (posedge clock) startBounce1 <= start;
	always @ (posedge clock) startBounce2 <= startBounce1;
	assign tempStart = ~startBounce1 & startBounce2; //detect only one push of the button
	always @ (posedge clock) stopBounce1 <= stop;
	always @ (posedge clock) stopBounce2 <= stopBounce1;
	assign tempStop = ~stopBounce1 & stopBounce2; //detects only one push of the button
 
 
sevseg C1 (
    .clock(clock),
    .reset(reset),
    .digit3(dig3),
    .digit2(dig2),
    .digit1(dig1),
    .digit0(dig0),
    .a(a),
    .b(b),
    .c(c),
    .d(d),
    .e(e),
    .f(f),
    .g(g),
    .dp(dp),
    .an(an)
    );
 
	//generate "random" number
	reg [28:0] random, randomNext, randomDone; //29 bit register to keep track up to 10 seconds.
 
	reg [4:0] shiftCount, shiftCount2; //tracks shifts. 5 bit register to count to 30
 
	wire feedback = random[28] ^ random[26];	//xor the two positions
 
	always @ (posedge clock or posedge reset)
	begin
		if (reset)
		begin
			random <= 29'hF; //re-initialize
			shiftCount <= 0;
		end
		else
		begin
			random <= randomNext;	//otherwise get next random number
			shiftCount <= shiftCount2;
		end
	end
 
	always @ (*)
	begin
		randomNext = random; //default state
		shiftCount2 = shiftCount;
   
		randomNext = {random[27:0], feedback}; //shiftleft
            
		if (shiftCount == 29)	//after 30 shifts, assign random number used to begin timer
		begin
			shiftCount2 = 0;
			randomDone = random; 
		end
		else
		begin
			shiftCount2 = shiftCount + 1;
			randomDone = random; //keep previous value of random
		end
  
	end
 
 
	reg [3:0] counter, counter1, counter2, counter3; //registers for individual counts
	reg [1:0] sel, selNext;
	
	//states
	localparam [1:0] idle = 2'b00;
   localparam [1:0] starting = 2'b01;
   localparam [1:0] started = 2'b10;
   localparam [1:0] done = 2'b11;
       
	reg [1:0] stateReg, stateNext;
	reg [28:0] countCurrent, countNext;
 
	always @ (posedge clock or posedge reset)
	begin
		if(reset)
		begin
			stateReg <= idle;	//next state should be idle
			countCurrent <= 0;	//reset values
			sel <=0;
		end
		else
		begin
			stateReg <= stateNext;	//go to next state
			countCurrent <= countNext;
			sel <= selNext;
		end
	end
 
	reg startTimer;
	
	always @ (*)
	begin
		stateNext = stateReg; //stay in the same state if no change
		countNext = countCurrent;
		selNext = sel;
	case(stateReg)
		idle:
		begin
		selNext = 2'b00;		//start in default state
			if(tempStart)	//if start button pressed
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
				countNext = countCurrent + 1;	//random number incremented until above value met
			end
		end 
		started:
		begin
			selNext = 2'b01; //start the reaction timer
			stateNext = done;    
		end
     
		done:		//stop timer, stop button has been clicked
		begin
			if(tempStop)
			begin
				selNext = 2'b10; //stop the timer
			end
		end
    
	endcase
   
	case(selNext) //send to seven seg display based on selection signal
		2'b00:	//default state
		begin
			startTimer = 0; //timer does not start in beginning state
			dig0 = 4'd0;	//start with all zeros
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
			startTimer = 1'b0;
			dig0 = counter;
			dig1 = counter1;
			dig2 = counter2;
			dig3 = counter3;
		end
   
		2'b11: 	//should not reach this state
		begin
			dig0 = 4'd12; //display '-'s
			dig1 = 4'd12;
			dig2 = 4'd12;
			dig3 = 4'd12;
			startTimer = 1'b0;	//start timer is off
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
 
 
	//the stopwatch block
	reg [18:0] tick; 
	wire click;
 
 
	always @ (posedge clock or posedge reset)
	begin
		if(reset)
			tick <= 0;
 		else if(tick == 100000)
			tick <= 0;
		else if(startTimer) //start on input high
			tick <= tick + 1;
	end
 
	assign click = ((tick == 100000) ? 1'b1 : 1'b0); //clicks every millisecond
 
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
		begin				//carry over logic for 4bit counter
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
 
	
	assign led = ((countCurrent == 500000000) ? ((tempStop == 1) ? 1'b0 : 1'b1) : 1'b0);
 
endmodule