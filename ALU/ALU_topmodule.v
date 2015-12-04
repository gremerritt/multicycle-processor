`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:00:53 10/07/2015 
// Design Name: 
// Module Name:    ALU_topmodule 
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
module ALU_topmodule(output [W-1:0] R0,
							output c_out,
							input [2:0] ALUOp,
							input [W-1:0] R2,
							input [W-1:0] R3,
							input clk);
							
	parameter W = 32;
							
	wire [W-1:0] R1;
	wire tmp_c_out;
	
	ALU			#(.W(W))		alu	(R1, tmp_c_out, ALUOp, R2, R3);
	Para_Reg		#(.W(W))		reg0	(clk, R1, R0);
	Para_Reg		#(.W(1))		reg1	(clk, tmp_c_out, c_out);

endmodule
