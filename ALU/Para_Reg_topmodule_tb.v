`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:35:19 10/05/2015
// Design Name:   Para_Reg_topmodule
// Module Name:   /ad/eng/users/g/m/gmerritt/Desktop/Lab5/Para_Reg_topmodule_tb.v
// Project Name:  Lab5
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Para_Reg_topmodule
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Para_Reg_topmodule_tb;

	parameter W = 16;

	// Inputs
	reg [W-1:0] a;
	reg [W-1:0] b;
	reg c_in;
	reg clk;

	// Outputs
	wire c_out;
	wire [W-1:0] sum;
	wire c_out_verify;
	wire [W-1:0] sum_verify;
	wire error_flag;

	// Instantiate the Unit Under Test (UUT)
	Para_Reg_topmodule
	#(.W(W))
	uut (
		.c_out(c_out), 
		.sum(sum), 
		.a(a), 
		.b(b), 
		.c_in(c_in), 
		.clk(clk)
	);
	
	// Verification module
	Verification_Reg 
	#(.W(W))
	Verification 
	(
		.c_out(c_out_verify), 
		.sum(sum_verify), 
		.a(a), 
		.b(b), 
		.c_in(c_in),
		.clk(clk)
	);
	
	// Assign Error_flag
	assign error_flag = (c_out != c_out_verify || sum != sum_verify);
	
	// Verification logic
	always@(posedge clk)
		begin
		if(error_flag)
			$display("Error occurs when a = %d, b = %d, c_in = %d\n", a, b, c_in);
		end
		
	// Derfine clk signal for Verfication purpose
	always #5 clk = ~clk;

	always #200 assign {c_in, a, b} = {$random, $random, $random};

	initial begin
		// Initialize Inputs
		a = 0;
		b = 0;
		c_in = 1;
		clk = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

