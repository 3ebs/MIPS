module clock(clk);
  output reg clk;
  initial begin
  	 clk = 0;
  end
  always 
	  begin
		  #1000 clk = ~clk;
	  end   
endmodule