`timescale 1ns / 1ns

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:29:28 09/25/2015
// Design Name:   FA_str_tb
// Module Name:   
// Project Name:  Pre_Lab4
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: FA_str
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////
module Para_Adder_tb;

	parameter W = 16;

	// Inputs
	reg [15:0] a;
	reg [15:0] b;
	reg c_in;
	
	reg clk;

	// Outputs
	wire c_out;
	wire [15:0] sum;
	wire c_out_verify;
	wire [15:0] sum_verify;
	wire error_flag;


	// Instantiate the Unit Under Test (UUT)
	Para_Adder 
	#(.W(W))
	Adder
	(
		.c_out(c_out), 
		.sum(sum), 
		.a(a), 
		.b(b), 
		.c_in(c_in)
	);
	
	// Verification module
	Verification_nbit 
	#(.W(W))
	Verification 
	(
		.c_out(c_out_verify), 
		.sum(sum_verify), 
		.a(a), 
		.b(b), 
		.c_in(c_in)
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

	initial begin
		// Initialize Inputs
		clk = 0;
		
		a = 0;
		b = 0;
		c_in = 1;

		// Wait 10 ns
		#10;
		a = 16'hffff;
		b = 1;
		c_in = 1;

	end
      
endmodule

