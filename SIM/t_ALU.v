`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/01/2025 03:55:35 PM
// Design Name: 
// Module Name: t_ALU
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


module t_ALU();
reg [15:0] a;
reg [15:0] b;
reg [2:0] opcode;
reg [2:0]mode;
wire [31:0] outALU;
wire za, zb, eq, gt, lt;


// Instantiation of ALU

ALU d1 (.a(a), .b(b), .opcode(opcode), .mode(mode), .outALU(outALU), .za(za), .zb(zb), .eq(eq), .gt(gt), .lt(lt));

// Initialization
initial
begin
	a <= 16'h0000;
	b <= 16'h0000;
	opcode <= 000;
	mode <= 2'b00;
end

initial
begin

	//#10 mode = 00;	//	Mode 0 test the Arithmetic Unit
	#5 a = 16'h0005; b = 16'h0007;

	# 5 opcode = 3'b001;
	# 5 opcode = 3'b010;
	# 5 opcode = 3'b011;
	# 5 opcode = 3'b100;
	# 5 opcode = 3'b101;
	# 5 opcode = 3'b110;
	# 5 opcode = 3'b111;

	#10 mode = 2'b01;	// Mode 1 test for logic unit

	// Various opcodes to see the output
	# 5 opcode = 3'b000;
	# 5 opcode = 3'b001;
	# 5 opcode = 3'b010;
	# 5 opcode = 3'b011;
	# 5 opcode = 3'b100;
	# 5 opcode = 3'b101;
	# 5 opcode = 3'b110;
	# 5 opcode = 3'b111;

    #10 mode = 2'b10;	//	Mode 0 test the Arithmetic Unit
	//# 5 a = 16'h0100;
	# 5 opcode = 3'b000;
	//# 5 a = 16'h01001;
    # 5 opcode = 3'b001;


	// Test ZA
	#10 a <= 16'h0000;

	// Test ZB
	#10 b <= 16'h0000;
	

end
endmodule
