
module led_blink_module(
    input  logic clk,
    input  logic reset,
    input  logic [31:0] timer_upper_bound,
    output  logic out_signal
   );
   
   logic out_signal_buffer, toggle_flag, n_toggle_flag;
   logic [31:0] count, ncount;
   //logic [63:0] timer_upper_bound_buffer;
   

   always_ff @(posedge clk, posedge reset)
      if (reset) begin
         count <= 0;
         out_signal_buffer <= 0;
      end
      else begin
         count <= ncount;
         if (count == 2)
            out_signal_buffer <= ~out_signal_buffer;
      end
   
   always_comb begin
        out_signal = out_signal_buffer;
        //timer_upper_bound_buffer = {32'b0, timer_upper_bound, 0'b0};
        
        if (count >= timer_upper_bound * 100000) begin  // * 100000
        //if (led0_count < {12'd0, led0_timer, 20'b0}) begin
            ncount = 1;
            //out_signal_buffer = reset ? 1'b0 : ~out_signal_buffer;
        end
        else
            ncount = count + 1;
    end
endmodule
