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
module reaction(
    input clock, 
    input reset,
    input start,
    input stop,
    output led,
    output led1,
    output [3:0] an,
    output a, b, c, d, e, f, g, dp,
    input aveButton
    );

   // wire [3:0] ones, tens, hundreds, thousands;
  //  wire [15:0] binary;
	wire [3:0] dig3, dig2, dig1, dig0;	//output registers for selected digits
	wire tempStart, tempStop, tempAve;
	reg startBounce1, startBounce2, stopBounce1, stopBounce2,aveBounce1,aveBounce2;
    
    wire startTimer;
    wire click;
  	wire [3:0] counter, counter1, counter2, counter3; //registers for individual counts
  
	//debouncing start and stop buttons
	always @ (posedge clock) startBounce1 <= start;
	always @ (posedge clock) startBounce2 <= startBounce1;
	assign tempStart = ~startBounce1 & startBounce2; //detect only one push of the button
	always @ (posedge clock) stopBounce1 <= stop;
	always @ (posedge clock) stopBounce2 <= stopBounce1;
	assign tempStop = ~stopBounce1 & stopBounce2; //detects only one push of the button       
	always @ (posedge clock) aveBounce1 <= aveButton;
    always @ (posedge clock) aveBounce2 <= aveBounce1;
    assign tempAve = ~aveBounce1 & aveBounce2; //detects only one push of the button
 

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
    
clkDvr ClockDivider (
        .clock(clock),
        .reset(reset),
        .startTimer(startTimer),
        .click(click)
        );
        
counter Counter (
            .clock(clock),
            .reset(reset),
            .click(click),
            .dig0(dig0),
            .dig1(dig1),
            .counter(counter),
            .counter1(counter1),
            .counter2(counter2),
            .counter3(counter3)
            );
            
_controller Controller(
                .clock(clock),
                .reset(reset),
                .tempStart(tempStart),
                .tempStop(tempStop),
                .startTimer(startTimer),
             //   .binary(binary),
     //           .ones(ones),
       //         .hundreds(hundreds),
         //       .tens(tens),
           //     .thousands(thousands),
                .counter(counter),
                .counter1(counter1),
                .counter2(counter2),
                .counter3(counter3),
                .dig0(dig0),
                .dig1(dig1),
                .dig2(dig2),
                .dig3(dig3),
                .led(led),
                .randomDone(randomDone),
                .tempAve(tempAve)
                );
                
/*binary2BCD binary2BCD (
                .binary(binary),
                .thousands(thousands),
                .hundreds(hundreds),
                .tens(tens),
                .ones(ones)
                );*/

                
endmodule