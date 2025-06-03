`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/02/2025 11:56:30 AM
// Design Name: 
// Module Name: datamem
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


module datamem(clk, we_DM, dataDM, addDM, outDM);
input clk;
input we_DM;
input [31:0] dataDM;
input [13:0] addDM;
output [31:0] outDM;

reg [31:0] outDM;

// Memory is an array stored at particular address

reg [31:0] mem [0 : 1023];

always@(posedge clk)
begin
	if (we_DM == 1) begin
	mem[addDM] = dataDM;
	end
	
	else if (we_DM == 0) begin
	outDM = mem[addDM];
	end
end
endmodule