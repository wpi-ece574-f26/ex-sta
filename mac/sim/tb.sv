module tb;
   logic [7:0] x1;
   logic [7:0] x2;
   logic [9:0] m;
   logic [9:0] y;
   logic reset;
   logic clk;

   mac dut(.x1(x1), 
	   .x2(x2), 
	   .m(m), 
	   .y(y), 
	   .reset(reset), 
	   .clk(clk));
   
   always
   begin
      clk = 1'b0;
      #5 clk = 1'b1;
      #5;
   end

   always_ff @(posedge clk)
   begin
      $display("x1 %d x2 %d m %d y %d", x1, x2, m, y);
   end
   
   initial
   begin
      $dumpfile("trace.vcd");
      $dumpvars(0, tb);
      x1 = 8'd32;
      x2 = 8'd2;
      reset = 1'b1;
      repeat(3)
         @(posedge clk);
      reset = 1'b0;
      
      repeat(30)
        @(posedge clk);
      
      $finish;
   end
   
endmodule
