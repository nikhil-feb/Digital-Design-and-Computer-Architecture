`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.01.2021 20:26:45
// Design Name: 
// Module Name: FineStateMachine
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


module FineStateMachine(
input clk,
input reset,
input left,
input right,
output reg [5:0] lights
    );
    //
    reg [3:0] state,nextstate;
    parameter off = 4'b0000;
    parameter L1 = 4'b0001;
    parameter L2 = 4'b0010;
    parameter L3 = 4'b0011;
    parameter repL = 4'b0100;
    parameter R1 = 4'b0101;
    parameter R2 = 4'b0110;
    parameter R3 = 4'b0111;
    parameter repR = 4'b1000;
    
    // state register
    always @ (posedge clk, posedge reset)
    begin
       if (reset) 
          state <= off;
       else 
          state <= nextstate;
    end
    
    // next state logic
    always @(*)
    begin
       case(state)
       off: 
         if(left == 1 && right ==0) 
           nextstate = L1;
         else if(left == 0 && right ==1) 
           nextstate = R1;
         else 
           nextstate = off;
       L1:
         if(right ==0) 
           nextstate = L2;
         else if(left == 0 && right ==1) 
           nextstate = R1;
         else 
           nextstate = off;
       L2:
         if(right ==0) 
           nextstate = L3;
         else if(left == 0 && right ==1) 
           nextstate = R1;
         else 
           nextstate = off;
       L3:
         if(right ==0) 
           nextstate = repL;
         else if(left == 0 && right ==1) 
           nextstate = R1;
         else 
           nextstate = off;
       repL:
         if(right ==0) 
           nextstate = L1;
         else if(left == 0 && right ==1) 
           nextstate = R1;
         else 
           nextstate = off;
       R1:
         if(left ==0) 
           nextstate = R2;
         else if(left == 1 && right ==0) 
           nextstate = L1;
         else 
           nextstate = off;
       R2:
         if(left ==0) 
           nextstate = R3;
         else if(left == 1 && right ==0) 
           nextstate = L1;
         else 
           nextstate = off;
       R3:
         if(left ==0) 
           nextstate = repR;
         else if(left == 1 && right ==0) 
           nextstate = L1;
         else 
           nextstate = off;
       repR:
         if(left ==0) 
           nextstate = R1;
         else if(left == 1 && right ==0) 
           nextstate = L1;
         else 
           nextstate = off;
       default: 
         nextstate = off;
       endcase
    end 
    
    //output logic
    always @(*)
    begin
       case(nextstate)
       off: 
         lights = 6'b00_0000;
       L1:
         lights = 6'b00_1000;
       L2:
         lights = 6'b01_1000;
       L3:
         lights = 6'b11_1000;
       repL:
         lights = 6'b00_0000;
       R1:
         lights = 6'b00_0100;
       R2:
         lights = 6'b00_0110;
       R3:
         lights = 6'b00_0111;
       repR:
         lights = 6'b00_0000;
       default: 
         lights = 6'b00_0000;
       endcase
    end
      
endmodule
