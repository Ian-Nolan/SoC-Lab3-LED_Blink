`timescale 1ns / 1ps


//module nolan_led_lab3_tb;

       
//    logic clk;
//    logic reset;
    
//    logic cs;
//    logic read;
//    logic write;
//    logic [4:0] addr;
//    logic [31:0] wr_data;
//    logic [31:0] rd_data;
    
//    logic [3:0] led_out;
    
    
//    nolan_led_lab3 dut(
//        .clk(clk),
//        .reset(reset),
//        // slot interface
//        .cs(cs),
//        .read(read),
//        .write(write),
//        .addr(addr),
//        .wr_data(wr_data),
//        .rd_data(rd_data),
        
//        .led_out(led_out)
//    );
    
    
    
//    initial begin
//        clk = 0;
//        forever begin
//            #5 clk = ~clk;
//        end
        
//        reset = 1;
//        #3;
//        reset = 0;
//        #3;
//        addr = 0;
//        #1;
//        wr_data = 5;
//        #1;
//        cs = 1;
//        #3;
//        write = 1;
//        #300;
        
//        $finish;
//    end
//endmodule



`timescale 1ns / 1ps

module nolan_led_lab3_tb;

    logic clk;
    logic reset;

    logic cs;
    logic read;
    logic write;
    logic [4:0] addr;
    logic [31:0] wr_data;
    logic [31:0] rd_data;

    logic [3:0] led_out;

    // Instantiate the DUT
    nolan_led_lab3 dut (
        .clk(clk),
        .reset(reset),
        .cs(cs),
        .read(read),
        .write(write),
        .addr(addr),
        .wr_data(wr_data),
        .rd_data(rd_data),
        .led_out(led_out)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin
        // Initialize signals
        clk = 0;
        reset = 1;
        cs = 0;
        read = 0;
        write = 0;
        addr = 0;
        wr_data = 0;

        // Apply reset
        #10;
        reset = 0;

        // Write timer value to LED0
        #10;
        addr = 5'd0;
        wr_data = 32'd5; // Set LED0 timer to 5
        cs = 1;
        write = 1;
        #10;
        cs = 0;
        write = 0;

        // Optionally write to other LEDs
        #10;
        addr = 5'd1;
        wr_data = 32'd10;
        cs = 1;
        write = 1;
        #10;
        cs = 0;
        write = 0;

        // Observe LED output
        #1000;

        $finish;
    end
endmodule















