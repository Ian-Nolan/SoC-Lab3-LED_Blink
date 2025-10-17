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
    
    output logic [3:0] led_out
   );
   
   // signal declaration
   logic [3:0] led_out_buffer;
   logic [31:0] led0_timer, led0_ntimer;
   logic [31:0] led1_timer, led1_ntimer;
   logic [31:0] led2_timer, led2_ntimer;
   logic [31:0] led3_timer, led3_ntimer;

   logic [63:0] led0_count, led0_ncount;
   logic [63:0] led1_count, led1_ncount;
   logic [63:0] led2_count, led2_ncount;
   logic [63:0] led3_count, led3_ncount;
   

   
   always_ff @(posedge clk, posedge reset)
      if (reset)
         led0_timer <= 0;
      else   
        led0_timer <= led0_ntimer;
   
   always_ff @(posedge clk, posedge reset)
      if (reset)
         led1_timer <= 0;
      else   
        led1_timer <= led1_ntimer;
   
   always_ff @(posedge clk, posedge reset)
      if (reset)
         led2_timer <= 0;
      else   
        led2_timer <= led2_ntimer;
   
   always_ff @(posedge clk, posedge reset)
      if (reset)
         led3_timer <= 0;
      else   
        led3_timer <= led3_ntimer;


   
   always_ff @(posedge clk, posedge reset)
      if (reset) begin
         led0_count <= 0;
         led_out_buffer <= 0;
      end
      else   
        led0_count <= led0_ncount;
   
   always_ff @(posedge clk, posedge reset)
      if (reset)
         led1_count <= 0;
      else   
        led1_count <= led1_ncount;
        
   always_ff @(posedge clk, posedge reset)
      if (reset)
         led2_count <= 0;
      else   
        led2_count <= led2_ncount;
   
   always_ff @(posedge clk, posedge reset)
      if (reset)
         led3_count <= 0;
      else   
        led3_count <= led3_ncount;
   
   
   
   always_comb begin
        rd_data = 32'd0;
        led_out = led_out_buffer;
        
        
        if (led0_count < {12'd0, led0_timer, 20'b0}) begin
            led0_ncount = 0;
            led_out_buffer[0] = ~led_out_buffer[0];
        end
        else
            led0_ncount = led0_count + 1;
        
        
        if (led1_count < {12'd0, led1_timer, 20'b0}) begin
            led1_ncount = 0;
            led_out_buffer[1] = ~led_out_buffer[1];
        end
        else
            led1_ncount = led1_count + 1;
        
        
        if (led2_count < {12'd0, led2_timer, 20'b0}) begin
            led2_ncount = 0;
            led_out_buffer[2] = ~led_out_buffer[2];
        end
        else
            led2_ncount = led2_count + 1;
        
        
        if (led3_count < {12'd0, led3_timer, 20'b0}) begin
            led3_ncount = 0;
            led_out_buffer[3] = ~led_out_buffer[3];
        end
        else
            led3_ncount = led3_count + 1;
        
        
        
        if (cs && write) begin
            case (addr)
                5'd0: begin
                    led0_ntimer = wr_data[31:0];
                    led1_ntimer = led1_timer;
                    led2_ntimer = led2_timer;
                    led3_ntimer = led3_timer;
                end
                
                5'd1: begin
                    led1_ntimer = wr_data[31:0];
                    led0_ntimer = led0_timer;
                    led2_ntimer = led2_timer;
                    led3_ntimer = led3_timer;
                end
                
                5'd2: begin
                    led2_ntimer = wr_data[31:0];
                    led0_ntimer = led0_timer;
                    led1_ntimer = led1_timer;
                    led3_ntimer = led3_timer;
                end
                
                5'd3: begin
                    led3_ntimer = wr_data[31:0];
                    led0_ntimer = led0_timer;
                    led1_ntimer = led1_timer;
                    led2_ntimer = led2_timer;
                end
                
                default: begin
                    led0_ntimer = led0_timer;
                    led1_ntimer = led1_timer;
                    led2_ntimer = led2_timer;
                    led3_ntimer = led3_timer;
                end
            endcase
        end
    end
endmodule
