`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/02/2025 11:57:54 AM
// Design Name: 
// Module Name: regC
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


module regC (clk, loadC, dataCin, dataCout);
input clk;
input loadC;
input [31:0] dataCin;
output [31:0] dataCout;

reg [31:0] dataCout;
reg [31:0] tempC;

always@(clk,loadC)
begin
	@(posedge clk) 
	begin
		if ( loadC == 1) begin
		dataCout <= dataCin;
		tempC <= dataCin;
		end

		else if (loadC == 0) begin
		dataCout <= tempC;
		end
	end
end
endmodule
