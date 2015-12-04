`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:41:27 10/06/2015 
// Design Name: 
// Module Name:    MUX_8_1 
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
module MUX_8_1(out, ALUOp, in0, in1, in2, in3, in4, in5, in6, in7);
	output out;
	input [2:0] ALUOp;
	input in0, in1, in2, in3, in4, in5, in6, in7;
	
	wire not_ALUOp_0, not_ALUOp_1, not_ALUOp_2;
	wire w_and0, w_and1, w_and2, w_and3, w_and4, w_and5, w_and6, w_and7;
	
	not	not0		(not_ALUOp_0, ALUOp[0]);
	not	not1		(not_ALUOp_1, ALUOp[1]);
	not	not2		(not_ALUOp_2, ALUOp[2]);
	
	and	and0		(w_and0, not_ALUOp_0, not_ALUOp_1, not_ALUOp_2, in0);
	and	and1		(w_and1, ALUOp[0],    not_ALUOp_1, not_ALUOp_2, in1);
	and	and2		(w_and2, not_ALUOp_0, ALUOp[1],    not_ALUOp_2, in2);
	and	and3		(w_and3, ALUOp[0],    ALUOp[1],    not_ALUOp_2, in3);
	and	and4		(w_and4, not_ALUOp_0, not_ALUOp_1, ALUOp[2],    in4);
	and	and5		(w_and5, ALUOp[0],    not_ALUOp_1, ALUOp[2],    in5);
	and	and6		(w_and6, not_ALUOp_0, ALUOp[1],    ALUOp[2],    in6);
	and	and7		(w_and7, ALUOp[0],    ALUOp[1],    ALUOp[2],    in7);
	
	or		or0		(out, w_and0, w_and1, w_and2, w_and3, w_and4, w_and5, w_and6, w_and7);

endmodule
