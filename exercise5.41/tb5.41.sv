`include "../prefix_adder_32bit.sv"

module testbench();
parameter SIZE = 16;

logic [SIZE-1] a, b, y;

prefix_adder_32bit #(.SIZE(SIZE)) DUT(0, 0, a, b, y);

initial begin
  $display("a = %d\nb = %d\na+b = %d or %b\n", a, b, y, y);
  #2;
  $stop();
end

endmodule