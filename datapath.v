`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:26:23 11/22/2015 
// Design Name: 
// Module Name:    datapath 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module datapath(
		input clk,
		input rst,
		output [3:0] State
    );
	
	// control wires
	wire IRWrite;
	wire PCWrite;
	wire PCWrite_Final;
	wire ALUZeroCond;
	wire BLTCond;
	wire PCWriteCond;
	wire IorD;
	wire MemWrite;
	wire [1:0] MemToReg;
	wire ReadACond;
	wire [1:0] ReadBCond;
	wire RegWrite;
	wire [1:0] Extension;
	wire [1:0] PCSource;
	wire [2:0] ALUOp;
	wire ALUSrcA;
	wire [1:0] ALUSrcB;
	
	wire [31:0] S1_PC_to_Mux;
	wire [31:0] S4_Mux_to_PC;
	reg_pc PC(
		.clk(clk),
		.rst(rst),
		.newPC(S4_Mux_to_PC),
		.PCWrite(PCWrite_Final),				// CTRL
		.PC(S1_PC_to_Mux)
	);
	
	wire [31:0] S1_Mux_to_Mem;
	wire [31:0] S2_SignExtended_Immediate;
	Mux_2_to_1_NBit Mux_IorD1(
		.out(S1_Mux_to_Mem),
		.select(IorD),
		.in0(S1_PC_to_Mux),
		.in1(S2_SignExtended_Immediate)
	);
	
	wire [31:0] S1_IMem_to_Mux;
	IMem InstructionMem(
		.PC(S1_Mux_to_Mem),
		.Instruction(S1_IMem_to_Mux)
	);

	wire [31:0] S1_DMem_to_Mux;
	wire [31:0] S3_B_to_Mux_ReadDataB;
	DMem DataMem(
		.WriteData(S3_B_to_Mux_ReadDataB),
		.MemData(S1_DMem_to_Mux),
		.Address(S1_Mux_to_Mem[15:0]),
		.MemWrite(MemWrite),
		.Clk(clk)
	);

	wire [31:0] S1_Mux_to_IR_MDR;
	Mux_2_to_1_NBit Mux_IorD2(
		.out(S1_Mux_to_IR_MDR),
		.select(IorD),
		.in0(S1_IMem_to_Mux),
		.in1(S1_DMem_to_Mux)
	);
	
	wire [5:0] S2_IR_Opcode_to_Ctrl;
	wire [4:0] S2_IR_to_RegFile_ReadSelect1;
	wire [4:0] S2_IR_to_RegFile_ReadSelect2;
	wire [4:0] S2_IR_to_RegFile_WriteSelect;
	wire [4:0] S2_Mux_to_RegFile_WriteSelect;
	wire [15:0] S2_IR_to_SignExtender_Immediate;
	wire [25:0] S2_IR_to_PC_Jump_Immediate;
	reg_ir IR(
		.clk(clk),
		.rst(rst),
		.IRWrite(IRWrite),
		.InstrIn(S1_Mux_to_IR_MDR),
		.Opcode(S2_IR_Opcode_to_Ctrl),
		.ReadSelect1(S2_IR_to_RegFile_ReadSelect1),
		.ReadSelect2(S2_IR_to_RegFile_ReadSelect2),
		.WriteSelect(S2_IR_to_RegFile_WriteSelect),
		.Imm(S2_IR_to_SignExtender_Immediate),
		.Jump_Imm(S2_IR_to_PC_Jump_Immediate)
	);
	
	wire [31:0] S2_MDR_to_Mux;
	reg_memory_data MDR(
		.clk(clk),
		.rst(rst),
		.dataIn(S1_Mux_to_IR_MDR),
		.dataOut(S2_MDR_to_Mux)
	);
	
	wire [4:0] S2_Mux_to_RegFile_ReadA;
	Mux_2_to_1_NBit 
	#(.DATA_WIDTH(5))
	Mux_ReadA(
		.out(S2_Mux_to_RegFile_ReadA),
		.select(ReadACond),		// CTRL
		.in0(S2_IR_to_RegFile_WriteSelect),
		.in1(S2_IR_to_RegFile_ReadSelect1)
	);
	
	wire [4:0] S2_Mux_to_RegFile_ReadB;
	Mux_3_to_1_NBit 
	#(.DATA_WIDTH(5))
	Mux_ReadB(
		.out(S2_Mux_to_RegFile_ReadB),
		.select(ReadBCond),		// CTRL
		.in0(S2_IR_to_RegFile_WriteSelect),
		.in1(S2_IR_to_RegFile_ReadSelect1),
		.in2(S2_IR_to_RegFile_ReadSelect2)
	);
	
	wire [31:0] S2_Mux_to_RegFile_WriteData;
	wire [31:0] S4_ALUOut_to_Mux;
	wire [31:0] S3_ALU_to_ALUOut;
	Mux_3_to_1_NBit Mux_MemToReg(
		.out(S2_Mux_to_RegFile_WriteData),
		.select(MemToReg),		// CTRL
		.in0(S3_ALU_to_ALUOut),	// ALUOut - REG
		.in1(S2_MDR_to_Mux),
		.in2(S2_SignExtended_Immediate)	// SignExt
	);
	
	wire [31:0] S2_RegFile_to_A_ReadDataA;
	wire [31:0] S2_RegFile_to_B_ReadDataB;
	nbit_register_file RegFile(
		.write_data(S2_Mux_to_RegFile_WriteData),
      .read_data_1(S2_RegFile_to_A_ReadDataA),
		.read_data_2(S2_RegFile_to_B_ReadDataB),
		.read_sel_1(S2_Mux_to_RegFile_ReadA),
		.read_sel_2(S2_Mux_to_RegFile_ReadB),
		.write_address(S2_IR_to_RegFile_WriteSelect),
		.RegWrite(RegWrite),		// CTRL
		.clk(clk)
	);
	
	sign_extender SignExtender(
		.ImmIn(S2_IR_to_SignExtender_Immediate),
		.SignExtSelect(Extension),
		.ImmOut(S2_SignExtended_Immediate)
	);
	
	wire [31:0] S3_A_to_Mux_ReadDataA;
	reg_read_data A(
		.clk(clk),
		.rst(rst),
		.readIn(S2_RegFile_to_A_ReadDataA),
		.readOut(S3_A_to_Mux_ReadDataA)
	);
	
	reg_read_data B(
		.clk(clk),
		.rst(rst),
		.readIn(S2_RegFile_to_B_ReadDataB),
		.readOut(S3_B_to_Mux_ReadDataB)
	);
	
	wire [31:0] S3_Mux_to_ALUInputA;
	Mux_2_to_1_NBit Mux_ALUSrcA(
		.out(S3_Mux_to_ALUInputA),
		.select(ALUSrcA),		// CTRL
		.in0(S3_A_to_Mux_ReadDataA),
		.in1(S1_PC_to_Mux)
	);
	
	wire [31:0] S3_Mux_to_ALUInputB;
	Mux_3_to_1_NBit Mux_ALUSrcB(
		.out(S3_Mux_to_ALUInputB),
		.select(ALUSrcB),		// CTRL
		.in0(S3_B_to_Mux_ReadDataB),
		.in1(S2_SignExtended_Immediate),
		.in2(32'd1)
	);
	
	wire c_out;
	wire zero;
	ALU ALU(
		.R1(S3_ALU_to_ALUOut),
		.c_out(c_out),
		.zero(zero),
		.ALUOp(ALUOp),
		.R2(S3_Mux_to_ALUInputA),
		.R3(S3_Mux_to_ALUInputB)
	);
	
	reg_alu_out ALUOut(
		.clk(clk),
		.rst(rst),
		.ALUIn(S3_ALU_to_ALUOut),
		.ALUOut(S4_ALUOut_to_Mux)
	);
	
	wire [31:0] S2_IR_to_PC_Jump_Immediate_ZE;
	assign S2_IR_to_PC_Jump_Immediate_ZE = {6'd0, S2_IR_to_PC_Jump_Immediate};
	Mux_3_to_1_NBit Mux_PCSource(
		.out(S4_Mux_to_PC),
		.select(PCSource),		// CTRL
		.in0(S3_ALU_to_ALUOut),
		.in1(S4_ALUOut_to_Mux),
		.in2(S2_IR_to_PC_Jump_Immediate_ZE)
	);
	
	wire AND_BLTCond_to_OR;
	wire XOR_ALUZeroCond_to_AND;
	wire AND_ALUZeroCond_to_OR;
	
	and  and1  (AND_BLTCond_to_OR,      S3_ALU_to_ALUOut[31],   BLTCond);
	xnor xnor1 (XOR_ALUZeroCond_to_AND, zero,                   ALUZeroCond);
	and  and2  (AND_ALUZeroCond_to_OR,  XOR_ALUZeroCond_to_AND, PCWriteCond);
	or   or1   (PCWrite_Final, PCWrite, AND_ALUZeroCond_to_OR,  AND_BLTCond_to_OR);
	
	controller CTRL(
		.clk(clk),
		.rst(rst),
		.Opcode(S2_IR_Opcode_to_Ctrl),
		.PCWrite(PCWrite),
		.IRWrite(IRWrite),
		.ALUZeroCond(ALUZeroCond),
		.BLTCond(BLTCond),
		.PCWriteCond(PCWriteCond),
		.IorD(IorD),
		.MemWrite(MemWrite),
		.MemToReg(MemToReg),
		.ReadACond(ReadACond),
		.ReadBCond(ReadBCond),
		.RegWrite(RegWrite),
		.Extension(Extension),
		.PCSource(PCSource),
		.ALUOp(ALUOp),
		.ALUSrcA(ALUSrcA),
		.ALUSrcB(ALUSrcB),
		.State(State)
	);

endmodule
