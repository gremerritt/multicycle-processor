
// This can be used to replace the original nbit_register_file in lab6.
// In iSim you can actually expand this reg_file to view the contents in it. 

module nbit_register_file(write_data, 
                          read_data_1, read_data_2, 
                          read_sel_1, read_sel_2, 
                          write_address, RegWrite, clk);
                          
    parameter data_width = 32;
    parameter select_width = 5; 
                          
    input                                       clk, RegWrite;
    input           [data_width-1:0]            write_data;
    input           [4:0]                       read_sel_1, read_sel_2, write_address;
    output		     [data_width-1:0]            read_data_1, read_data_2;
    
    reg             [data_width-1:0]            register_file [0:data_width-1];
    
    // for loop initializes all registers to 0, no need to rst
    integer i;
    initial begin
        for (i = 0; i < 32; i = i + 1) begin 
            register_file[i] = 0*i;
        end     
    end
    

	 assign		read_data_1 = register_file[read_sel_1];
	 assign		read_data_2 = register_file[read_sel_2];

    
    always @ (posedge clk) begin
        if (RegWrite) 
            register_file[write_address] <= write_data;
    end
endmodule
