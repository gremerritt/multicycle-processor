`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:33:35 10/06/2015 
// Design Name: 
// Module Name:    Custom_XOR 
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
module Custom_XOR(out, a, b);
	input a, b;
	output out;
	
	wire w0, w1, w2, w3, w4, w5, w6;
	
	and	and0	(w0, a, b);
	and	and1	(w2, w1, a);
	and	and2	(w3, w1, b);
	and	and3	(w6, w4, w5);
	
	not	not0	(w1, w0);
	not	not1	(w4, w2);
	not	not2	(w5, w3);
	not	not3	(out, w6);


endmodule
