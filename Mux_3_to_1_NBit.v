`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:12:11 11/22/2015 
// Design Name: 
// Module Name:    Mux_3_to_1_NBit 
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
module Mux_3_to_1_NBit(
		output [DATA_WIDTH-1:0] out,
		input [1:0] select,
		input [DATA_WIDTH-1:0] in0,
		input [DATA_WIDTH-1:0] in1,
		input [DATA_WIDTH-1:0] in2
	);

parameter DATA_WIDTH = 32;

genvar i;
generate
	for(i = 0; i < DATA_WIDTH; i = i + 1)
		begin: mux
		nbit_mux #(.SELECT_WIDTH(2)) mux ({1'b0, in2[i], in1[i], in0[i]}, out[i], select);
		end
endgenerate

endmodule
