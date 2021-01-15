`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.01.2021 21:44:11
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


module top(
input clk,
input reset,
input left,
input right,
output LC,
output LB,
output LA,
output RA,
output RB,
output RC
    );

wire ford_clk;
wire [5:0]lights;   
clk_div(.clk(clk),.rst(reset),.clk_en(ford_clk));
FineStateMachine(.clk(ford_clk),.reset(reset),.left(left),.right(right),.lights(lights));
buf(LC,lights[5]);
buf(LB,lights[4]);
buf(LA,lights[3]);
buf(RA,lights[2]);
buf(RB,lights[1]);
buf(RC,lights[0]);
endmodule
