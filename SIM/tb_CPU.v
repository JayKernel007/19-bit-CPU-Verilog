
////////////////////////////////////////////////////////////////////////////////////////
///////////	Testbench for the CPU to realise few instructions		///////
//////////////////////////////////////////////////////////////////////////////////////
module tb_CPU();
reg clk;
reg en;
reg we_IM;
reg [15:0] codein;
reg [18:0] immd;
wire [31:0] alu_out;
wire [15:0] regA_out;
wire [15:0] regB_out;
wire reg_loadAd;
wire reg_loadBd;

// Instantiation of Module
//clk, en, we_IM, codein, immd, za, zb, eq, gt, lt
CPU C1 (.clk(clk), .en(en), .we_IM(we_IM), .codein(codein), .immd(immd), .alu_out(alu_out), .regA_out(regA_out), .regB_out(regB_out), .reg_loadAd(reg_loadAd),.reg_loadBd(reg_loadBd));

// Initialization of signals
initial
begin
	clk = 0;
	en = 0;
	we_IM = 0;
	codein = 19'b00_100_0000_0000_0000_00;
	immd = 19'b00_100_0000_0000_0000_00;
end

// Clock set up
always #10 clk = ~clk;

// Stimulus
initial
begin
	// Idle state to Load state transistion
	#10 en = 1;

	// Provide first instruction set to start the loadA
	#20 we_IM = 1;
	codein = 19'b00_100_0000_0000_0001_11;
	#10 we_IM = 0;
	
	// Provide enough Delay to ensure the data has been update
	// Wait for some time before doing Load B
	#20 we_IM = 1;
	codein = 19'b00_101_0000_0000_0001_01;
	#10 we_IM = 0;

	// Instruction set for ALU operations
	#20 we_IM = 1;
	codein = 19'h00010;// addition
	#10 we_IM = 0;

	// Instruction set for ALU operations
	#20 we_IM = 1;
	codein = 16'h9020;//or 

	#10 we_IM = 0;


	// Wait for some time before doing Load C
	#20 we_IM = 1;
	codein = 19'b00_110_0000_0000_0001_01;
	#10 we_IM = 0;
	
end
endmodule 