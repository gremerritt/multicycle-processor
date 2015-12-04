`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:29:29 10/06/2015 
// Design Name: 
// Module Name:    Compare_1Bit 
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
module Compare_1Bit(L_out, a, b, L_in);
	
	output L_out;
	input a, b, L_in;

	wire not_a;
	wire nota_b;
	wire lin_nota;
	wire lin_b;

	not	not0	(not_a, a);

	and	and0	(nota_b, not_a, b);
	and	and1	(lin_nota, L_in, not_a);
	and	and2	(lin_b, L_in, b);
	
	or		or0	(L_out, nota_b, lin_nota, lin_b);

endmodule
