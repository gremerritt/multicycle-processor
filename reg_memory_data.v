`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:22:30 11/22/2015 
// Design Name: 
// Module Name:    reg_memory_data 
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
module reg_memory_data(
		input clk,
		input rst,
		input [DATA_WIDTH-1:0] dataIn,
		output reg [DATA_WIDTH-1:0] dataOut
    );
	 
	parameter DATA_WIDTH = 32;
	 
	always @(posedge clk)
		begin
		if (rst)
			begin
			dataOut <= 32'hFFFFFFFF;
			end
		else
			begin
			dataOut <= dataIn;
			end
		end
		
endmodule
