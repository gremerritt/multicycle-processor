`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:23:28 11/22/2015 
// Design Name: 
// Module Name:    reg_b 
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
module reg_read_data(
		input clk,
		input rst,
		input [31:0] readIn,
		output reg [31:0] readOut
    );
	 
	always @(posedge clk)
		begin
		if (rst)
			begin
			readOut <= 32'h00000000;
			end
		else
			begin
			readOut <= readIn;
			end
		end
		
endmodule
