`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:24:49 10/06/2015 
// Design Name: 
// Module Name:    Para_And 
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
module Para_And(result, a, b);

parameter W = 32;

input [W-1:0] a, b;
output [W-1:0] result;

genvar i;
generate
	for(i = 0; i < W; i = i + 1)
		begin: and_er
		and a1 (result[i], a[i], b[i]);
		end

endgenerate


endmodule
