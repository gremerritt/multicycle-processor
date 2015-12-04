`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:43:18 10/06/2015 
// Design Name: 
// Module Name:    Para_SLT 
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
module Para_SLT(slt, a, b, slt_in);

parameter W = 32;

input [W-1:0] a, b;
input slt_in;
output [W-1:0] slt;

wire [W:0] l_out;
wire [W-2:0] z;

assign z = 0;
assign l_out[0] = slt_in;
assign slt = {z, a_xor_b_xor_lout};

genvar i;
generate
	for(i = 0; i < W; i = i + 1)
		begin: slt_er
		Compare_1Bit slt (l_out[i+1], a[i], b[i], l_out[i]);
		end

endgenerate

// but if the signs of the number are different, we're going to flip the output with an XOR
wire a_xor_b;
wire a_xor_b_xor_lout;
Custom_XOR	c_xor0	(a_xor_b, a[W-1], b[W-1]);
Custom_XOR	c_xor1	(a_xor_b_xor_lout, a_xor_b, l_out[W]);

endmodule
