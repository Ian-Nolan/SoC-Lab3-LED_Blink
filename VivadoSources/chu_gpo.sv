module chu_gpo
   #(parameter W = 8)  // width of output port
   (
    input  logic clk,
    input  logic reset,
    // slot interface
    input  logic cs,
    input  logic read,
    input  logic write,
    input  logic [4:0] addr,
    input  logic [31:0] wr_data,
    output logic [31:0] rd_data,
    // external port    
    output logic [10:0] dout
   );

   // declaration
   logic [10:0] buf_reg;
   logic wr_en;

   // body
   // output buffer register
   always_ff @(posedge clk, posedge reset)
      if (reset)
         buf_reg <= 0;
      else   begin
         if (wr_en)
            buf_reg <= wr_data[10:0];
      end
            
            
   // decoding logic 
   assign wr_en = cs && write;
   // slot read interface
   assign rd_data =  0;
   // external output  
   assign dout = buf_reg;
endmodule
       



