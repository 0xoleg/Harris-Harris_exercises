`include "top.sv"

module testbench();

parameter PERIOD = 4;

logic clk, rst;
logic out;

top DUT(clk, rst, out);

// clk generate
initial begin
  clk = 0;
  forever begin
    #(PERIOD/2) clk = ~clk;
  end
end

// reset
initial begin
  rst = 1;
  #(PERIOD*2);
  rst = 0;
end

// some logic
initial begin
  
  $stop();
end

endmodule