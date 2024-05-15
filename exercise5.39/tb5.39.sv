`include "../adder_float.sv"

module testbench();
logic [31:0] a, b, y;

adder_float DUT(a, b, y);

initial begin
  a = $shortrealtobits(1.0);
  b = $shortrealtobits(1.0);
  #5;
  $display("a = %f\nb = %f\na+b = %f\n", $bitstoshortreal(a), $bitstoshortreal(b), $bitstoshortreal(y));
  #5;
  a = $shortrealtobits(0.5);
  b = $shortrealtobits(0.25);
  #5;
  $display("a = %f\nb = %f\na+b = %f\n", $bitstoshortreal(a), $bitstoshortreal(b), $bitstoshortreal(y));
  #5;
  a = $shortrealtobits(0.5);
  b = $shortrealtobits(0.0625);
  #5;
  $display("a = %f\nb = %f\na+b = %f\n", $bitstoshortreal(a), $bitstoshortreal(b), $bitstoshortreal(y));
  #5;
  a = $shortrealtobits(0.3);
  b = $shortrealtobits(0.25);
  #5;
  $display("a = %f\nb = %f\na+b = %f\n", $bitstoshortreal(a), $bitstoshortreal(b), $bitstoshortreal(y));
  #5;
  a = $shortrealtobits(0.3);
  b = $shortrealtobits(0.6);
  #5;
  $display("a = %f\nb = %f\na+b = %f\n", $bitstoshortreal(a), $bitstoshortreal(b), $bitstoshortreal(y));
  #5;
  a = $shortrealtobits(0.5);
  b = $shortrealtobits(1.0);
  #5;
  $display("a = %f\nb = %f\na+b = %f\n", $bitstoshortreal(a), $bitstoshortreal(b), $bitstoshortreal(y));
  #5;
  a = $shortrealtobits(19.34);
  b = $shortrealtobits(8.356);
  #5;
  $display("a = %f\nb = %f\na+b = %f\n", $bitstoshortreal(a), $bitstoshortreal(b), $bitstoshortreal(y));
  #5;
  a = $shortrealtobits(1.0);
  b = $shortrealtobits(-0.5);
  #5;
  $display("a = %f\nb = %f\na+b = %f\n", $bitstoshortreal(a), $bitstoshortreal(b), $bitstoshortreal(y));
  #5;
  a = $shortrealtobits(-1.0);
  b = $shortrealtobits(0.5);
  #5;
  $display("a = %f\nb = %f\na+b = %f\n", $bitstoshortreal(a), $bitstoshortreal(b), $bitstoshortreal(y));
  #5;
  a = $shortrealtobits(-0.8);
  b = $shortrealtobits(11.7);
  #5;
  $display("a = %f\nb = %f\na+b = %f\n", $bitstoshortreal(a), $bitstoshortreal(b), $bitstoshortreal(y));
  #5;
  $finish();
end

endmodule