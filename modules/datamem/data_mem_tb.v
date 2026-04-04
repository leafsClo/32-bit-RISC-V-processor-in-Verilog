module data_mem
(
    input clk,
    input [31:0] address, //only the last 16 bits of the address will be used, the 16 most significant bit are gonna be zero padded
    input [7:0] write_data,
    input rw, //0 read , 1 write
    output reg [7:0] read_data
);

    reg [7:0] mem [0:65535];
    integer i;

    initial begin
        for (i = 0; i < 65536 ; i = i + 1) begin
            mem[i] = 8'b0;
        end
        $readmemh("image_read.mem", mem); //128x128 is taken in .mem file for now so
    end

    always @(posedge clk) begin
        if(rw) begin //write
            mem[address[15:0]] <= write_data;
        end
        else begin //read data
            read_data <= mem[address[15:0]];
        end
    end

endmodule
