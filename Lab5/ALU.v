`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.01.2021 18:21:24
// Design Name: 
// Module Name: ALU
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


module ALU(
    input [31:0] A,
    input [31:0] B,
    input [3:0] Aluop,
    output [31:0] Result,
    output Zero
    );
    reg [31:0]alu_out;
    wire slt;
    always@(*)
    begin
        case(Aluop)
            4'b0000://ADD
                Adder(.input1(A),.input2(B),.cin(Aluop[1]),.result(alu_out));
            4'b0010://SUB
                Adder(.input1(A),.input2(B),.cin(Aluop[1]),.result(alu_out));
            4'b0100://AND
                alu_out = A&B;
            4'b0101://OR
                alu_out = A|B;
            4'b0110://XOR
                alu_out = A^B;
            4'b0111://NOR
                alu_out = ~(A|B);
            4'b1010://SLT
                Slt(.A(A),.B(B),.result(alu_out));
            default:
                alu_out = 32'hxxxx_xxxx;
        endcase
    end
    assign Result = alu_out;
endmodule
