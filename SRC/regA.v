`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/02/2025 11:43:24 AM
// Design Name: 
// Module Name: regA
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


module regA (clk, loadA, dataAin, dataAout);
input clk;
input loadA;
input [15:0] dataAin;
output [15:0] dataAout;

reg [15:0] dataAout;
reg [15:0] tempA;

always@(clk,loadA)
begin
	@(posedge clk) 
	begin
		if ( loadA == 1) begin
		dataAout <= dataAin;
		tempA <= dataAin;
		end

		else if (loadA == 0) begin
		dataAout <= tempA;
		end
	end
end
endmodule
