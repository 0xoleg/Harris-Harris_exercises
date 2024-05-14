

module testbench();
logic [31:0] f;
shortreal f_expected = 0.5;

initial begin
  #5;
  f = 32'h3F000000;
  if (f === $shortrealtobits(f_expected)) $display("It's Ok! f: %b\n", f);
  else           $display("Suka blyat'!\nf: %b\nf expected: %b\n", f, $shortrealtobits(f_expected));
end

endmodule