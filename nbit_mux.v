`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:06:03 10/25/2015 
// Design Name: 
// Module Name:    nbit_mux 
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
module nbit_mux(MuxIn,   // Mux input: 2^SELECT_WIDTH bits.
                MuxOut,  // Mux output: 1 bit.
					 MuxSel); // Mux select lines: SELECT_WIDTH bits.

// Specifies the select line width.
parameter SELECT_WIDTH = 3;

//-------------Input Ports-----------------------------
input  [2 ** SELECT_WIDTH-1:0] MuxIn;
input  [SELECT_WIDTH-1:0] MuxSel;
//-------------Output Ports----------------------------
output MuxOut;
//-------------Wires-----------------------------------
//-------------Other-----------------------------------
//------------Code Starts Here-------------------------
assign MuxOut = MuxIn[MuxSel];
endmodule
