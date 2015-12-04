`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:19:31 10/06/2015 
// Design Name: 
// Module Name:    Para_Mux 
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
module Para_Mux(output [W-1:0] out,
					 input [2:0] ALUOp,
					 input [W-1:0] in0,
					 input [W-1:0] in1,
					 input [W-1:0] in2,
					 input [W-1:0] in3,
					 input [W-1:0] in4,
					 input [W-1:0] in5,
					 input [W-1:0] in6,
					 input [W-1:0] in7);

parameter W = 32;

genvar i;
generate
	for(i = 0; i < W; i = i + 1)
		begin: mux
		MUX_8_1 mux0 (out[i], ALUOp, in0[i], in1[i], in2[i], in3[i], in4[i], in5[i], in6[i], in7[i]);
		end

endgenerate



endmodule
