`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.01.2021 21:58:31
// Design Name: 
// Module Name: Stl
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


module Stl(
    input [31:0] A,
    input [31:0] B,
    output [31:0] result
    );
    wire cin,zero;
    wire [31:0]add_result;
    assign cin = 1;
    Adder(.input1(A),.input2(B),.cin(cin),.result(add_result));
    assign zero = &add_result;
    assign result = zero?32'h0000_0000:32'h0000_0001;
endmodule
