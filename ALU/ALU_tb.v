`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:28:26 10/06/2015
// Design Name:   ALU
// Module Name:   /ad/eng/users/g/m/gmerritt/Desktop/tmp/Lab5/ALU_tb.v
// Project Name:  Lab5
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ALU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ALU_tb;

	parameter W = 16;

	// Inputs
	reg [2:0] ALUOp;
	reg [W-1:0] R2;
	reg [W-1:0] R3;
	
	reg clk;

	// Outputs
	wire [W-1:0] R1;
	wire c_out;
	//wire c2, c3;

	// Instantiate the Unit Under Test (UUT)
	ALU 
	#(.W(W))
	uut (
		.R1(R1),
		.c_out(c_out),
		.ALUOp(ALUOp), 
		.R2(R2), 
		.R3(R3)
	);
	
	always #5 clk = ~clk;
	always #50 R2 = R2 + 1'b1;

	initial begin
		// Initialize Inputs
		clk = 0;
		
		ALUOp = 3'd0;
		R2 = 16'd0;
		R3 = 16'd0;

		// Wait 100 ns for global reset to finish
		#200;
		ALUOp = 3'd3;
		R2 = 16'hFFFF;
		R3 = 16'd1;
        
		// Add stimulus here

	end
      
endmodule

