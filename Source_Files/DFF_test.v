`timescale 1ns / 1ps

module DFF_test;

	//-------------Input Ports-----------------------------
	reg D;
	reg Write;
	reg Reset;
	reg Clk;
	//-------------Output Ports----------------------------
	wire Q;
	//-------------Wires-----------------------------------
	//-------------Other-----------------------------------
	//------------Code Starts Here-------------------------

	// Instantiate the Unit UDer Test (UUT)
	DFF uut (
      .D(D), 
		.Q(Q),
		.Write(Write),
		.Reset(Reset),
		.Clk(Clk)
	);

	initial 
	begin
		$display ("time\tD\tQ\tWrite\tReset\tClk");	
		$monitor ("%g\t%b\t%b\t%b\t%b\t%b", 
					 $time, D, Q, Write, Reset, Clk);
	end
 
	// Test vectors
	always begin	
	
		     D= 0; Write= 1; Reset= 1; Clk= 0;
		#20  D= 0; Write= 1; Reset= 1; Clk= 1;
		#20  D= 0; Write= 1; Reset= 0; Clk= 0;
		#20  D= 0; Write= 1; Reset= 0; Clk= 1;
		#20  D= 1; Write= 1; Reset= 0; Clk= 0;
		#20  D= 1; Write= 1; Reset= 0; Clk= 1;
		#20  D= 0; Write= 0; Reset= 0; Clk= 0;
		#20  D= 0; Write= 0; Reset= 0; Clk= 1;
		#20  D= 1; Write= 1; Reset= 1; Clk= 0;
		#20  D= 1; Write= 1; Reset= 1; Clk= 1;
		#20  D= 0; Write= 1; Reset= 0; Clk= 0;
		
		#20  $finish;      // Terminate simulation
	end
      
endmodule

