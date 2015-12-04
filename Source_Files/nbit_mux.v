//n bit Mux
// Specify the number of select lines as a parameter.
module nbit_mux(MuxIn,   // Mux input: 2^SELECT_WIDTH bits.
                MuxOut,  // Mux output: 1 bit.
					 MuxSel); // Mux select lines: SELECT_WIDTH bits.

// Specifies the select line width.
parameter SELECT_WIDTH = 3;

//-------------Input Ports-----------------------------
input  [2 ** SELECT_WIDTH-1:0] MuxIn;
input  [SELECT_WIDTH-1:0] MuxSel;
//-------------Output Ports----------------------------
output MuxOut;
//-------------Wires-----------------------------------
//-------------Other-----------------------------------
//------------Code Starts Here-------------------------
assign MuxOut = MuxIn[MuxSel];
endmodule
