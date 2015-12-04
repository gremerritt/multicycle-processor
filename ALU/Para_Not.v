`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:40:32 10/06/2015 
// Design Name: 
// Module Name:    Para_Not 
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
module Para_Not(result, a);

parameter W = 32;

input [W-1:0] a;
output [W-1:0] result;

genvar i;
generate
	for(i = 0; i < W; i = i + 1)
		begin: not_er
		not n1 (result[i], a[i]);
		end

endgenerate


endmodule
