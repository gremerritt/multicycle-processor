`timescale 1ns / 1ps

module nbit_reg_test;

	parameter DATA_WIDTH = 32;

	//-------------Input Ports-----------------------------
	reg [DATA_WIDTH-1:0] nD;
	reg Write;
	reg Reset;
	reg Clk;
	//-------------Output Ports----------------------------
	wire [DATA_WIDTH-1:0] nQ;
	//-------------Wires-----------------------------------
	//-------------Other-----------------------------------
	//------------Code Starts Here-------------------------

	// Instantiate the Unit Under Test (UUT)
	nbit_reg #(DATA_WIDTH) uut (
      .nD(nD), 
		.nQ(nQ),
		.Write(Write),
		.Reset(Reset),
		.Clk(Clk)
	);
 
	// Test vectors
	always begin
		
		     nD= 32'h0;        Write= 0; Reset= 1; Clk= 0;
		#20  nD= 32'h0;        Write= 0; Reset= 1; Clk= 1;
		#20  nD= 32'hDEADBEEF; Write= 1; Reset= 0; Clk= 0;
		#20  nD= 32'hDEADBEEF; Write= 1; Reset= 0; Clk= 1;
		#20  nD= 32'hBADF000D; Write= 0; Reset= 0; Clk= 0;
		#20  nD= 32'hBADF000D; Write= 0; Reset= 0; Clk= 1;
		#20  nD= 32'hBADF000D; Write= 0; Reset= 0; Clk= 0;
		#20  nD= 32'hBADF000D; Write= 0; Reset= 0; Clk= 1;
		#20  nD= 32'hBADF000D; Write= 0; Reset= 0; Clk= 0;
		#20  nD= 32'hBADF000D; Write= 0; Reset= 0; Clk= 1;
		#20  nD= 32'hB0B0B0B0; Write= 1; Reset= 0; Clk= 0;
		#20  nD= 32'hB0B0B0B0; Write= 1; Reset= 0; Clk= 1;
		#20  nD= 32'hB0B0B0B0; Write= 1; Reset= 1; Clk= 0;
		#20  nD= 32'hB0B0B0B0; Write= 1; Reset= 1; Clk= 1;
		#20  nD= 32'hB0B0B0B0; Write= 1; Reset= 1; Clk= 0;
		#20  nD= 32'hB0B0B0B0; Write= 1; Reset= 1; Clk= 1;
		#20  nD= 32'hB0B0B0B0; Write= 1; Reset= 1; Clk= 0;
		
		#20  $finish;      // Terminate simulation
	end
      
endmodule

