`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:14:57 10/02/2015 
// Design Name: 
// Module Name:    Para_Adder 
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
module Para_Adder(c_out, sum, a, b, c_in);

parameter W = 32;

input [W-1:0] a, b;
input c_in;
output [W-1:0] sum;
output c_out;

wire [W:0] carry;

assign carry[0] = c_in;
assign c_out = carry[W];

genvar i;
generate
	for(i = 0; i < W; i = i + 1)
		begin: adder
		FA_str FA (carry[i+1], sum[i], a[i], b[i], carry[i]);
		end

endgenerate


endmodule
