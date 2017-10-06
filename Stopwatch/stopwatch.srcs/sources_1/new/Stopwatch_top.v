`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/09/2017 02:13:54 AM
// Design Name: 
// Module Name: stopwatch
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

module Stopwatch_top(
        input clock, 
        input reset,
        input start,
        input stop,
        input inc,
        output [3:0] an,
        output a, b, c, d, e, f, g, dp
   );
  
    wire [3:0] d3, d2, d1, d0;	//output registers for selected digits
	wire startTemp, stopTemp, incTemp;
	reg startTemp2, startTemp3, stopTemp2, stopTemp3, incTemp2, incTemp3;
  
  	wire startTimer;
  	wire click;
  	wire [3:0] count0, count1, count2, count3; //registers for individual counts

	//debounce start for two clocks
	always @ (posedge clock) startTemp2 <= start;
	always @ (posedge clock) startTemp3 <= startTemp2;
	assign startTemp = ~startTemp2 & startTemp3; 
	//debounce stop for two clocks
	always @ (posedge clock) stopTemp2 <= stop;
	always @ (posedge clock) stopTemp3 <= stopTemp2;
	assign stopTemp = ~stopTemp2 & stopTemp3; 
	//debounce inc for two clocks
	always @ (posedge clock) incTemp2 <= inc;
	always @ (posedge clock) incTemp3 <= incTemp2;
	assign incTemp = ~incTemp2 & incTemp3;

 
sev_seg_display SSD (
    .clock(clock),
    .reset(reset),
    .digit3(d3),
    .digit2(d2),
    .digit1(d1),
    .digit0(d0),
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
    
clk_div ClockDivider (
    .clock(clock),
    .reset(reset),
    .startTimer(startTimer),
    .click(click)
    );
   
counter Counter (
    .clock(clock),
    .reset(reset),
    .click(click),
    .incTemp(incTemp),
    .d0(d0),
    .d1(d1),
    .count0(count0),
    .count1(count1),
    .count2(count2),
    .count3(count3)
    );
    
controller Controller (
    .clock(clock),
    .reset(reset),
    .startTemp(startTemp),
    .incTemp(incTemp),
    .stopTemp(stopTemp),
    .startTimer(startTimer),
    .count0(count0),
    .count1(count1),
    .count2(count2),
    .count3(count3),
    .d0(d0),
    .d1(d1),
    .d2(d2),
    .d3(d3)    
    );
    
endmodule
