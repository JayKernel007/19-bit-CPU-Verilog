`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/06/2025 12:47:48 PM
// Design Name: 
// Module Name: PC_tb
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


module tb_PC ();
reg clk;
reg loadPC;
reg incPC;
reg [13:0] address;
wire [13:0] execadd;

// Instantiation of the design
PC p1 (.clk(clk), .loadPC(loadPC), .incPC(incPC), .address(address), .execadd(execadd));

// Initialization of inputs
initial
begin
	clk = 1'b0;
	loadPC = 1'b0;
	incPC = 1'b0;
	address = 14'b00_0000_0000_0000;
end

//  Clock instantiation
always #5 clk = ~ clk;

// Adress randomization
always #30 address = address + 14'b00_0000_0000_0000;

// Stimulus
initial 
begin
	// Execaddress will be same as initial address during this time
	#10 loadPC <= 1'b0;
	incPC <= 1'b0;

	// Now let the address increment and then load the address into the PC
	#30 loadPC = 1'b1;
	incPC = 1'b0;

	// Increment the address to get the next address
	#10 loadPC = 1'b0;
	incPC = 1'b1;
end
endmodule
