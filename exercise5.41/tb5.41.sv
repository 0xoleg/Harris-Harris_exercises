`include "../prefix_adder_32bit.sv"

module testbench();
parameter SIZE = 32;

logic [SIZE-1] a, b, y;
logic cout;

prefix_adder_32bit DUT(0, a, b, y, cout);

initial begin
  a = 32'd4;
  b = 32'd8;
  #1;
  $display("a = %d\nb = %d\na+b = %d or %b\n\n", a, b, y, y);
  #1;
  a = 32'd0;
  b = 32'd65_535;
  #1;
  $display("a = %d\nb = %d\na+b = %d or %b\n\n", a, b, y, y);
  #1;
  a = 32'd1;
  b = 32'd65_535;
  #1;
  $display("a = %d\nb = %d\na+b = %d or %b\n\n", a, b, y, y);
  #1;
  a = 32'd1;
  b = 32'd1;
  #1;
  $display("a = %d\nb = %d\na+b = %d or %b\n\n", a, b, y, y);
  #1;
  a = 32'd32;
  b = 32'd546;
  #1;
  $display("a = %d\nb = %d\na+b = %d or %b\n\n", a, b, y, y);
  #1;
  a = '1;
  b = '0;
  #1;
  $display("a = %d\nb = %d\na+b = %d or %b\n\n", a, b, y, y);
  #1;
  a = '1;
  b = 1'b1;
  #1;
  $display("a = %d\nb = %d\na+b = %d or %b\n\n", a, b, y, y);
  #1;
  $stop();
end

endmodule