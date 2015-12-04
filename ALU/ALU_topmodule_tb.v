`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:21:54 10/07/2015
// Design Name:   ALU_topmodule
// Module Name:   /ad/eng/users/g/m/gmerritt/Desktop/tmp/Lab5/ALU_topmodule_tb.v
// Project Name:  Lab5
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ALU_topmodule
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ALU_topmodule_tb;

	parameter W = 8;

	// Inputs
	reg [2:0] ALUOp;
	reg [W-1:0] R2;
	reg [W-1:0] R3;
	reg clk;

	// Outputs
	wire [W-1:0] R0;
	wire c_out;
	wire c_out_verify;
	wire [W-1:0] R0_verify;
	wire error_flag;

	// Instantiate the Unit Under Test (UUT)
	ALU_topmodule
	#(.W(W))
	uut (
		.R0(R0), 
		.c_out(c_out), 
		.ALUOp(ALUOp), 
		.R2(R2), 
		.R3(R3), 
		.clk(clk)
	);
	
	// Verification module
	Verification_ALU 
	#(.W(W))
	Verification 
	(
		.R0(R0_verify), 
		.c_out(c_out_verify),
		.ALUOp(ALUOp), 
		.R2(R2), 
		.R3(R3),
		.clk(clk)
	);
	
	// Assign Error_flag
	assign error_flag = (c_out != c_out_verify || R0 != R0_verify);
	
	// Verification logic
	always@(posedge clk)
		begin
		if(error_flag)
			$display("Error occurs when R2 = %d, R3 = %d\n", R2, R3);
		end
		
	// Define clk signal for Verfication purpose
	always #5 clk = ~clk;
	//always #50 assign ALUOp = ALUOp + 1'b1;

	initial begin
		// Initialize Inputs
		ALUOp = 3'd0;
		R2 = 0;
		R3 = 0;
		clk = 0;

		// Wait 100 ns for global reset to finish
		#100;
		ALUOp = 3'd6;
		
		R2 = 8'hFA;
		R3 = 8'h3A;
		
		#40;
		R2 = 8'h3A;
		R3 = 8'hFA;
		
		#40;
		R2 = 8'h00;
		R3 = 8'hFA;
		
		#40;
		R2 = 8'h00;
		R3 = 8'h3A;
		
		#40;
		R2 = 8'hFA;
		R3 = 8'h00;
		
		#40;
		R2 = 8'h3A;
		R3 = 8'h00;
		
        
		// Add stimulus here

	end
      
endmodule

