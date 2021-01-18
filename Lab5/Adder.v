`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.01.2021 19:12:55
// Design Name: 
// Module Name: Adder
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


module Adder(
    input [31:0] input1,
    input [31:0] input2,
    input cin,
    output [31:0] result
    );
    parameter N=32;
    wire  carry_out;
    wire [N-1:0] carry;
    genvar i;
    generate 
    for(i=0;i<N;i=i+1)
        begin: generate_N_bit_Adder
            if(i==0) 
            full_adder f(.a(input1[0]),.b(input2[0]),.cin(cin),.s(result[0]),.cout(carry[0]));
            else
            full_adder f(.a(input1[i]),.b(input2[i]),.cin(carry[i-1]),.s(result[i]),.cout(carry[i]));
            end
        assign carry_out = carry[N-1];
   endgenerate
endmodule
