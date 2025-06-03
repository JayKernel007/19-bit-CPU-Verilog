`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/02/2025 11:57:17 AM
// Design Name: 
// Module Name: CPU
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


module CPU(clk, en, we_IM, codein, immd,alu_out,regA_out,regB_out,reg_loadAd,reg_loadBd);
input clk;
input en;
input we_IM;
input [18:0] codein;
input [13:0] immd;
output reg [31:0] alu_out;
output reg [15:0]regA_out;
output reg [15:0]regB_out;
output reg reg_loadAd;
output reg reg_loadBd;


wire [13:0] curradd; wire [18:0] outIMd; wire [13:0] addressd; wire [4:0] opcodeD; wire[1:0] moded;
wire loadIRd, loadAd, loadBd, loadCd, we_DMd, selAd, selBd, loadPCd, incPCd;
wire [13:0] execaddd; wire [15:0] dataAoutd; wire [15:0] dataBoutd; wire [31:0] outALUd;
wire [31:0] currdat; wire [31:0] outDMd; wire [31:0] dataCoutd;
wire eqd;


instmem 	a1 (.clk(clk), .we_IM(we_IM), .dataIM(codein), .addIM(curradd), .outIM(outIMd));
insReg 		a2 (.clk(clk), .loadIR(loadIRd), .insin(outIMd), .address(addressd), .opcode(opcodeD));
controller 	a3 (.clk(clk), .en(en), .opcode(opcodeD), .eq(eqd), .loadA(loadAd), .loadB(loadBd), .loadC(loadCd), .loadIR(loadIRd), .loadPC(loadPCd), .incPC(incPCd), .mode(moded), .we_DM(we_DMd), .selA(selAd), .selB(selBd));
PC 		    a4 (.clk(clk), .loadPC(loadPCd), .incPC(incPCd), .address(addressd), .execadd(execaddd));
muxB		a5 (.clk(clk), .in1(execaddd), .in2({immd}), .sel(selBd), .outB(curradd));
regA 		a6 (.clk(clk), .loadA(loadAd), .dataAin(outDMd[15:0]), .dataAout(dataAoutd));
regB 		a7 (.clk(clk), .loadB(loadBd), .dataBin(outDMd[31:16]), .dataBout(dataBoutd));
regC		a8 (.clk(clk), .loadC(loadCd), .dataCin(currdat), .dataCout(dataCoutd));
datamem 	a9 (.clk(clk), .we_DM(we_DMd), .dataDM(dataCoutd), .addDM(addressd), .outDM(outDMd));
muxA		b1 (.clk(clk), .in1(outALUd), .in2(immd), .sel(selAd), .outA(currdat));
ALU 		b2 (.a(dataAoutd), .b(dataBoutd), .opcode(opcodeD[2:0]), .mode(moded), .outALU(outALUd), .eq(eqd));


always @(*) begin
alu_out = outALUd;
regA_out = dataAoutd;
regB_out = dataBoutd;
reg_loadAd = loadAd;
reg_loadBd = loadBd;
end
endmodule
