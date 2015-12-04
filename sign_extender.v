`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:23:52 11/22/2015 
// Design Name: 
// Module Name:    sign_extender 
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
module sign_extender(
		input [15:0] ImmIn,
		input [1:0] SignExtSelect,
		output [31:0] ImmOut
    );
	 
	// 0: ZE
	// 1: SE
	// 2: LUI
	assign ImmOut = (SignExtSelect == 2'b10) ? {ImmIn, 16'd0} : ((SignExtSelect == 2'b01) ? {{16{ImmIn[15]}}, ImmIn[15:0]} : {16'd0, ImmIn});
		
endmodule
