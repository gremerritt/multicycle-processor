`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:37:38 10/06/2015 
// Design Name: 
// Module Name:    ALU 
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
module ALU(output [W-1:0] R1,
			  output c_out,
			  output zero,
			  input [2:0] ALUOp,
			  input [W-1:0] R2,
			  input [W-1:0] R3);

	parameter W = 32;

	//	R1 = R2							MOV
	wire [W-1:0] w1;	//	R1 = ~R2							NOT
	wire [W-1:0] w2;	//	R1 = R2 + R3					ADD
	wire c2;
	wire [W-1:0] w3;	//	R1 = R2 - R3					SUB
	wire c3;
	wire [W-1:0] w4;	//	R1 = R2 | R3					OR
	wire [W-1:0] w5;	//	R1 = R2 & R3					AND
	wire [W-1:0] w7;	//	R1 = 1 if R2 < R3, else 0	SLT (signed)

	Para_Not		#(.W(W))	PN		(w1, R2);
	Para_Adder	#(.W(W))	PAdd1	(c2, w2, R2, R3, 1'b0);
	Para_Adder	#(.W(W))	PAdd2	(c3, w3, R2, ~R3, 1'b1);
	Para_Or		#(.W(W))	PO		(w4, R2, R3);
	Para_And		#(.W(W))	PAnd	(w5, R2, R3);
	Para_SLT		#(.W(W)) SLT	(w7, R2, R3, 1'b0);
	
	Para_Mux		#(.W(W))	mux0	(R1, ALUOp, R2, w1, w2, w3, w4, w5, 32'd0, w7);
	Para_Mux		#(.W(1))	mux1	(c_out, ALUOp, 1'b0, 1'b0, c2, c3, 1'b0, 1'b0, 1'b0, 1'b0);
	
	assign zero = (R1 == 32'd0) ? 1'd1 : 1'd0;

endmodule
