//n bit DeMux
// Specify the number of select lines as a parameter.
module nbit_demux(DeMuxIn,   // DeMux input: 1 bit.
                  DeMuxOut,  // DeMux output: 2^SELECT_WIDTH bits.
						DeMuxSel); // DeMux select lines: SELECT_WIDTH bits.

// Specifies the select line width.
parameter SELECT_WIDTH = 3;

//-------------Input Ports-----------------------------
input  DeMuxIn;
input  [SELECT_WIDTH-1:0] DeMuxSel;
//-------------Output Ports----------------------------
output [2 ** SELECT_WIDTH-1:0] DeMuxOut;
//-------------Wires-----------------------------------
wire [2 ** SELECT_WIDTH-1:0] select;
//-------------Other-----------------------------------
//------------Code Starts Here-------------------------

generate
	genvar i; // Instance variable
	
	// address decoder
	assign select[2 ** SELECT_WIDTH-1:0] = 2 ** DeMuxSel[SELECT_WIDTH-1:0];
	
	// Generation for loop
	for(i= 0;i< 2 ** SELECT_WIDTH;i= i+1)
	begin:demux_loop
		assign DeMuxOut[i] = DeMuxIn & select[i];
	end	
endgenerate

endmodule
