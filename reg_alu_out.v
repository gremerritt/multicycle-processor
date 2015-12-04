`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:24:18 11/22/2015 
// Design Name: 
// Module Name:    reg_alu_out 
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
module reg_alu_out(
		input clk,
		input rst,
		input [31:0] ALUIn,
		output reg [31:0] ALUOut
    );
	 
	always @(posedge clk)
		begin
		if (rst)
			begin
			ALUOut <= 32'd0;
			end
		else
			begin
			ALUOut <= ALUIn;
			end
		end
		
endmodule
