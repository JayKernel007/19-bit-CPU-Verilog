`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/02/2025 11:42:14 AM
// Design Name: 
// Module Name: muxB
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


module muxB ( clk, in1, in2, sel, outB);
input clk;
input [13:0] in1;
input [13:0] in2;
input sel;
output [18:0] outB;

reg [18:0] outB;

always@(posedge clk)
begin
	if ( sel == 1 ) begin
	outB <= in1;
	end
	else if ( sel == 0) begin
	outB <= in2;
	end
end
endmodule
