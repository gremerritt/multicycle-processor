`timescale 1ns / 1ps

module nbit_mux_test;

	parameter SELECT_WIDTH = 4;

	//-------------Input Ports-----------------------------
	reg  [2 ** SELECT_WIDTH-1:0] MuxIn;
	reg  [SELECT_WIDTH-1:0] MuxSel;
	//-------------Output Ports----------------------------
	wire MuxOut;
	//-------------Wires-----------------------------------
	//-------------Other-----------------------------------
	//------------Code Starts Here-------------------------

	// Instantiate the Unit Under Test (UUT)
	nbit_mux #(SELECT_WIDTH) uut (
		.MuxIn(MuxIn), 
		.MuxOut(MuxOut), 
		.MuxSel(MuxSel)
	);
 
	// Test Vectors
	always begin
		     MuxIn= 16'h0000; MuxSel= 4'h0;
		#20  MuxIn= 16'h0001; MuxSel= 4'h0;
		#20  MuxIn= 16'h8000; MuxSel= 4'h0;
		#20  MuxIn= 16'h5555; MuxSel= 4'h0;
		#20  MuxIn= 16'haaaa; MuxSel= 4'h0;
		#20  MuxIn= 16'hffff; MuxSel= 4'h0;
		
		#20  MuxIn= 16'h0000; MuxSel= 4'h1;
		#20  MuxIn= 16'h0001; MuxSel= 4'h1;
		#20  MuxIn= 16'h8000; MuxSel= 4'h1;
		#20  MuxIn= 16'h5555; MuxSel= 4'h1;
		#20  MuxIn= 16'haaaa; MuxSel= 4'h1;
		#20  MuxIn= 16'hffff; MuxSel= 4'h1;
		
		#20  MuxIn= 16'h0000; MuxSel= 4'hF;
		#20  MuxIn= 16'h0001; MuxSel= 4'hF;
		#20  MuxIn= 16'h8000; MuxSel= 4'hF;
		#20  MuxIn= 16'h5555; MuxSel= 4'hF;
		#20  MuxIn= 16'haaaa; MuxSel= 4'hF;
		#20  MuxIn= 16'hffff; MuxSel= 4'hF;
		#20  $finish;      // Terminate simulation
	end
      
endmodule