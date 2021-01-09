`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.01.2021 21:16:58
// Design Name: 
// Module Name: Decoder
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


module Decoder(input [3:0] s, output reg [6:0]segments);
always@(*)
begin
    case(s)
        //0
        4'b0000: segments = 7'b000_0001;
        //1
        4'b0001: segments = 7'b100_1111;
        //2
        4'b0010: segments = 7'b001_0010;
        //3
        4'b0011: segments = 7'b000_0110;
        //4
        4'b0100: segments = 7'b100_1100;
        //5
        4'b0101: segments = 7'b010_0100;
        //6
        4'b0110: segments = 7'b010_0000;
        //7
        4'b0111: segments = 7'b000_1111;
        //8
        4'b1000: segments = 7'b000_0000;
        //9
        4'b1001: segments = 7'b000_0100;
        //A
        4'b1010: segments = 7'b000_1000;
        //B
        4'b1011: segments = 7'b110_0000;
        //C
        4'b1100: segments = 7'b011_0001;
        //D
        4'b1101: segments = 7'b100_0010;
        //E
        4'b1110: segments = 7'b011_0000;
        //F
        4'b1111: segments = 7'b011_1000;
    endcase         
end
endmodule
