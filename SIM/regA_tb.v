`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/06/2025 03:17:01 PM
// Design Name: 
// Module Name: regA_tb
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


module tb_regA ();
reg clk;
reg loadA;
reg [15:0] dataAin;
wire [15:0] dataAout;

// Instantiation of the Register A

regA r1 (.clk(clk), .loadA(loadA), .dataAin(dataAin), .dataAout(dataAout));

// Initialization
initial
begin
	clk <= 1'b0;
	loadA <= 0;
	dataAin <= 16'h0000;
end

// Clock signal setup

always #5 clk = ~clk;

// Stimilus
initial
begin
	#20 loadA = 1;
	dataAin = 16'h00fe;
	
	#20 loadA = 0;
	dataAin = 16'h0fe6;

	#20 loadA = 1;
end
endmodule
