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
     
    reg [17:0]count; //don't need the stuff above, it's 17 because 2^17 = 131000, need 100000
     
    always @ (posedge clock or posedge reset)
        begin
            if (reset) //if reset has been pressed, count = 0
                count <= 0;
            else //if reset hasn't been pushed, increment count
                count <= count + 1;
        end
     
    reg [3:0]sseg; //stores data for anodes
    reg [3:0]an_temp; //chooses which anode to give data to
    reg reg_dp; //for the decimal point
    
    always @ (*) //no idea what the star is
        begin
            case(count[17 : 16])
                2'b00 : //for the first state
                    begin
                        sseg = digit0; //start at 0
                        an_temp = 4'b1110; //pulls right most anode high
                        reg_dp = 1'b1; //pulled low, decimal off
                    end
                2'b01: //second state 
                    begin
                        sseg = digit1; //starts at digit 1
                        an_temp = 4'b1101; //pulls high
                        reg_dp = 1'b1; //pulls low, decimal off
                    end
                2'b10: //third state
                    begin
                        sseg = digit2; //same above
                        an_temp = 4'b1011;
                        reg_dp = 1'b1;
                    end
                2'b11: //fourth state
                    begin
                        sseg = digit3;
                        an_temp = 4'b0111;
                        reg_dp = 1'b0;
                    end
                endcase
            end
        assign an = an_temp; //takes value from an_temp and sets it to an
     
    reg [6:0] sseg_temp;  //go through all the possible numbers
    
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