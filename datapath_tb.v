`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   09:45:12 11/23/2015
// Design Name:   datapath
// Module Name:   /ad/eng/users/g/m/gmerritt/Desktop/EC413_Project/datapath/datapath_tb.v
// Project Name:  datapath
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: datapath
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module datapath_tb;

	// Inputs
	reg clk;
	reg rst;

	// Outputs
	wire [4:0] State;

	// Instantiate the Unit Under Test (UUT)
	datapath uut (
		.clk(clk), 
		.rst(rst), 
		.State(State)
	);

	always #5 assign clk = ~clk;

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 1;

		// Wait 100 ns for global reset to finish
		#50;
		rst = 0;
        
		// Add stimulus here

	end
      
endmodule

