`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:29:01 11/11/2015 
// Design Name: 
// Module Name:    reg_pc 
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
module reg_pc(
		input clk,
		input rst,
		input [31:0] newPC,
		input PCWrite,
		output reg [31:0] PC
    );
	 
	always @(posedge clk)
		begin
		if (rst)
			begin
			PC <= 32'hFFFFFFFF;
			end
		else if (PCWrite)
			begin
			PC <= newPC;
			end
		end

endmodule
