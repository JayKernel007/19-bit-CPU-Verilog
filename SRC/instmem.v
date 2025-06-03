`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/02/2025 10:47:30 AM
// Design Name: 
// Module Name: instmem
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


module instmem(clk, we_IM, dataIM, addIM, outIM);
input clk;
input we_IM;
input [18:0] dataIM;
input [13:0] addIM;
output [18:0] outIM;

reg [18:0] outIM;

// Memory is an array stored at particular address

reg [18:0] mem [0 : 255];

always@(posedge clk)
begin
	if (we_IM == 1) begin
	mem[addIM] = dataIM;
	end
	
	else if (we_IM == 0) begin
	outIM = mem[addIM];
	end
end
endmodule
