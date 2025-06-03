`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/30/2025 08:59:15 PM
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


module ALU( a, b, opcode, mode, outALU, eq);
input [15:0] a;
input [15:0] b;
input [2:0] opcode;
input [1:0] mode;
output [31:0] outALU;
output  eq;

reg [31:0] outALU;
reg eq;

wire [31:0] outau;
wire [31:0] outlu;
wire [31:0] outcu;
//wire [15:0] outdenu;
wire teq;

// Instantiation of the modules

arith a1 (.a(a), .b(b), .opcode(opcode), .outau(outau));
logic l1 (.a(a), .b(b), .opcode(opcode), .outlu(outlu), .eq(teq));
crypto d1 (.a(a),.opcode(opcode), .outcu(outcu));
//gray_den f1 (.gray(a),.opcode(opcode), .bin(outdenu));
// At every change of a, b, mode and opcode, we need to select the output.

always@(a,b,mode,opcode,outau,outlu,outcu)
begin
	if(mode == 2'b00) begin
	outALU = outlu;
	end
	else if (mode == 2'b01) begin
	outALU = outau;
	end
	else if (mode == 2'b10) begin
	outALU = outcu;
	end
	else begin
	outALU = 32'h00000000;
	end

	eq = teq;

end

endmodule