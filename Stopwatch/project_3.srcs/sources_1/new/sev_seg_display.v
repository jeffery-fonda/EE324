`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: WSU EECS EE324
// Engineer:
// 
// Create Date:    
// Design Name: 
// Module Name:    sevSegDisplay 
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
module sev_seg_display(
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
     
    reg [N-1:0]count;
     
    always @ (posedge clock or posedge reset)
     begin
      if (reset)
       count <= 0;
      else
       count <= count + 1;
     end
     
    reg [3:0]sseg;
    reg [3:0]an_temp;
    reg reg_dp;
    always @ (*)
     begin
      case(count[N-1:N-2])
        
       2'b00 : 
        begin
         sseg = digit0;
         an_temp = 4'b1110;
         reg_dp = 1'b1;
        end
        
       2'b01:
        begin
         sseg = digit1;
         an_temp = 4'b1101;
         reg_dp = 1'b1;
        end
        
       2'b10:
        begin
         sseg = digit2;
         an_temp = 4'b1011;
         reg_dp = 1'b1;
        end
         
       2'b11:
        begin
         sseg = digit3;
         an_temp = 4'b0111;
         reg_dp = 1'b0;
        end
      endcase
     end
    assign an = an_temp;
     
    reg [6:0] sseg_temp; 
    always @ (*)
     begin
      case(sseg)
       4'd0 : sseg_temp = 7'b1000000;
       4'd1 : sseg_temp = 7'b1111001;
       4'd2 : sseg_temp = 7'b0100100;
       4'd3 : sseg_temp = 7'b0110000;
       4'd4 : sseg_temp = 7'b0011001;
       4'd5 : sseg_temp = 7'b0010010;
       4'd6 : sseg_temp = 7'b0000010;
       4'd7 : sseg_temp = 7'b1111000;
       4'd8 : sseg_temp = 7'b0000000;
       4'd9 : sseg_temp = 7'b0010000;
       default : sseg_temp = 7'b0111111; //dash
      endcase
     end
    assign {g, f, e, d, c, b, a} = sseg_temp; 
    assign dp = reg_dp;
     
     
    endmodule