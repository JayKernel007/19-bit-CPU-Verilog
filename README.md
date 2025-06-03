# 19-bit-CPU-Verilog
>A 19-bit processor designed using the Verilog harware description language(HDL). The processor is capable of fetching and executing a set of 19-bit machine instructions.

# Schematic
 ![Image Alt](https://github.com/JayKernel007/19-bit-CPU-Verilog/blob/main/Schematic.jpg?raw=true)
 
# Instruction Set

The instruction set plays a very important role to determine the operation of the CPU. The Code input to the Instruction memory is 19-bit long. This is sent to the instruction register which takes the bits [18:14] as OPCODE and [13:0] as address to start with.

The instruction set are designed in a way to achieve all the necessary functions. Since the OPCODE controls the activity, the OPCODE is used as described below.

The last bit of the code input acts as a mode selection for ALU. Remaining 3 are used for the ALU operation.

Basic format for instructions:
|    opcode     |   dest_reg    |    src1_reg   |   src2_reg    |
| ------------- | ------------- | ------------- | ------------- |
| bits 18 -> 14 | bits 13 -> 8  |  bits 7 -> 4  |  bits 3 -> 0  |
|     5 bits    |    5 bits     |     4 bits    |     4 bits    |

## Logical Instruction

|Mode|	Opcode	|  Instruction |
| 00 |	 000   |	AND r1,r2,r3 |
| 00 |  001   |	OR r1,r2,r3  |
| 00 | 	010   |	XOR r1,r2,r3 |
| 00 |	 011   |	NOT r1,r2    |
 
## Arithmatic Instruction
|Mode|	Opcode	|  Instruction |
| 01 |	 000   |	ADD r1,r2,r3 |
| 01 |  001   |	MUL r1,r2,r3 |
| 01 | 	010   |	SUB r1,r2,r3 |
| 01 |	 011   |	DIV r1,r2,r3 |
| 01 |	 100   |	INC r1       |
| 01 |	 101   |	DEC r1       |

## Custom Instruction
|Mode|	Opcode	|  Instruction |
| 01 |	 000   |	ENC r1,r2    |
| 01 |  001   |	DEC r1,r2    |

## Memory Instruction
|Mode|	Opcode	|  Instruction |
| 11 |	 000   |	LDA r1,addr  |
| 11 |  001   |	LDB r1,addr  |
| 11 | 	010   |	LDC r1,addr  |
| 11 |	 011   |	ST addr,r1   |

## Control Flow Instruction
|Mode|	Opcode	|  Instruction   |
| 11 |	 100   |	JMP addr       |
| 11 |  101   | BEQ r1,r2,addr |
| 11 | 	110   |	BEN r1,r2,addr |

# Control Flow
The Design is completed using a state machine approach. Three states are used to monitor the action of CPU. The three states used are reset, load and execute.

In reset state, we initializa all address to base address and code input to 0. All the signals going out from controller are 0.

In the load state, we initialise the Instruction register with the address and OPCODE to make sure the design is ready for execution.

In execute state, we provide the function required by the USER based in the Instruction set provided.
