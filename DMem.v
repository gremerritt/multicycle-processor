// DMem
//
// A module used to mimic the behavior of a computer's 
// data memory for EC413 Design Project.
//

module DMem(WriteData,   // Input data into the memory
            MemData,     // Output data from the memory
            Address,     // Address of data to be read/written
            MemWrite,    // When high, causes write to take place on posedge
            Clk);        // Clock
                          
    parameter DATA_WIDTH = 32;
    parameter ADDRESS_WIDTH = 16; 
                          
    input  Clk, MemWrite;
    input  [DATA_WIDTH-1:0] WriteData;
    input  [ADDRESS_WIDTH-1:0] Address;
    output [DATA_WIDTH-1:0] MemData;
    
    reg [DATA_WIDTH-1:0] mem_data [0:DATA_WIDTH-1];
    
    // for loop initializes all registers to 0, no need to rst
    integer i;
    initial begin
		  // this should actually be (i < (2 ** ADDRESS_WIDTH)) but the loop counter doesn't got that high...
        for (i = 0; i < DATA_WIDTH; i = i + 1) begin 
            mem_data[i] = 0;
        end     
    end
    
	 assign MemData = mem_data[Address];

    always @ (posedge Clk) begin
        if (MemWrite) 
            mem_data[Address] <= WriteData;
    end
endmodule

