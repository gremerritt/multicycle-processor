`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:09:14 10/07/2015 
// Design Name: 
// Module Name:    Verification_ALU 
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
module Verification_ALU(output [W-1:0] R0,
			  output c_out,
			  input [2:0] ALUOp,
			  input [W-1:0] R2,
			  input [W-1:0] R3,
			  input clk);
			  
	parameter W = 32;
	
	reg [W:0] tmp_out;
	
	assign R0 = tmp_out[W-1:0];
	assign c_out = tmp_out[W];
	
	always@(posedge clk)
	begin
		case (ALUOp)
		3'd0	:	tmp_out <= {1'b0, R2};
		3'd1	:	tmp_out <= {1'b0, ~R2};
		3'd2	:	tmp_out <= R2 + R3;
		3'd3	:	tmp_out <= R2 - R3;
		3'd4	:	tmp_out <= {1'b0, R2 | R3};
		3'd5	:	tmp_out <= {1'b0, R2 & R3};
		3'd6	:	tmp_out <= {1'b0, (R2[W-1] == R3[W-1]) ? ((R2 < R3) ? 1 : 0) : ((R2 < R3) ? 0 : 1)};
		endcase
	end


endmodule
