`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:17:46 10/23/2014 
// Design Name: 
// Module Name:    sevseg 
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
module sevseg(
    input clock,
    input reset,
    input [3:0] digit3,
    input [3:0] digit2,
    input [3:0] digit1,
    input [3:0] digit0,
    output a,
    output b,
    output c,
    output d,
    output e,
    output f,
    output g,
    output dp,
    output [3:0] an
    );

localparam N = 18;
 
reg [17:0]count; //the 18 bit counter which allows us to multiplex at 1000Hz
 
always @ (posedge clock or posedge reset)
 begin
  if (reset)
   count <= 0;
  else
   count <= count + 1;
 end
 
reg [3:0]sSeg; //holds digit data
reg [3:0]anTemp; //chooses anode
reg regDp;			//enables decimal point
always @ (*)
 begin
  case(count[17:16]) 
    
   2'b00 :
    begin	//thousandths
     sSeg = digit0;
     anTemp = 4'b1110;
     regDp = 1'b1;
    end
    
   2'b01:
    begin	//hundredths
     sSeg = digit1;
     anTemp = 4'b1101;
     regDp = 1'b1;
    end
    
   2'b10:
    begin	//tenths
     sSeg = digit2;
     anTemp = 4'b1011;
     regDp = 1'b1;
    end
     
   2'b11:	//seconds & decimal
    begin
     sSeg = digit3;
     anTemp = 4'b0111;
     regDp = 1'b0;
    end
  endcase
 end
assign an = anTemp;
 
reg [6:0] sSegTmp;
//decode into decimal numbers

always @ (*)
 begin
  case(sSeg)
   4'd0 : sSegTmp = 7'b1000000; //display 0
   4'd1 : sSegTmp = 7'b1111001; //display 1
   4'd2 : sSegTmp = 7'b0100100; //display 2
   4'd3 : sSegTmp = 7'b0110000; //display 3
   4'd4 : sSegTmp = 7'b0011001; //display 4
   4'd5 : sSegTmp = 7'b0010010; //display 5
   4'd6 : sSegTmp = 7'b0000010; //display 6
   4'd7 : sSegTmp = 7'b1111000; //display 7
   4'd8 : sSegTmp = 7'b0000000; //display 8
   4'd9 : sSegTmp = 7'b0010000; //display 9
   default : sSegTmp = 7'b0111111; //dash
  endcase
 end
assign {g, f, e, d, c, b, a} = sSegTmp;
assign dp = regDp;
 
endmodule