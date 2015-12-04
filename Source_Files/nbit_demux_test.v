`timescale 1ns / 1ps

module nbit_demux_test;

	parameter SELECT_WIDTH = 4;

	//-------------Input Ports-----------------------------
	reg  DeMuxIn;
	reg  [SELECT_WIDTH-1:0] DeMuxSel;
	//-------------Output Ports----------------------------
	wire [2 ** SELECT_WIDTH-1:0] DeMuxOut;
	//-------------Wires-----------------------------------
	//-------------Other-----------------------------------
	//------------Code Starts Here-------------------------

	// Instantiate the Unit Under Test (UUT)
	nbit_demux #(SELECT_WIDTH) uut (
		.DeMuxIn(DeMuxIn), 
		.DeMuxOut(DeMuxOut), 
		.DeMuxSel(DeMuxSel)
	);
 
	// Test Vectors
	always begin
		     DeMuxIn= 1'b0; DeMuxSel= 4'h0;
		#20  DeMuxIn= 1'b0; DeMuxSel= 4'h1;
		#20  DeMuxIn= 1'b0; DeMuxSel= 4'h2;
		#20  DeMuxIn= 1'b0; DeMuxSel= 4'h4;
		#20  DeMuxIn= 1'b0; DeMuxSel= 4'h8;
		#20  DeMuxIn= 1'b0; DeMuxSel= 4'hF;

		     DeMuxIn= 1'b1; DeMuxSel= 4'h0;
		#20  DeMuxIn= 1'b1; DeMuxSel= 4'h1;
		#20  DeMuxIn= 1'b1; DeMuxSel= 4'h2;
		#20  DeMuxIn= 1'b1; DeMuxSel= 4'h4;
		#20  DeMuxIn= 1'b1; DeMuxSel= 4'h8;
		#20  DeMuxIn= 1'b1; DeMuxSel= 4'hF;
		
		#20  $finish;      // Terminate simulation
	end
      
endmodule