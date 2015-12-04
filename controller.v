`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:22:25 11/11/2015 
// Design Name: 
// Module Name:    controller 
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
module controller(
		input clk,
		input rst,
		input [5:0] Opcode,
		output PCWrite,
		output IRWrite,
		output ALUZeroCond,
		output BLTCond,
		output PCWriteCond,
		output IorD,
		output MemWrite,
		output [1:0] MemToReg,
		output ReadACond,
		output [1:0] ReadBCond,
		output RegWrite,
		output [1:0] Extension,
		output [1:0] PCSource,
		output [2:0] ALUOp,
		output ALUSrcA,
		output [1:0] ALUSrcB,
		output reg [3:0] State
    );
	
	// create a dictionary here for readability
	parameter NoOp        = 6'b000000;
	parameter J           = 6'b000001;
	parameter BEQ         = 6'b100000;
	parameter BNE         = 6'b100001;
	parameter LI          = 6'b111001;
	parameter LUI         = 6'b111010;
	parameter LWI         = 6'b111011;
	parameter SWI         = 6'b111100;
	parameter R_Type_Mask = 2'b01;
	parameter I_Type_Mask = 3'b110;
	parameter BLT         = 6'b100010;
	parameter BLE         = 6'b100011;
	
	//reg [3:0] State;
	
	always @(posedge clk)
		begin
		if (rst)
			begin
			State <= 4'd0;
			end
		else
			begin
			case (State)
				4'd0:
					State <= 4'd1;
				4'd1:
					// most of the work is done here
					if (Opcode == NoOp)
						State <= 4'd0;
					else if (Opcode == LWI)
						State <= 4'd2;
					else if (Opcode == SWI)
						State <= 4'd4;
					else if (Opcode == LI)
						State <= 4'd5;
					else if (Opcode == LUI)
						State <= 4'd6;
					else if (Opcode[5:3] == I_Type_Mask)
						if (Opcode[1] == 1'b1)		// I-Type SE
							State <= 4'd7;
						else								// I-Type ZE
							State <= 4'd8;
					else if (Opcode[5:4] == R_Type_Mask)
						State <= 4'd9;
					else if (Opcode == J)
						State <= 4'd10;
					else if (Opcode == BLE)
						State <= 4'd11;
					else if (Opcode == BLT)
						State <= 4'd12;
					else if (Opcode == BNE)
						State <= 4'd13;
					else if (Opcode == BEQ)
						State <= 4'd14;
					// if we have a bad opcode go back to State 1 (NoOp)
					else
						State <= 4'd0;
				4'd2:
					State <= 4'd3;
				// if we get in a bad state go back to State 1
				default:
					State <= 4'd0;
			endcase
			end
		end
	
	assign PCWrite     = (rst == 1'b1) ? 1'b0  : (((State == 4'd0) || (State == 4'd10)) ? 1'b1 : 1'b0);
	assign IRWrite     = (rst == 1'b1) ? 1'b0  : ( (State == 4'd0) ? 1'b1 : 1'b0);
	assign ALUZeroCond = (rst == 1'b1) ? 1'b0  : (((State == 4'd11) || (State == 4'd14)) ? 1'b1 : 1'b0);
	assign BLTCond     = (rst == 1'b1) ? 1'b0  : (((State == 4'd11) || (State == 4'd12)) ? 1'b1 : 1'b0);
	assign PCWriteCond = (rst == 1'b1) ? 1'b0  : (((State == 4'd11) || (State == 4'd13) || (State == 4'd14)) ? 1'b1 : 1'b0);
	assign IorD        = (rst == 1'b1) ? 1'b0  : (((State == 4'd2) || (State == 4'd4)) ? 1'b1 : 1'b0);
	assign MemWrite    = (rst == 1'b1) ? 1'b0  : ( (State == 4'd4) ? 1'b1 : 1'b0);
	assign MemToReg    = (rst == 1'b1) ? 2'b00 : ( (State == 4'd3) ? 2'b01 : (((State == 4'd7) || (State == 4'd8) || (State == 4'd9)) ? 2'b00 : (((State == 4'd5) || (State == 4'd6)) ? 2'b10 : 2'b0)));
	assign RegWrite    = (rst == 1'b1) ? 1'b0  : (((State == 4'd3) || (State == 4'd5) || (State == 4'd6) || (State == 4'd7) || (State == 4'd8) || (State == 4'd9)) ? 1'b1 : 1'b0);
	assign Extension   = (rst == 1'b1) ? 2'b00 : (((State == 4'd1) || (State == 4'd2) || (State == 4'd4)|| (State == 4'd7)) ? 2'b01 : ((State == 4'd6) ? 2'b10 : 2'b00));
	assign PCSource    = (rst == 1'b1) ? 2'b00 : (((State == 4'd11) || (State == 4'd12) || (State == 4'd13) || (State == 4'd14)) ? 2'b01 : ((State == 4'd10) ? 2'b10 : 2'b00));
	assign ALUOp       = (rst == 1'b1) ? 3'd0  : (((State == 4'd0) || (State == 4'd1)) ? 3'b010 : (((State == 4'd11) || (State == 4'd12) || (State == 4'd13) || (State == 4'd14)) ? 3'b011 : Opcode[2:0]));
	assign ALUSrcA     = (rst == 1'b1) ? 1'b0  : (((State == 4'd0) || (State == 4'd1)) ? 1'b1 : 1'b0);
	assign ALUSrcB     = (rst == 1'b1) ? 2'b00 : ( (State == 4'd0) ? 2'b10 : (((State == 4'd1) || (State == 4'd7) || (State == 4'd8)) ? 2'b01 : 2'b00));

	assign ReadACond   = (rst == 1'b1) ? 1'b0  : (((Opcode[5:3] == I_Type_Mask) || (Opcode[5:4] == R_Type_Mask)) ? 1'b1 : 1'b0);
	assign ReadBCond   = (rst == 1'b1) ? 2'b00 : ( (Opcode[5:4] == R_Type_Mask) ? 2'b10 : (((Opcode == BNE) || (Opcode == BEQ) || (Opcode == BLT) || (Opcode == BLE)) ? 2'b01 : 2'b0));
endmodule
