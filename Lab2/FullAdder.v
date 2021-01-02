`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.01.2021 17:35:33
// Design Name: 
// Module Name: FullAdder
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


module FullAdder(input a, input b, input ci, output s, output co);

// carry output
wire ab_out, aci_out, bci_out;
and (ab_out, a, b);
and (aci_out, a, ci);
and (bci_out, b, ci);
or (co, ab_out, aci_out, bci_out);

// sum output
wire abxor_out;
xor (abxor_out, a, b);
xor (s,abxor_out,ci);
    
endmodule

module FourBitAdder(input [3:0] a, input [3:0] b, output [4:0] s);

// add 0-bit
wire co0,gnd;
assign gnd = 0; 
FullAdder(a[0], b[0], gnd, s[0], co0);

// add 1-bit
wire co1; 
FullAdder(a[1], b[1], co0,s[1],co1);

// add 2-bit
wire co2;
FullAdder(a[2], b[2], co1,s[2],co2);

// add 3-bit
FullAdder(a[3], b[3], co2,s[3],s[4]);

endmodule
