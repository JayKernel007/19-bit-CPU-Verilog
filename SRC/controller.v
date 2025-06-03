////////////////////////////////////////////////////////////////////////////////
////////	Verilog Program for the controller of the CPU		///////
//////////////////////////////////////////////////////////////////////////////
module controller ( clk, en, opcode, eq, loadA, loadB, loadC, loadIR, loadPC, incPC, mode, we_DM, selA, selB);
input clk;
input en;
input [4:0] opcode;
input eq;
output loadA;
output loadB;
output loadC;
output loadIR;
output loadPC;
output incPC;
output [1:0] mode;
output we_DM;
output selA;
output selB;

reg loadA;
reg loadB;
reg loadC;
reg loadIR;
reg [1:0] mode;
reg we_DM;
reg selA;
reg selB;
reg loadPC;
reg incPC;

// Registers to hold the value of state and next state

reg [2:0] state;
reg [2:0] next_state;

parameter reset = 3'b000, load = 3'b010, execute = 3'b100;


//Code for operation of the CPU
always@(posedge clk)
begin
	
	if ( en == 0 ) begin
	state = reset;
	end
	else if (en == 1) begin
	state = next_state;
	end
end


// Now for the Output logic. Output logic depends on OPCODE and Enable signal
always@(*)
begin
	if ( en == 0 ) begin
	loadA = 0;
	loadB = 0;
	loadC = 0;
	loadIR = 0;
	loadPC = 0;
	incPC = 0;
	mode = 2'b11;
	we_DM = 0;
	selA = 1'b0;
	selB = 1'b0;
	next_state = reset;
	end

	else begin
		
		case(state)
		// We just wait for a small duration of time in the same state to see if there is any change in input
		reset: 	begin
			loadA = 0;
			loadB = 0;
			loadC = 0;
			loadIR = 0;
			loadPC = 0;
			incPC = 0;
			mode = 2'b11;
			we_DM = 0;
			selA = 1'b0;
			selB = 1'b0;
			next_state = load;
			end

		load:	begin
			loadA = 0;
			loadB = 0;
			loadC = 0;
			loadIR = 1;
			loadPC = 1;
			incPC = 0;
			mode = 2'b11;
			we_DM = 0;
			selA = 1'b0;
			selB = 1'b0;
			next_state = execute;
			end

		execute:begin
			case(opcode)
			// Mode 00, AND ALU operation for opcode 000
			00_000: 	begin
				loadA = 0;
				loadB = 0;
				loadC = 0;
				loadIR = 0;
				loadPC = 0;
				incPC = 1;
				mode = 2'b00;
				we_DM = 1;
				//#5 we_DM = 0;
				selA = 1'b0;
				selB = 1'b0;
				end
			// Mode 00, OR ALU operation for opcode 001
			00_001: 	begin
				loadA = 0;
				loadB = 0;
				loadC = 0;
				loadIR = 0;
				loadPC = 0;
				incPC = 1;
				mode = 2'b00;
				we_DM = 1;
				//#5 we_DM = 0;
				selA = 1'b0;
				selB = 1'b0;
				end
			// Mode 00, XOR ALU operation for opcode 010
			00_010: 	begin
				loadA = 0;
				loadB = 0;
				loadC = 0;
				loadIR = 0;
				loadPC = 0;
				incPC = 1;
				mode = 2'b00;
				we_DM = 1;
				//#5 we_DM = 0;
				selA = 1'b0;
				selB = 1'b0;
				end
			// Mode 00, NOT ALU operation for opcode 011
			00_011: 	begin
				loadA = 0;
				loadB = 0;
				loadC = 0;
				loadIR = 0;
				loadPC = 0;
				incPC = 1;
				mode = 2'b00;
				we_DM = 1;
				//#5 we_DM = 0;
				selA = 1'b0;
				selB = 1'b0;
				end
			// Mode 01, ADD ALU operation for opcode 000
			01_000: 	begin
				loadA = 0;
				loadB = 0;
				loadC = 0;
				loadIR = 0;
				loadPC = 0;
				incPC = 1;
				mode = 2'b01;
				we_DM = 1;
				//#5 we_DM = 0;
				selA = 1'b0;
				selB = 1'b0;
				end
			// Mode 01,MUL ALU operation for opcode 001
			01_001: 	begin
				loadA = 0;
				loadB = 0;
				loadC = 0;
				loadIR = 0;
				loadPC = 0;
				incPC = 1;
				mode = 2'b01;
				we_DM = 1;
				selA = 1'b0;
				selB = 1'b0;
				end
			// Mode 01, SUB ALU operation for opcode 010
			01_010: 	begin
				loadA = 0;
				loadB = 0;
				loadC = 0;
				loadIR = 0;
				loadPC = 0;
				incPC = 1;
				mode = 2'b01;
				we_DM = 1;
				//#5 we_DM = 0;
				selA = 1'b0;
				selB = 1'b0;
				end
			// Mode 01, DIV ALU operation for opcode 011
			01_011: 	begin
				loadA = 0;
				loadB = 0;
				loadC = 0;
				loadIR = 0;
				loadPC = 0;
				incPC = 1;
				mode = 2'b01;
				we_DM = 1;
				//#5 we_DM = 0;
				selA = 1'b0;
				selB = 1'b0;
				end
			// Mode 01, INC ALU operation for opcode 011
			01_100: 	begin
				loadA = 0;
				loadB = 0;
				loadC = 0;
				loadIR = 0;
				loadPC = 0;
				incPC = 1;
				mode = 2'b01;
				we_DM = 1;
				//#5 we_DM = 0;
				selA = 1'b0;
				selB = 1'b0;
				end
			// Mode 01, DEC ALU operation for opcode 011
			01_101: 	begin
				loadA = 0;
				loadB = 0;
				loadC = 0;
				loadIR = 0;
				loadPC = 0;
				incPC = 1;
				mode = 2'b01;
				we_DM = 1;
				//#5 we_DM = 0;
				selA = 1'b0;
				selB = 1'b0;
				end
			// Mode 10, EN ALU operation for opcode 000
			10_000:	begin
				loadA = 0;
				loadB = 0;
				loadC = 0;
				loadIR = 0;
				loadPC = 0;
				incPC = 1;
				mode = 2'b10;
				we_DM = 1;
				selA = 1'b0;
				selB = 1'b0;
				end
			// Mode 10, DEC ALU operation for opcode 001
			10_001:	begin
				loadA = 0;
				loadB = 0;
				loadC = 0;
				loadIR = 0;
				loadPC = 0;
				incPC = 1;
				mode = 2'b10;
				we_DM = 1;
				selA = 1'b0;
				selB = 1'b0;
				end
			// Load A operation
			11_100: 	begin
				loadA = 1;
				loadB = 0;
				loadC = 0;
				loadIR = 0;
				loadPC = 0;
				incPC = 1;
				mode = 2'b11;
				we_DM = 1;
				//#5 we_DM = 0;
				selA = 1'b0;
				selB = 1'b0;
				end
			// Load B operation
			11_101: 	begin
				loadA = 0;
				loadB = 1;
				loadC = 0;
				loadIR = 0;
				loadPC = 0;
				incPC = 1;
				mode = 2'b11;
				we_DM = 1;
				//#5 we_DM = 0;
				selA = 1'b0;
				selB = 1'b0;
				end
			// Load C operation
			11_110: 	begin
				loadA = 0;
				loadB = 0;
				loadC = 1;
				loadIR = 0;
				loadPC = 0;
				incPC = 1;
				mode = 2'b11;
				we_DM = 1;
				//#5 we_DM = 0;
				selA = 1'b0;
				selB = 1'b0;
				end
			// Store operation
			11_111: 	begin
				loadA = 0;
				loadB = 0;
				loadC = 0;
				loadIR = 0;
				loadPC = 0;
				incPC = 1;
				mode = 2'b11;
				we_DM = 1;
				//#5 we_DM = 0;
				selA = 1'b0;
				selB = 1'b0;
				end

			// JMP translation
			11_000: 	begin
				loadA = 0;
				loadB = 0;
				loadC = 0;
				loadIR = 0;
				loadPC = 1;
				incPC = 1;
				mode = 2'b11;
				we_DM = 1;
				selA = 1'b1;
				selB = 1'b1;
				end
			// BEQ translation
			11_001: 	begin
				loadA = 0;
				loadB = 0;
				loadC = 0;
				loadIR = 0;
				loadPC = eq ? 1 : 0;
				incPC = 1;
				mode = 2'b11;
				we_DM = 1;
				selA = 1'b1;
				selB = 1'b1;
				end	
			// BNE translation
			11_010: 	begin
				loadA = 0;
				loadB = 0;
				loadC = 0;
				loadIR = 0;
				loadPC = eq ? 0 : 1;
				incPC = 1;
				mode = 2'b11;
				we_DM = 1;
				selA = 1'b1;
				selB = 1'b1;
				end			
			default: begin
				loadA = 0;
				loadB = 0;
				loadC = 0;
				loadIR = 1;
				mode = 2'b11;
				we_DM = 0;
				selA = 1'b0;
				selB = 1'b0;
				end
			endcase
			next_state = load;
			end
			
		default: begin
			loadA = 0;
			loadB = 0;
			loadC = 0;
			loadIR = 1;
			mode = 2'b11;
			we_DM = 0;
			selA = 1'b0;
			selB = 1'b0;
			next_state = reset;
			end
		endcase
	end
end
endmodule
