`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/02/2025 11:45:09 AM
// Design Name: 
// Module Name: PC
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


module PC(clk, loadPC, incPC, address, execadd);
input clk;
input loadPC;
input incPC;
input [13:0] address;
output [13:0] execadd;

reg [13:0] execadd;

reg [13:0] temp;

always@( posedge clk)
begin
	if ( loadPC == 0 && incPC == 0 ) begin
	temp <= 14'b00000000000000;
	end
	else if (loadPC == 1 && incPC == 0 ) begin
	temp <= address;
	end
	else if (loadPC == 0 && incPC == 1 ) begin
	temp <= temp + 14'b00000000000001;
	end
	else begin
	temp <= temp;
	end
	execadd <= temp;
end
endmodule
