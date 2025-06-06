`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/05/2025 09:25:45 AM
// Design Name: 
// Module Name: instmem_tb
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


module tb_instmem();
reg clk;
reg we_IM;
reg [18:0] dataIM;
reg [13:0] addIM;
wire [18:0] outIM;

// Instantiation of the design
instmem d1 (.clk(clk), .we_IM(we_IM), .dataIM(dataIM), .addIM(addIM), .outIM(outIM));


// Initialization of signals
initial
begin
	clk <= 0;
	we_IM <= 0;
	dataIM <= 19'b000_0000_0011_1000_0001;
	addIM <= 14'b00_0000_0000_0000;
end

// Clock setup
always #5 clk = ~clk;

// Address setup 
always #60 addIM = addIM + 14'b00_0000_0000_0001;

// Stimulus
initial 
begin
	#5 we_IM <= 1;
	#5 dataIM <= 19'b000_0000_0010_0011_0100;
	#30 we_IM <= 0;

	#60 we_IM <= 1;
	#60 dataIM <= 19'b000_0000_0011_1000_0001;
	#90 we_IM <= 0;
end
endmodule
