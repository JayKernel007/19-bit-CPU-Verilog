`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/30/2025 08:38:26 PM
// Design Name: 
// Module Name: logic
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


module logic(a,b,opcode,outlu,eq);
input [15:0] a;
input [15:0] b;
input [2:0] opcode;
output [31:0] outlu;
output eq;

reg [31:0] outlu;
reg eq;

always@(a,b,opcode)
begin
	case(opcode)
	3'b000: outlu = {16'h0000, (a & b)};
	3'b001: outlu = {16'h0000, (a | b)};
	3'b010: outlu = {16'h0000, (a ^ b)};
	3'b011: outlu = {16'h0000, (~ a)};	
	default outlu = 32'h00000000;
	endcase
end

always@(a,b)
begin
	if( a == b) begin
	eq = 1;
	end
	else begin
	eq = 0;
	end

end
endmodule

