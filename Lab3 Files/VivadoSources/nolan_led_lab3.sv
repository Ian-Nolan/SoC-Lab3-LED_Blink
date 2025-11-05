module nolan_led_lab3(
    input  logic clk,
    input  logic reset,
    // slot interface
    input  logic cs,
    input  logic read,
    input  logic write,
    input  logic [4:0] addr,
    input  logic [31:0] wr_data,
    output logic [31:0] rd_data,
    
    output logic [4:0] led_out
   );
   
   // signal declaration
   logic default_led_out;
   logic [4:0] led_out_buffer;
   logic [31:0] led0_timer, led0_ntimer;
   logic [31:0] led1_timer, led1_ntimer;
   logic [31:0] led2_timer, led2_ntimer;
   logic [31:0] led3_timer, led3_ntimer;
   
    led_blink_module blinker0(
    .clk(clk),
    .reset(reset),
    .timer_upper_bound(led0_timer),
    .out_signal(led_out_buffer[0])
   );
   
    led_blink_module blinker1(
    .clk(clk),
    .reset(reset),
    .timer_upper_bound(led1_timer),
    .out_signal(led_out_buffer[1])
   );
   
    led_blink_module blinker2(
    .clk(clk),
    .reset(reset),
    .timer_upper_bound(led2_timer),
    .out_signal(led_out_buffer[2])
   );
   
    led_blink_module blinker3(
    .clk(clk),
    .reset(reset),
    .timer_upper_bound(led3_timer),
    .out_signal(led_out_buffer[3])
   );


   always_ff @(posedge clk, posedge reset) begin
      if (reset) begin
        led0_ntimer <= 2000;
        led1_ntimer <= 1500;
        led2_ntimer <= 1000;
        led3_ntimer <= 500;
      end
      else begin
        led0_timer <= led0_ntimer;
        led1_timer <= led1_ntimer;
        led2_timer <= led2_ntimer;
        led3_timer <= led3_ntimer;
      end
   end
   
   always_comb begin
        rd_data = 32'd0;
        led_out_buffer[4] = default_led_out;
        led_out = led_out_buffer;
        
        if (cs && write) begin
            case (addr)
                5'd0: begin
                    led0_ntimer = wr_data[31:0];
                    led1_ntimer = led1_timer;
                    led2_ntimer = led2_timer;
                    led3_ntimer = led3_timer;
                    default_led_out = 0;
                end
                
                5'd1: begin
                    led1_ntimer = wr_data[31:0];
                    led0_ntimer = led0_timer;
                    led2_ntimer = led2_timer;
                    led3_ntimer = led3_timer;
                    default_led_out = 0;
                end
                
                5'd2: begin
                    led2_ntimer = wr_data[31:0];
                    led0_ntimer = led0_timer;
                    led1_ntimer = led1_timer;
                    led3_ntimer = led3_timer;
                    default_led_out = 0;
                end
                
                5'd3: begin
                    led3_ntimer = wr_data[31:0];
                    led0_ntimer = led0_timer;
                    led1_ntimer = led1_timer;
                    led2_ntimer = led2_timer;
                    default_led_out = 0;
                end
                
                default: begin
                    led0_ntimer = wr_data[31:0];      //testing
                    led1_ntimer = wr_data[31:0];      //testing
                    led2_ntimer = wr_data[31:0];      //testing
                    led3_ntimer = wr_data[31:0];      //testing
                    default_led_out = 1;
                end
            endcase
        end
    end
endmodule
