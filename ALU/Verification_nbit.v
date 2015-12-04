`timescale 1ns / 1ns

//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:51:17 09/26/2015 
// Design Name: 
// Module Name:    Verification_1bit 
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
module Verification_nbit(c_out, sum, a, b, c_in);

	parameter W = 32;

	input	[W-1:0] a, b; //declare inputs a, b, and c_in, one bit each
	input c_in;
	output c_out; //declare outputs c_out and sum, one bit each
	output [W-1:0]	sum;

	assign {c_out, sum} = a + b + c_in;

endmodule
