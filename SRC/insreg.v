`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/02/2025 10:48:51 AM
// Design Name: 
// Module Name: insreg
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


module insReg ( clk, loadIR, insin, address, opcode);
input clk;
input loadIR;
input [18:0] insin;
output [13:0] address;
output [4:0] opcode;

reg [13:0] address;
reg [4:0] opcode;

reg [18:0] temp;

always@(posedge clk)
begin
	if(loadIR == 1) begin
	temp <= insin;
	end
address <= temp[13:0];
opcode <= temp[18:14];
end
endmodule
