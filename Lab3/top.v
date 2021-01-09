`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.01.2021 17:34:53
// Design Name: 
// Module Name: top
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


module top(input [3:0] a, input [3:0] b,output [6:0]segments, output overflow);
wire [4:0]s;
FourBitAdder(a,b,s);
Decoder(s[3:0],segments);
buf(overflow,s[4]);
endmodule
