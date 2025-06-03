`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/02/2025 11:44:15 AM
// Design Name: 
// Module Name: regB
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


module regB (clk, loadB, dataBin, dataBout);
input clk;
input loadB;
input [15:0] dataBin;
output [15:0] dataBout;

reg [15:0] dataBout;
reg [15:0] tempB;

always@(clk,loadB)
begin
	@(posedge clk) 
	begin
		if ( loadB == 1) begin
		dataBout <= dataBin;
		tempB <= dataBin;
		end

		else if (loadB == 0) begin
		dataBout <= tempB;
		end
	end
end
endmodule
