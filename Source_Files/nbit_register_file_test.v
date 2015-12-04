`timescale 1ns / 1ps

module nbit_register_file_test;

// Register select line size (number of registers is 2 to the power of this number).
parameter REG_SELECT_WIDTH = 3;
// Register size in bits.
parameter DATA_WIDTH = 32;

//-------------Input Ports-----------------------------
reg [DATA_WIDTH-1:0]       WriteData;
reg [REG_SELECT_WIDTH-1:0] ReadSelect1;
reg [REG_SELECT_WIDTH-1:0] ReadSelect2;
reg [REG_SELECT_WIDTH-1:0] WriteSelect;
reg WriteEnable;
reg Reset;
reg Clk;
//-------------Output Ports----------------------------
wire [DATA_WIDTH-1:0] ReadData1;
wire [DATA_WIDTH-1:0] ReadData2;
//-------------Wires-----------------------------------
//-------------Other-----------------------------------
//------------Code Starts Here-------------------------

	// Instantiate the Unit Under Test (UUT)
	nbit_register_file #(REG_SELECT_WIDTH,DATA_WIDTH) uut (
      .WriteData(WriteData), 
		.ReadData1(ReadData1),
      .ReadData2(ReadData2), 
		.ReadSelect1(ReadSelect1), 
      .ReadSelect2(ReadSelect2), 
		.WriteSelect(WriteSelect),
      .WriteEnable(WriteEnable), 
		.Reset(Reset),
		.Clk(Clk)
	);
 
	// Test vectors
	always begin

		
		// Initial Reset, should only occur on rising edge
		     WriteData= 32'h00000000; ReadSelect1= 0; ReadSelect2= 1; WriteSelect= 0; WriteEnable= 0; Reset= 1; Clk= 0;
		#20  WriteData= 32'h00000000; ReadSelect1= 0; ReadSelect2= 1; WriteSelect= 0; WriteEnable= 0; Reset= 1; Clk= 1;
		
		// Write a value into register 0
		#20  WriteData= 32'hDEADBEEF; ReadSelect1= 0; ReadSelect2= 1; WriteSelect= 0; WriteEnable= 1; Reset= 0; Clk= 0;
		#20  WriteData= 32'hDEADBEEF; ReadSelect1= 0; ReadSelect2= 1; WriteSelect= 0; WriteEnable= 1; Reset= 0; Clk= 1;
		
		// Write a value into register 0
		#20  WriteData= 32'hBADF000D; ReadSelect1= 0; ReadSelect2= 1; WriteSelect= 0; WriteEnable= 0; Reset= 0; Clk= 0;
		#20  WriteData= 32'hBADF000D; ReadSelect1= 0; ReadSelect2= 1; WriteSelect= 0; WriteEnable= 0; Reset= 0; Clk= 1;
		
		// Try a different read select and see that contents are 0
		#20  WriteData= 32'hBADF000D; ReadSelect1= 5; ReadSelect2= 1; WriteSelect= 0; WriteEnable= 0; Reset= 0; Clk= 0;
		#20  WriteData= 32'hBADF000D; ReadSelect1= 5; ReadSelect2= 1; WriteSelect= 0; WriteEnable= 0; Reset= 0; Clk= 1;
		
		// Set a value into register 0 but do not assert WriteEnable, should not write
		#20  WriteData= 32'hBADF000D; ReadSelect1= 0; ReadSelect2= 1; WriteSelect= 0; WriteEnable= 0; Reset= 0; Clk= 0;
		#20  WriteData= 32'hBADF000D; ReadSelect1= 0; ReadSelect2= 1; WriteSelect= 0; WriteEnable= 0; Reset= 0; Clk= 1;
		#20  WriteData= 32'hBADF000D; ReadSelect1= 0; ReadSelect2= 1; WriteSelect= 0; WriteEnable= 0; Reset= 0; Clk= 0;
		#20  WriteData= 32'hBADF000D; ReadSelect1= 0; ReadSelect2= 1; WriteSelect= 0; WriteEnable= 0; Reset= 0; Clk= 1;
		#20  WriteData= 32'hBADF000D; ReadSelect1= 0; ReadSelect2= 1; WriteSelect= 0; WriteEnable= 0; Reset= 0; Clk= 0;
		#20  WriteData= 32'hBADF000D; ReadSelect1= 0; ReadSelect2= 1; WriteSelect= 0; WriteEnable= 0; Reset= 0; Clk= 1;		
		#20  $finish;      // Terminate simulation
	end
      
endmodule

