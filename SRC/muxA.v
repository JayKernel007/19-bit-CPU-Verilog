`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/02/2025 11:39:41 AM
// Design Name: 
// Module Name: muxA
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


module muxA ( clk, in1, in2, sel, outA);
input clk;
input [31:0] in1;
input [13:0] in2;
input sel;
output [31:0] outA;

reg [31:0] outA;

always@(posedge clk)
begin
	if ( sel == 1 ) begin
	outA <= in1;
	end
	else if ( sel == 0) begin
	outA <= {13'b0000000000000 , in2};
	end
end
endmodule
