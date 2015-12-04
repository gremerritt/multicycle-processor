`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:29:31 11/11/2015 
// Design Name: 
// Module Name:    reg_ir 
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
module reg_ir(
		input clk,
		input rst,
		input IRWrite,
		input [DATA_WIDTH-1:0] InstrIn,
		output reg [5:0] Opcode,
		output reg [4:0] ReadSelect1,
		output reg [4:0] ReadSelect2,
		output reg [4:0] WriteSelect,
		output reg [15:0] Imm,
		output reg [25:0] Jump_Imm
    );
	 
	parameter DATA_WIDTH = 32;
	 
	always @(posedge clk)
		begin
		if (rst)
			begin
			Opcode      <= 6'd0;
			ReadSelect1 <= 5'd0;
			ReadSelect2 <= 5'd0;
			WriteSelect <= 5'd0;
			Imm         <= 16'd0;
			Jump_Imm    <= 26'd0;
			end
		else if (IRWrite)
			begin
			Opcode      <= InstrIn[31:26];
			ReadSelect1 <= InstrIn[20:16];
			ReadSelect2 <= InstrIn[15:11];
			WriteSelect <= InstrIn[25:21];
			Imm         <= InstrIn[15:0];
			Jump_Imm    <= InstrIn[25:0];
			end
		end

endmodule
