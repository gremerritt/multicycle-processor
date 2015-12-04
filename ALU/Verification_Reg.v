`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:37:01 10/05/2015 
// Design Name: 
// Module Name:    Verification_Reg 
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
module Verification_Reg(c_out, sum, a, b, c_in, clk);

	parameter W = 32;

	input	[W-1:0] a, b; //declare inputs a, b, and c_in, one bit each
	input c_in;
	input clk;
	output c_out; //declare outputs c_out and sum, one bit each
	output [W-1:0]	sum;
	
	reg [W:0] w;

	assign {c_out, sum} = w;
	
	always@(posedge clk)
		begin
		w <= a + b + c_in;
		end

endmodule
