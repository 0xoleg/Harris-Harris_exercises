`include "../prefix_adder_32bit.sv"

module testbench();
parameter SIZE = 16;

logic [SIZE-1] a, b, y;
logic cout;

prefix_adder_32bit DUT(0, a, b, y, cout);

initial begin
  a = 16'd4;
  b = 16'd8;
  #1;
  $display("a = %d\nb = %d\na+b = %d or %b\n\n", a, b, y, y);
  #1;
  a = 16'd0;
  b = 16'd65_535;
  #1;
  $display("a = %d\nb = %d\na+b = %d or %b\n\n", a, b, y, y);
  #1;
  a = 16'd1;
  b = 16'd65_535;
  #1;
  $display("a = %d\nb = %d\na+b = %d or %b\n\n", a, b, y, y);
  #1;
  a = 16'd1;
  b = 16'd1;
  #1;
  $display("a = %d\nb = %d\na+b = %d or %b\n\n", a, b, y, y);
  #1;
  a = 16'd32;
  b = 16'd546;
  #1;
  $display("a = %d\nb = %d\na+b = %d or %b\n\n", a, b, y, y);
  #1;
  $stop();
end

endmodule