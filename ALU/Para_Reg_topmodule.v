`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:24:09 10/05/2015 
// Design Name: 
// Module Name:    Para_Reg_topmodule 
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
module Para_Reg_topmodule(c_out, sum, a, b, c_in, clk);

	parameter W = 32;
	
	output [W-1:0] sum;
	output c_out;
	input [W-1:0] a;
	input [W-1:0] b;
	input c_in, clk;
	
	wire [W-1:0] w1;
	wire w2;
	
	Para_Adder	#(.W(W))	PA		(w2, w1, a, b, c_in);
	Para_Reg		#(.W(W))	PR1	(clk, w1, sum);
	Para_Reg		#(.W(1))	PR2	(clk, w2, c_out);

endmodule
