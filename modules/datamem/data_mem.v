module data_mem_tb();

    reg clk;
    reg [31:0] address;
    reg [7:0] write_data;
    reg rw; //0 read , 1 write
    wire [7:0] read_data; //output must be wire in TB

    data_mem testbench1 (clk,address, write_data, rw, read_data);

    initial begin
        clk = 0;
        forever #10 clk = ~clk;
    end

    initial begin
        // Initialize
        address = 32'h00;
        rw = 0;
        write_data = 8'h00;
        #20

        address = 32'h00;
        rw = 0;
        write_data = 8'h69;
        #20
        address = 32'h04;
        rw = 1;
        write_data = 8'h69;
        #20
        address = 32'h04;
        rw = 0;
        write_data = 8'h69;
        #20
        address = 32'h04;
        rw = 0;
        write_data = 8'h69;
        #20
        address = 32'h00;
        rw = 0;
        write_data = 8'h69;
        #20
        address = 32'h00;
        rw = 1;
        write_data = 8'h69;
        #20
        address = 32'h00;
        rw = 1;
        write_data = 8'h69;

        #100 $finish;
    end

endmodule
