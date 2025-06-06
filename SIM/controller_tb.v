`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/02/2025 12:56:41 PM
// Design Name: 
// Module Name: controller_tb
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


module controller_tb ();
reg clk;
reg en;
reg [4:0] opcode;
wire loadA;
wire loadB;
wire loadC;
wire loadIR;
wire loadPC;
wire incPC;
wire mode;
wire we_DM;
wire selA;
wire selB;

// Design instantiation
controller c1 (.clk(clk), .en(en), .opcode(opcode), .loadA(loadA), .loadB(loadB), .loadC(loadC), .loadIR(loadIR), .loadPC(loadPC), .incPC(incPC), .mode(mode), .we_DM(we_DM), .selA(selA), .selB(selB));

// initialization
initial
begin
	clk = 0;
	en = 0;
	opcode = 4'b0000;
end
// Clock setup
always #5 clk = ~clk;

// Stimulus
initial
begin
	#10 en = 1;
	opcode = 5'b00001;
	
	#20 opcode = 5'b00001;

	#20 opcode = 5'b00010;
end
endmodule 
