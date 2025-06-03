`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/01/2025 01:39:20 PM
// Design Name: 
// Module Name: gray_en
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

module crypto(a,opcode,outcu);
input [15:0] a;
input [2:0] opcode;
output reg [31:0] outcu;

integer i;

always@(a,opcode,outcu)
begin
	case(opcode)
    3'b000: outcu = (a>>1) ^ a;
    3'b001: begin
        for (i=0; i<16; i=i+1) begin
        outcu[i] = ^(a>>i);  
    end
    end
	default outcu = 32'h00000000;
	endcase
end   
endmodule

