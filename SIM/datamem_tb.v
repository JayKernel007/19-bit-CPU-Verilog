`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/06/2025 12:54:35 PM
// Design Name: 
// Module Name: datamem_tb
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


module tb_datamem();
reg clk;
reg we_DM;
reg [31:0] dataDM;
reg [13:0] addDM;
wire [31:0] outDM;

// Instantiation of the design
datamem d1 (.clk(clk), .we_DM(we_DM), .dataDM(dataDM), .addDM(addDM), .outDM(outDM));

// Initialization of signals
initial
begin
	clk <= 0;
	we_DM <= 0;
	dataDM <= 32'h00000000;
	addDM <= 14'b0000_0000_0000_00;
end

// Clock setup
always #5 clk = ~clk;

// Address setup 
always #60 addDM = addDM + 12'h001;

// Stimulus
initial 
begin
	#5 we_DM <= 1;
	#5 dataDM <= 32'h1dfe;
	#30 we_DM <= 0;

	#30 we_DM <= 1;
	#5 dataDM <= 32'h1001;
	#30 we_DM <= 0;
end
endmodule
